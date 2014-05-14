//
//  SLTRequest.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTRequest.h"
#import "NSString+SLTEncoding.h"

static const NSTimeInterval kRequestTimeout = 60;

@interface SLTRequest()

@property (copy) NSURL *baseUrl;
@property (strong) id<SLTTrackEvent> trackEvent;

@end

@implementation SLTRequest


- (instancetype) initWithBaseUrl:(NSString *) baseUrl andTrackEvent:(id<SLTTrackEvent>) trackEvent {
  self = [super init];
  if (self) {
    _baseUrl = [NSURL URLWithString:baseUrl];
    _trackEvent = trackEvent;
  }
  return self;
}

- (void)main
{
  NSMutableURLRequest *request = [self requestForTrackEvent:self.trackEvent];
  
  NSLog(@"Handle Request %@, canHandleRequest %i, mainThread %i", request.URL.absoluteString, [NSURLConnection canHandleRequest:request], [NSThread isMainThread]);
  
  NSHTTPURLResponse *response = nil;
  NSError *error = nil;
  NSData *data = [NSURLConnection sendSynchronousRequest:request
                                       returningResponse:&response
                                                   error:&error];
  
  // connection error
  if (error != nil) {
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Event not delivered! %@, %@, %@", responseString, error, [self curlOf: request]);
    return;
  }
  
  // wrong status code
  if (response.statusCode < 200 || response.statusCode > 299) {
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Wrong statusCode! Event not delivered! %@, %@", responseString, [self curlOf: request]);
    return;
  }
  
  // success
  NSLog(@"Event tracked %@", request);
  
  
}


- (NSMutableURLRequest *)requestForTrackEvent:(id<SLTTrackEvent>) trackEvent {
  
  NSURL *url = nil;
  
  if([trackEvent trackEventPath]) {
    url = [NSURL URLWithString:[trackEvent trackEventPath] relativeToURL:self.baseUrl];
  }
  else {
    url = self.baseUrl;
  }
  
  
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  request.timeoutInterval = kRequestTimeout;
  request.HTTPMethod = @"POST";
  request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
  
  [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  
  if([trackEvent trackEventClientSdk]) {
    [request setValue:[trackEvent trackEventClientSdk] forHTTPHeaderField:@"clientSdk"];
  }

  if([trackEvent trackEventUserAgent]) {
    [request setValue:[trackEvent trackEventUserAgent] forHTTPHeaderField:@"User-Agent"];
  }

//  if([trackEvent trackEventParameters]) {
//    NSData *data = [self bodyForParameters:[trackEvent trackEventParameters]];
//    NSLog(@"send %@", data);
//    if(data) {
//      [request setHTTPBody:data];
//    }
//  }
  
  return request;
}

- (NSData *)bodyForParameters:(NSDictionary *)parameters {
  if(!parameters || parameters.count<=0) return nil;
  
  NSMutableArray *pairs = [NSMutableArray array];
  for (NSString *key in parameters) {
    NSString *value = [parameters objectForKey:key];
    NSString *escapedValue = [value slt_urlEncode];
    NSString *pair = [NSString stringWithFormat:@"%@=%@", key, escapedValue];
    [pairs addObject:pair];
  }
  
  NSString *bodyString = [pairs componentsJoinedByString:@"&"];
  
  NSData *body = [NSData dataWithBytes:bodyString.UTF8String length:bodyString.length];
  return body;
}

- (NSString *) curlOf:(NSURLRequest *) request
{
  __block NSString *curlString = [NSString stringWithFormat:@"curl -k -X %@ --dump-header -", request.HTTPMethod];
  
  [[request allHTTPHeaderFields] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    curlString = [curlString stringByAppendingFormat:@" -H \"%@: %@\"",key, obj];
  }];
  
  NSString *data = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
  
  if (data)
  {
    curlString = [curlString stringByAppendingFormat:@" -d \"%@\"",data];
  }
  
  curlString = [curlString stringByAppendingFormat:@" %@",request.URL.absoluteString];
  
  return curlString;
}

@end

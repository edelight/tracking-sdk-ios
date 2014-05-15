//
//  SLTRequestHandler.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTRequestHandler.h"
#import "SLTRequest.h"
#import "SLTLogger.h"

static NSString * const kRequestQueueName = @"com.shoplove.requestHandlerQueue";


@interface SLTRequestHandler()

@property (strong) NSOperationQueue *requestQueue;
@property (strong) id<SLTHTTPConfig> httpConfig;

@end


@implementation SLTRequestHandler

- (instancetype) initWithHTTPConfig:(id<SLTHTTPConfig>) httpConfig {
  self = [super init];
  if (self) {
    self.httpConfig = httpConfig;
    self.requestQueue = [[NSOperationQueue alloc] init];
    self.requestQueue.name = kRequestQueueName;
  }
  return self;
}

- (void) addTrackEvent:(id<SLTTrackEvent>) trackEvent {
  
  if([self validateTrackEvent:trackEvent]) {
    SLTRequest *request = [[SLTRequest alloc] initWithBaseUrl:[self.httpConfig baseUrl] andTrackEvent:trackEvent];
    [self.requestQueue addOperation:request];
  }
}

- (BOOL) validateTrackEvent:(id<SLTTrackEvent>) trackEvent {
  
  if([trackEvent trackEventParameters] && [trackEvent trackEventParameters].count) {
    return YES;
  }
  else {
    [[SLTLogger sharedLogger] warn:@"Not a valid TrackEvent %@", trackEvent];
    return NO;
  }
}



@end

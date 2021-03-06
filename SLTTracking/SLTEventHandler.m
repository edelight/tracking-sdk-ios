//
//  SLTEventHandler.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTEventHandler.h"
#import "SLTRequestHandler.h"
#import "SLTShopLoveConfig.h"
#import "SLTEvent.h"
#import "UIDevice+SLTDeviceUtility.h"
#import "NSString+SLTEncoding.h"
#import "SLTLogger.h"

@interface SLTEventHandler()

@property (strong) SLTRequestHandler *requestHandler;
@property (strong) id<SLTHTTPConfig> config;

@end


@implementation SLTEventHandler

- (instancetype)initWithAppToken:(NSString *) appToken
{
  NSUUID *uuidAppToken = [[NSUUID alloc] initWithUUIDString:appToken];
  if (!uuidAppToken) {
    [[SLTLogger sharedLogger] error:@"Not a valid AppToken '%@'!", appToken];
    return nil;
  }
  
  
  self = [super init];
  if (self) {
    _appToken = uuidAppToken;
    
    _config = [[SLTShopLoveConfig alloc] init];
    _requestHandler = [[SLTRequestHandler alloc] initWithHTTPConfig:_config];
  }
  return self;
}

- (void) track:(NSString *) action
{
  if(action && ![action isEqualToString:@""]) {
    SLTEvent *event = [[SLTEvent alloc] initWithPath:nil
                                             headers:[self baseHeaders]
                                          parameters:@{@"action":action}];
    
    [self trackEvent:event];
  }
}

- (void) trackEvent:(id<SLTTrackEvent>) trackEvent
{
  [self.requestHandler addTrackEvent:trackEvent];
}

- (NSDictionary *) baseHeaders
{
  NSMutableDictionary *headers = [NSMutableDictionary dictionary];
  
  if([self.config userAgent] && ![[self.config userAgent] isEqualToString:@""]) {
    [headers addEntriesFromDictionary:@{@"User-Agent" : [self.config userAgent]}];
  }

  if([self.config clientSdk] && ![[self.config clientSdk] isEqualToString:@""]) {
    [headers addEntriesFromDictionary:@{@"ClientSdk" : [self.config clientSdk]}];
  }
  
  if([self.config macAddress] && ![[self.config macAddress] isEqualToString:@""]) {
    [headers addEntriesFromDictionary:@{@"MacAddress" : [self.config macAddress]}];
  }
  
  if([self.config vendorId] && ![[self.config vendorId] isEqualToString:@""]) {
    [headers addEntriesFromDictionary:@{@"VendorId" : [self.config vendorId]}];
  }

  if(self.appToken) {
    [headers addEntriesFromDictionary:@{@"AppToken" : [self.appToken UUIDString]}];
  }
  
  return headers;
}


@end

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

@interface SLTEventHandler()

@property (strong) SLTRequestHandler *requestHandler;
@property (strong) id<SLTHTTPConfig> config;

@end


@implementation SLTEventHandler

- (instancetype)initWithAppToken:(NSString *) appToken {
  self = [super init];
  if (self) {
    _appToken = appToken;
    
    _config = [[SLTShopLoveConfig alloc] init];
    _requestHandler = [[SLTRequestHandler alloc] initWithHTTPConfig:_config];
  }
  return self;
}

- (void) track:(NSString *) name {
  SLTEvent *event = [[SLTEvent alloc] initWithPath:nil
                                         userAgent:[self.config userAgent]
                                         clientSdk:[self.config clientSdk]
                                        parameters:@{@"action":name}];
  
  [self trackEvent:event];
}

- (void) trackEvent:(id<SLTTrackEvent>) trackEvent {
  [self.requestHandler addTrackEvent:trackEvent];
}


@end

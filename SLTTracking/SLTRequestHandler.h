//
//  SLTRequestHandler.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTHTTPConfig.h"
#import "SLTTrackEvent.h"

@class SLTRequest;

@interface SLTRequestHandler : NSObject

- (instancetype) initWithHTTPConfig:(id<SLTHTTPConfig>) httpConfig;

- (void) addTrackEvent:(id<SLTTrackEvent>) trackEvent;

@end

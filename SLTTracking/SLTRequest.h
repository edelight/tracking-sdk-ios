//
//  SLTRequest.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTTrackEvent.h"


@interface SLTRequest : NSOperation

- (instancetype) initWithBaseUrl:(NSString *) baseUrl andTrackEvent:(id<SLTTrackEvent>) trackEvent;

- (void) main;

@end

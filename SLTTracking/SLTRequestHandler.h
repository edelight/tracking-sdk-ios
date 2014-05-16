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


/**
 *  The SLTRequestHandler acts as a Manager of all SLTRequests.
 *  It holds its own NSOperationQueue to enqueue all requests and thus
 *  the requests will be handled in the background and wont block the main thread.
 */
@interface SLTRequestHandler : NSObject

/**
 *  Creates and initializes new SLTRequestHandler object. The configuration will be used to create appropriate SLTRequests.
 *
 *  @param httpConfig The configuration needed to create the SLTRequests.
 *
 *  @return An initialized object.
 */
- (instancetype) initWithHTTPConfig:(id<SLTHTTPConfig>) httpConfig;

/**
 *  Creates a new SLTRequest out of the passed trackEvent data and enqueues it.
 *
 *  @param trackEvent The TrackEvent to send.
 *
 *  @return True, if it is a valid trackEvent that can be enqueued.
 */
- (BOOL) addTrackEvent:(id<SLTTrackEvent>) trackEvent;

@end

//
//  SLTEventHandler.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTTrackEvent.h"

/**
 *  A SLTEventHandler is used to 
 */
@interface SLTEventHandler : NSObject

/** The used AppToken. */
@property (copy, readonly) NSUUID *appToken;

/**
 *  Creates and returns a new SLTEventHandler object with the passed appToken.
 *
 *  @param appToken The AppToken for the ShopLoveTracking Framework.
 *
 *  @return A new SLTEventHandler object. Returns nil for invalid appTokens.
 */
- (instancetype)initWithAppToken:(NSString *) appToken;

/**
 *  Tracks a new event.
 *  The action will be sent to the ShopLove API via a POST Request.
 *
 *  @param action The action to track.
 */
- (void) track:(NSString *) action;

@end

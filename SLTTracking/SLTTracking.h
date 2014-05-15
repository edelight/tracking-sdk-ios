//
//  SLTTracking.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * The base interface of the ShopLoveTracking Framework.
 */
@interface SLTTracking : NSObject

/**
 * Call +appDidLaunch: in your -application:didFinishLaunchingWithOptions: method to activate the ShopLoveTracking.
 *
 * This method must be called before any other method of the ShopLoveTracking Framework gets invoked.
 *
 *  @param appToken Your AppToken.
 */
+ (void)appDidLaunch:(NSString *)appToken;

/**
 * Returns the UUID representation of the passed AppToken in +appDidLaunch:.
 *
 *  @return The used AppToken.
 */
+ (NSUUID *)appToken;


@end

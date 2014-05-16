//
//  SLTHTTPConfig.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  These values are required to setup the ShopLoveTracking Framework.
 */
@protocol SLTHTTPConfig <NSObject>

/**
 *  This value will be used for the User-Agent header field in every POST Request.
 *
 *  @return A valid User-Agent.
 */
- (NSString *) userAgent;

/**
 * Represents the base URL for each Request.
 *
 *  @return The Url.
 */
- (NSString *) baseUrl;

/**
 *
 *
 *  @return The version number of the currently used SDK.
 */
- (NSString *) clientSdk;

/**
 *  The MAC Address of the device.
 *
 *  @return The MAC Address.
 */
- (NSString *) macAddress;

/**
 *  A unique identifier of the device.
 *  Usually the [[UIDevice currentDevice] identifierForVendor].
 *
 *  @return The identifier.
 */
- (NSString *) vendorId;

@end

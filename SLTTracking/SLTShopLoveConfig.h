//
//  SLTShopLoveConfig.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTHTTPConfig.h"

/**
 *  The basic configuration for the ShopLove API.
 */
@interface SLTShopLoveConfig : NSObject <SLTHTTPConfig>

@property (nonatomic, copy, readonly) NSString *baseUrl;
@property (nonatomic, copy, readonly) NSString *userAgent;
@property (nonatomic, copy, readonly) NSString *clientSdk;
@property (nonatomic, copy, readonly) NSString *macAddress;
@property (nonatomic, copy, readonly) NSString *vendorId;

@end

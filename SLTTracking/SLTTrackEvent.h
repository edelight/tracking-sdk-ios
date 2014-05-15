//
//  SLTTrackEvent.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  All POST Requests made by the ShopLoveTracking Framework need these values.
 */
@protocol SLTTrackEvent <NSObject>

/**
 * This path will be appended to the base Url.
 *
 *  @return Path to append.
 */
- (NSString *) trackEventPath;

/**
 *  The Header parameters for the POST Request.
 *
 *  @return Header fields.
 */
- (NSDictionary *) trackEventHeaders;

/**
 *  The Body parameters for the POST Request.
 *
 *  @return Body fields.
 */
- (NSDictionary *) trackEventParameters;

@end

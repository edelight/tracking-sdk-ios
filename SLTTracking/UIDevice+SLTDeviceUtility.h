//
//  UIDevice+SLTDeviceUtility.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Provides some helper methods to get more information of the current device.
 */
@interface UIDevice (SLTDeviceUtility)

/**
 *  @return A string representation of the current device (like iPhone5,1).
 */
- (NSString *) slt_platform;

/**
 *  @return The MAC Address of the device.
 */
- (NSString *) slt_macAddress;

@end

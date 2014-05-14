//
//  SLTTracking.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTTracking : NSObject

+ (void)appDidLaunch:(NSString *)appToken;

+ (NSString *)appToken;

+ (void) trackInstall;

@end

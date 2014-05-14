//
//  SLTEventHandler.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTTrackEvent.h"

@interface SLTEventHandler : NSObject

@property (copy, readonly) NSString *appToken;

- (instancetype)initWithAppToken:(NSString *) appToken;

- (void) track:(NSString *) name;

@end

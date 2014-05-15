//
//  SLTEvent.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTTrackEvent.h"

@interface SLTEvent : NSObject <SLTTrackEvent>

@property (copy) NSString *trackEventPath;
@property (strong) NSDictionary *trackEventHeaders;
@property (strong) NSDictionary *trackEventParameters;

- (instancetype) initWithPath:(NSString *) path
                      headers:(NSDictionary *) headers
                   parameters:(NSDictionary *) params;

@end

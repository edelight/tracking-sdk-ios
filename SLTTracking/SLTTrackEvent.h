//
//  SLTTrackEvent.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLTTrackEvent <NSObject>

- (NSString *) trackEventPath;
- (NSString *) trackEventUserAgent;
- (NSString *) trackEventClientSdk;
- (NSDictionary *) trackEventParameters;

@end

//
//  SLTTracking.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTTracking.h"
#import "SLTEventHandler.h"
#import "SLTTrackEvent.h"

@interface SLTTracking()


@end


@implementation SLTTracking

static SLTEventHandler *__sharedEventHandler;
static dispatch_once_t __baseInitializationToken;


+ (void)appDidLaunch:(NSString *)appToken {
  dispatch_once(&__baseInitializationToken, ^{
    __sharedEventHandler = [[SLTEventHandler alloc] initWithAppToken:appToken];;
  });
}

+ (SLTEventHandler *) base {
  return __sharedEventHandler;
}

+ (NSString *)appToken {
  return [SLTTracking base].appToken;
}

+ (void) trackInstall {
  [[SLTTracking base] track:@"install"];
}

@end

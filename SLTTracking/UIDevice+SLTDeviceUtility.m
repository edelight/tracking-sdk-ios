//
//  UIDevice+SLTDeviceUtility.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "UIDevice+SLTDeviceUtility.h"
#include <sys/sysctl.h>

@implementation UIDevice (SLTDeviceUtility)

- (NSString *) slt_platform
{
  NSString *platform = nil;
  
  size_t size;
  sysctlbyname("hw.machine", NULL, &size, NULL, 0);
  char *machine = malloc(size);
  sysctlbyname("hw.machine", machine, &size, NULL, 0);
  platform = @(machine);
  free(machine);
  
  return platform;
}

@end

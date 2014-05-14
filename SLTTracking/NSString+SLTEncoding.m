//
//  NSString+SLTEncoding.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "NSString+SLTEncoding.h"

@implementation NSString (SLTEncoding)


- (NSString *) slt_urlEncode {
  return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                               NULL,
                                                                               (CFStringRef)self,
                                                                               NULL,
                                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                               CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
}

@end

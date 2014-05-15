//
//  NSString+SLTEncoding.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "NSString+SLTEncoding.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SLTEncoding)


- (NSString *) slt_urlEncode {
  return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                               NULL,
                                                                               (CFStringRef)self,
                                                                               NULL,
                                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                               CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
}

- (NSString *) slt_md5 {
  const char *cStr = [self UTF8String];
  unsigned char digest[CC_MD5_DIGEST_LENGTH];
  CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
  
  NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
  
  for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
    [output appendFormat:@"%02x", digest[i]];
  }
  
  return  output;
}
@end

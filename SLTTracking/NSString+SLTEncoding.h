//
//  NSString+SLTEncoding.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Category with some helper methods to encode NSStrings.
 */
@interface NSString (SLTEncoding)

/**
 *  @return A percent escaped representation of the string.
 */
- (NSString *) slt_urlEncode;

/**
 *  @return A md5 hashed string.
 */
- (NSString *) slt_md5;

@end

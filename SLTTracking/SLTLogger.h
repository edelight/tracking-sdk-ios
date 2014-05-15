//
//  SLTLogger.h
//  SLTTracking
//
//  Created by Michael Banholzer on 15/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
  SLTLogLevelNoLogging  = 0,
  SLTLogLevelVerbose    = 1,
  SLTLogLevelDebug      = 2,
  SLTLogLevelInfo       = 3,
  SLTLogLevelWarn       = 4,
  SLTLogLevelError      = 5,
  SLTLogLevelAssert     = 6
} SLTLogLevel;


/**
 *
 */
@protocol SLTLogger

- (void)setLogLevel:(SLTLogLevel)logLevel;

- (void)verbose:(NSString *)message, ...;
- (void)debug: (NSString *)message, ...;
- (void)info: (NSString *)message, ...;
- (void)warn: (NSString *)message, ...;
- (void)error: (NSString *)message, ...;
- (void)assert: (NSString *)message, ...;

@end

/**
 *  A basic logger for the ShopLoveTracking Framework.
 */
@interface SLTLogger : NSObject <SLTLogger>

/**
 *  @return The shared instance of the logger.
 */
+ (SLTLogger *) sharedLogger;

@end

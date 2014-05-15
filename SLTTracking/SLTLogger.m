//
//  SLTLogger.m
//  SLTTracking
//
//  Created by Michael Banholzer on 15/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTLogger.h"


static NSString * const kLogTag = @"ShopLoveTracking";

@interface SLTLogger()

@property (nonatomic, assign) SLTLogLevel loglevel;

@end


@implementation SLTLogger

+ (SLTLogger *) sharedLogger
{
  static SLTLogger *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[SLTLogger alloc] init];
  });
  return sharedInstance;
}


- (void)setLogLevel:(SLTLogLevel)logLevel {
  self.loglevel = logLevel;
}

- (void)verbose:(NSString *)format, ... {
  if (self.loglevel > SLTLogLevelVerbose || self.loglevel <= 0) return;
  va_list parameters; va_start(parameters, format);
  [self logLevel:@"v" format:format parameters:parameters];
}

- (void)debug:(NSString *)format, ... {
  if (self.loglevel > SLTLogLevelDebug || self.loglevel <= 0) return;
  va_list parameters; va_start(parameters, format);
  [self logLevel:@"d" format:format parameters:parameters];
}

- (void)info:(NSString *)format, ... {
  if (self.loglevel > SLTLogLevelInfo || self.loglevel <= 0) return;
  va_list parameters; va_start(parameters, format);
  [self logLevel:@"i" format:format parameters:parameters];
}

- (void)warn:(NSString *)format, ... {
  if (self.loglevel > SLTLogLevelWarn || self.loglevel <= 0) return;
  va_list parameters; va_start(parameters, format);
  [self logLevel:@"w" format:format parameters:parameters];
}

- (void)error:(NSString *)format, ... {
  if (self.loglevel > SLTLogLevelError || self.loglevel <= 0) return;
  va_list parameters; va_start(parameters, format);
  [self logLevel:@"e" format:format parameters:parameters];
}

- (void)assert:(NSString *)format, ... {
  if (self.loglevel > SLTLogLevelAssert || self.loglevel <= 0) return;
  va_list parameters; va_start(parameters, format);
  [self logLevel:@"a" format:format parameters:parameters];
}

// private implementation
- (void)logLevel:(NSString *)logLevel format:(NSString *)format parameters:(va_list)parameters {
  
  NSString *string = [[NSString alloc] initWithFormat:format arguments:parameters];
  va_end(parameters);
  
  NSArray *lines = [string componentsSeparatedByString:@"\n"];
  for (NSString *line in lines) {
    NSLog(@"\t[%@]%@: %@", kLogTag, logLevel, line);
  }
}


@end

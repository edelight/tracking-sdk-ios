//
//  SLTShopLoveConfig.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTShopLoveConfig.h"
#import <UIKit/UIKit.h>
#import "UIDevice+SLTDeviceUtility.h"

static NSString *const kSdkVersion = @"1.0.0";
static NSString *const kBaseUrl = @"http://api.shoplove.com/v6/trackings";

@implementation SLTShopLoveConfig

- (instancetype)init
{
  self = [super init];
  if (self) {
    _baseUrl = kBaseUrl;
    _userAgent = [self createUserAgent];
    _clientSdk = kSdkVersion;
  }
  
  return self;
}

- (NSString *) createUserAgent
{
  UIDevice *device = [UIDevice currentDevice];
  NSLocale *locale = [NSLocale currentLocale];
  NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
  
  NSString *bundeIdentifier = [infoDictionary objectForKey:(NSString *)kCFBundleIdentifierKey];
  NSString *bundleVersion   = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey];
  
  
  NSString *userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; %@_%@)",
                         bundeIdentifier,
                         bundleVersion,
                         [device slt_platform],
                         [device systemVersion],
                         [locale objectForKey:NSLocaleLanguageCode],
                         [locale objectForKey:NSLocaleCountryCode]
                         ];
  
  return userAgent;
}


@end

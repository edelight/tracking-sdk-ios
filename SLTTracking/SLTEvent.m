//
//  SLTEvent.m
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import "SLTEvent.h"

@implementation SLTEvent

- (instancetype) initWithPath:(NSString *) path
                    userAgent:(NSString *) userArgent
                    clientSdk:(NSString *) clientSdk
                   parameters:(NSDictionary *) params {
  self = [super init];
  if (self) {
    _trackEventPath = path;
    _trackEventUserAgent = userArgent;
    _trackEventClientSdk = clientSdk;
    _trackEventParameters = params;
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"[%@:\n\
          path: %@\n\
          userAgent: %@\n\
          clientSdk: %@\n\
          params: %@]",
          self.class, self.trackEventPath, self.trackEventUserAgent, self.trackEventClientSdk, self.trackEventParameters];
}

@end

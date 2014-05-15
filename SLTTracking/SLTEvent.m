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
                      headers:(NSDictionary *) headers
                   parameters:(NSDictionary *) params
{
  self = [super init];
  if (self) {
    _trackEventPath = path;
    _trackEventHeaders = headers;
    _trackEventParameters = params;
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"[%@: Path: %@, Headers: %@, Params: %@]", self.class, self.trackEventPath, self.trackEventHeaders, self.trackEventParameters];
}

@end

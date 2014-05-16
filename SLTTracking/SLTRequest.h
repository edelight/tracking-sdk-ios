//
//  SLTRequest.h
//  SLTTracking
//
//  Created by Michael Banholzer on 14/05/14.
//  Copyright (c) 2014 The Visual Shopping Company GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTTrackEvent.h"

/**
 *  The SLTRequest is a subclass of NSOperation to create and handle the POST request in the background.
 *  A NSMutableURLRequest will be created in the -main method and sent by -sendSynchronousRequest:.
 *  As the -sendSynchronousRequest: will block the current thread, it is not recommended to call -main from the main thread,
 *  otherwise the UI gets blocked.
 */
@interface SLTRequest : NSOperation

/**
 *  Returns an initialized SLTRequest object.
 *
 *  @param baseUrl    The base Url to send to.
 *  @param trackEvent The actual data to send.
 *
 *  @return The initialized SLTRequest object.
 */
- (instancetype) initWithBaseUrl:(NSString *) baseUrl andTrackEvent:(id<SLTTrackEvent>) trackEvent;

@end

//
//  ProWidgets
//  Google Authenticator
//
//  Created by Alan Yip on 22 Feb 2014
//  Copyright 2014 Alan Yip. All rights reserved.
//

#import <libprowidgets/libprowidgets.h>
#import <objcipc/objcipc.h>
#import "interface.h"

#define AuthenticatorIdentifier @"com.google.Authenticator"

#define LOG_DEALLOC 0
#define RELEASE(x) [x release], x = nil;
#define RELEASE_VIEW(x) [x removeFromSuperview], [x release], x = nil;

#ifdef LOG_DEALLOC
#define DEALLOCLOG NSLog(@"***** [ProWidgets] dealloc '%@' <%p>", self.class, self)
#else
#define DEALLOCLOG
#endif
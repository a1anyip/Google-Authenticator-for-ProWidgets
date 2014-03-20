//
//  ProWidgets
//  Google Authenticator
//
//  Created by Alan Yip on 22 Feb 2014
//  Copyright 2014 Alan Yip. All rights reserved.
//

#import "header.h"
#import "Theme.h"
#import "ViewController.h"

@interface PWWidgetGoogleAuthenticator : PWWidget {
	
	PWWidgetGoogleAuthenticatorViewController *_viewController;
	UIImage *_reloadImage;
}

@property(nonatomic, readonly) UIImage *reloadImage;

@end
//
//  ProWidgets
//  Google Authenticator
//
//  Created by Alan Yip on 22 Feb 2014
//  Copyright 2014 Alan Yip. All rights reserved.
//

#import "Authenticator.h"

@implementation PWWidgetGoogleAuthenticator

- (BOOL)requiresProtectedDataAccess {
	// Google Authenticator app uses keychain so it is required to access protected data.
	return YES;
}

- (void)configure {
	
	// use a custom layout so that we can push our own view controller as the root view controller
	self.layout = PWWidgetLayoutCustom;
	
	// load our custom theme
	// if not, then the default theme of ProWidgets will be loaded after this method and before load
	[self loadThemeNamed:@"PWWidgetThemeGoogleAuthenticator"];
}

- (void)load {
	
	// check if the app is installed on the device
	SBApplicationController *controller = [objc_getClass("SBApplicationController") sharedInstance];
	SBApplication *authApp = [controller applicationWithDisplayIdentifier:AuthenticatorIdentifier];
	if (authApp == nil) {
		[self showMessage:@"You need to install Google Authenticator app from App Store to use this widget."];
		[self dismiss];
		return;
	}
	
	// get its bundle
	NSString *path = authApp.path;
	NSBundle *bundle = [NSBundle bundleWithPath:path];
	
	// get the reload image from its bundle
	_reloadImage = [[UIImage imageNamed:@"refresh" inBundle:bundle] retain];
	
	// push a custom root view controller
	_viewController = [[PWWidgetGoogleAuthenticatorViewController alloc] initForWidget:self];
	[self pushViewController:_viewController animated:NO];
}

- (void)willDismiss {
	[_viewController invalidateTimer];
	[OBJCIPC deactivateAppWithIdentifier:AuthenticatorIdentifier];
}

- (void)dealloc {
	RELEASE(_viewController)
	RELEASE(_reloadImage)
	[super dealloc];
}

@end
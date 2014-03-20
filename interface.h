@interface UIImage ()

+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;

@end

@interface SpringBoard : UIApplication

- (BOOL)isLocked;
- (BOOL)launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspended;

@end

@interface SBApplication : NSObject

- (NSString *)path;

@end

@interface SBApplicationController : NSObject

+ (instancetype)sharedInstance;
- (SBApplication *)applicationWithDisplayIdentifier:(NSString *)identifier;

@end
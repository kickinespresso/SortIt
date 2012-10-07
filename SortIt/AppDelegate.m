//
//  AppDelegate.m
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
#import "GameConfig.h"
#import "HelloWorldLayer.h"
#import "RootViewController.h"
#import "Crittercism.h"
#import "Flurry.h"
#import "Constants.h"
#import "IntroLayer.h"

#define IOS_OLDER_THAN_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] < 6.0 )
#define IOS_NEWER_OR_EQUAL_TO_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] >= 6.0 )

#ifdef IOS_NEWER_OR_EQUAL_TO_6
@implementation MyNavigationController

// The available orientations should be defined in the Info.plist file.
// And in iOS 6+ only, you can override it in the Root View controller in the "supportedInterfaceOrientations" method.
// Only valid for iOS 6+. NOT VALID for iOS 4 / 5.
-(NSUInteger)supportedInterfaceOrientations {
    
	// iPhone only
	if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
		return UIInterfaceOrientationMaskLandscape;
    
	// iPad only
	return UIInterfaceOrientationMaskLandscape;
}

// Supported orientations. Customize it for your own needs
// Only valid on iOS 4 / 5. NOT VALID for iOS 6.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// iPhone only
	if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
		return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    
	// iPad only
	// iPhone only
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

// This is needed for iOS4 and iOS5 in order to ensure
// that the 1st scene has the correct dimensions
// This is not needed on iOS6 and could be added to the application:didFinish...
-(void) directorDidReshapeProjection:(CCDirector*)director
{
	if(director.runningScene == nil) {
		// Add the first scene to the stack. The director will draw it immediately into the framebuffer. (Animation is started automatically when the view is displayed.)
		// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
		[director runWithScene: [IntroLayer scene]];
	}
}
@end
#endif
@implementation AppDelegate

@synthesize window=window_, viewController;

#ifdef IOS_NEWER_OR_EQUAL_TO_6
@synthesize navController=navController_, director=director_;
#endif

void uncaughtExceptionHandler(NSException *exception) {
    [Flurry logError:@"Uncaught" message:@"Crash!" exception:exception];
}


- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    //Setup Flurry
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    
    if(systemVersion < 6.0 ){
        //NSLog(@"Start iOS 4.3 or less");
        
        // Init the window
        
        window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        // Init the View Controller
        viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
        viewController.wantsFullScreenLayout = YES;
        
        
        // make the View Controller a child of the main window
        [window_ addSubview: viewController.view];
        [window_ makeKeyAndVisible];

    }else {
        window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        // Init the View Controller
        viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
        viewController.wantsFullScreenLayout = YES;
        
        // Create a Navigation Controller with the Director
        navController_ = [[MyNavigationController alloc] initWithRootViewController:viewController];
        navController_.navigationBarHidden = YES;
    
        
        // set the Navigation Controller as the root view controller
        [window_ setRootViewController:navController_];
        
        // make main window visible
        [window_ makeKeyAndVisible];
    }


    
    [Crittercism initWithAppID:@"4ec562493f5b313baf0001c2"
                        andKey:@"4ec562493f5b313baf0001c2iylccbqi"
                     andSecret:@"ey8zvcki7ugmxsbs0d3knnamtfy2hpwl"
         andMainViewController:viewController];
    

    // Add your delegate to the Crittercism shared object
    [Crittercism sharedInstance].delegate = self;
    [Flurry startSession:@"JNDBX72ADY2XNGWM1AT3"];

}





- (void)applicationWillResignActive:(UIApplication *)application {
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
	[[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
	[viewController release];
	
	[window_ release];
	
	[director end];	
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

// Implement the protocol
#pragma mark CrittercismDelegate
-(void)crittercismDidCrashOnLastLoad {
    
    NSLog(@"App crashed the last time it was loaded");
    [Flurry logEvent:@"Crittercism: App crashed the last time it was loaded"];
    
}

-(void)crittercismDidClose{
    //Do Nothing
}

- (void)dealloc {
	[[CCDirector sharedDirector] end];
	[window_ release];
	[super dealloc];
}

@end

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

@implementation AppDelegate

@synthesize window, viewController;

void uncaughtExceptionHandler(NSException *exception) {
    [Flurry logError:@"Uncaught" message:@"Crash!" exception:exception];
}

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    

    //Setup Flurry
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

    
    
	// Init the window

	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Init the View Controller
	viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
	viewController.wantsFullScreenLayout = YES;
	
	
	// make the View Controller a child of the main window
	[window addSubview: viewController.view];
	[window makeKeyAndVisible];
	


    
    

    /*
    [Crittercism initWithAppID:@"4ec562493f5b313baf0001c2"
                        andKey:@"4ec562493f5b313baf0001c2iylccbqi"
                     andSecret:@"ey8zvcki7ugmxsbs0d3knnamtfy2hpwl"
         andMainViewController:viewController];
    

    // Add your delegate to the Crittercism shared object
    [Crittercism sharedInstance].delegate = self;
    [FlurryAnalytics startSession:@"JNDBX72ADY2XNGWM1AT3"];
*/
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
	
	[window release];
	
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
	[window release];
	[super dealloc];
}

@end

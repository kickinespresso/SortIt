//
//  AppDelegate.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crittercism.h"

#import "Constants.h"
#ifdef IOS_NEWER_OR_EQUAL_TO_6
// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end
#endif

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, CrittercismDelegate> {
	UIWindow			*window_;
	RootViewController	*viewController;
    
    #ifdef IOS_NEWER_OR_EQUAL_TO_6
    MyNavigationController *navController_;
    CCDirectorIOS	*director_;
#endif
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;
#ifdef IOS_NEWER_OR_EQUAL_TO_6
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;
#endif
@end

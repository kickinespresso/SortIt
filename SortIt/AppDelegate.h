//
//  AppDelegate.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crittercism.h"

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, CrittercismDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;

@end

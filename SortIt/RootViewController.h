//
//  RootViewController.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "Cocos2d.h"


@interface RootViewController : UIViewController <ADBannerViewDelegate>{
    //Removed CCDirectorDelegate
    ADBannerView *bannerView;


    //CCDirectorIOS	*__unsafe_unretained director_;
    CCDirector *director;
}

@property (nonatomic,retain) ADBannerView *bannerView;
//@property (unsafe_unretained, readonly) CCDirectorIOS *director;


@end

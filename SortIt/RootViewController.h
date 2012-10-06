//
//  RootViewController.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@interface RootViewController : UIViewController <ADBannerViewDelegate>{
    ADBannerView *bannerView;

}

@property (nonatomic,retain) ADBannerView *bannerView

@end

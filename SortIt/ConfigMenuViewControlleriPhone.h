//
//  ConfigMenuViewControlleriPhone.h
//  Sorting
//
//  Created by Chris Desch on 11/15/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/ADBannerView.h"

@protocol ConfigMenuViewControllerDelegateiPhone;

@interface ConfigMenuViewControlleriPhone : UIViewController {
    id <ConfigMenuViewControllerDelegateiPhone, ADBannerViewDelegate> delegate;
    
    IBOutlet UILabel *appNameLabel;
    IBOutlet UILabel *versionLabel;
    
    IBOutlet UISegmentedControl *sortingSpeedSeg;
    
    float sortingSpeed;
    
    ADBannerView *adBannerView;
    BOOL adBannerViewIsVisible;
    
}

@property (retain) id delegate;
@property (nonatomic, retain) IBOutlet UILabel *appNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *versionLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *sortingSpeedSeg;
@property (nonatomic, retain) IBOutlet ADBannerView * adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;

- (IBAction)done:(id)sender;
- (IBAction)sortingSpeedChanged:(id)sender;



@end

@protocol ConfigMenuViewControllerDelegateiPhone <NSObject>
    - (void)setSpeediPhone:(ConfigMenuViewControlleriPhone *)setSpeed speed:(float)speed;
@end

//
//  ConfigMenuViewController.h
//  DevCoachTools
//
//  Created by cj on 3/16/11.
//  Copyright 2011 Desch Enterprises. All rights reserved.
//
#import "cocos2d.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@protocol ConfigMenuViewControllerDelegate;

@interface ConfigMenuViewController : UIViewController {
    id <ConfigMenuViewControllerDelegate > delegate;
    
    IBOutlet UILabel *appNameLabel;
    IBOutlet UILabel *versionLabel;
    IBOutlet UISegmentedControl *sortingSpeedSeg;
    
    float sortingSpeed;
    

    
}
@property (retain) id delegate;
@property (nonatomic, retain) IBOutlet UILabel *appNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *versionLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *sortingSpeedSeg;

- (IBAction)done:(id)sender;
- (IBAction)sortingSpeedChanged:(id)sender;
- (IBAction)crittercismPressed:(id)sender;

@end

@protocol ConfigMenuViewControllerDelegate <NSObject>
- (void)setSpeed:(ConfigMenuViewController *)setSpeed speed:(float)speed;
- (void)dismissConfigMenu:(ConfigMenuViewController *)setSpeed;
@end

//
//  ConfigMenuViewControlleriPhone.h
//  Sorting
//
//  Created by Chris Desch on 11/15/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ConfigMenuViewControllerDelegateiPhone;

@interface ConfigMenuViewControlleriPhone : UIViewController {
    id <ConfigMenuViewControllerDelegateiPhone> delegate;
    
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

@protocol ConfigMenuViewControllerDelegateiPhone <NSObject>
    - (void)setSpeediPhone:(ConfigMenuViewControlleriPhone *)setSpeed speed:(float)speed;
    - (void)dismissConfigMenuiPhone:(ConfigMenuViewControlleriPhone *)setSpeed;
@end

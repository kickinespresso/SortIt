//
//  DetailViewController.h
//  TestProduct
//
//  Created by cj on 10/6/12.
//  Copyright (c) 2012 KickinEspresso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

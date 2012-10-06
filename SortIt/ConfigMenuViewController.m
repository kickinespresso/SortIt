//
//  ConfigMenuViewController.m
//  DevCoachTools
//
//  Created by cj on 3/16/11.
//  Copyright 2011 Desch Enterprises. All rights reserved.
//

#import "ConfigMenuViewController.h"
#import "CocoaHelper.h"
#import "FlurryAnalytics.h"
#import "Crittercism.h"

@implementation ConfigMenuViewController

@synthesize delegate;
@synthesize appNameLabel;
@synthesize versionLabel;
@synthesize sortingSpeedSeg;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        sortingSpeed = 1;
    }
    return self;
}

- (void)dealloc
{

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)done:(id)sender{

    [self.delegate setSpeed:self speed:sortingSpeed];
    
    //Hide the ConfigMenuViewController
    [CocoaHelper hideUIViewController];
}


- (IBAction)sortingSpeedChanged:(id)sender{
    switch (self.sortingSpeedSeg.selectedSegmentIndex) {
        case 0:
            sortingSpeed = 1.0;
            break;
        case 1:
            sortingSpeed = 0.5;
            break;
        case 2:
            sortingSpeed = 0.25;
            break;
        case 3:
            sortingSpeed = 0.10;
            break;
        default:
            break;
    }

}

- (IBAction)crittercismPressed:(id)sender {
   
    [Crittercism showCrittercism];
}

-(IBAction) crashPressed:(id) sender {
    [NSException raise:NSInvalidArgumentException
                format:@"Foo must not be nil"];
}



#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.appNameLabel.text = @"Sorting"; //[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
    self.versionLabel.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //All others NO
	return NO;
}

@end

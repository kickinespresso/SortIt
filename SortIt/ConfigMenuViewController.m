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

//@synthesize adBannerView;
//@synthesize adBannerViewIsVisible;

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
    //adBannerView.delegate=nil;
    //[adBannerView release];
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
    
    /*
    if([[UIDevice currentDevice].systemVersion floatValue] >= 4.0){
        //Show ad's 
        adBannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        adBannerView.delegate=self;
        
        self.adBannerViewIsVisible=NO;
    }else{
        //No Add
    }*/
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

#pragma mark - iAD Actions and functions
/*
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    

    NSLog(@"Banner Should begin");
    [self.delegate setSpeed:self speed:sortingSpeed];
    
    //Hide the ConfigMenuViewController
    //[CocoaHelper hideUIViewController];
    [self.delegate dismissConfigMenu:self];
    
    return TRUE;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.adBannerViewIsVisible){
        
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.adBannerViewIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [FlurryAnalytics logEvent:@"iAd Failed to Recieve Ad"];
    if (self.adBannerViewIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.adBannerViewIsVisible = NO;
    }
}

#pragma mark - Helper functions
- (int)getBannerHeight:(UIDeviceOrientation)orientation {
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        return 32;
    } else {
        return 50;
    }
}

- (int)getBannerHeight {
    return [self getBannerHeight:[UIDevice currentDevice].orientation];
}
*/
@end

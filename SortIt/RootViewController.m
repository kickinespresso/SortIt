//
//  RootViewController.m
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//

//
// RootViewController + iAd
// If you want to support iAd, use this class as the controller of your iAd
//

#import "cocos2d.h"

#import "RootViewController.h"
#import "GameConfig.h"
#import "HelloWorldLayer.h"
#import "Constants.h"

@implementation RootViewController

//@synthesize director=director_;
@synthesize bannerView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
	// Custom initialization
	}
	return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */
- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
    CCDirector *director = [CCDirector sharedDirector];
	CGSize size = [director winSize];
    CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
	sprite.position = ccp(size.width/2, size.height/2);
	sprite.rotation = -90;
	[sprite visit];
	[[director openGLView] swapBuffers];

}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    /*
	// Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
	CCGLView *glView = [CCGLView viewWithFrame:[self.view bounds]
								   pixelFormat:kEAGLColorFormatRGB565	//kEAGLColorFormatRGBA8
								   depthFormat:0	//GL_DEPTH_COMPONENT24_OES
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
    
	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
    
	director_.wantsFullScreenLayout = YES;
    
	// Display FSP and SPF
	[director_ setDisplayStats:YES];
    
	// set FPS at 60
	[director_ setAnimationInterval:1.0/60];
    
	// attach the openglView to the director
	[director_ setView:glView];
    
	// for rotation and other messages
	[director_ setDelegate:self];
    
	// 2D projection
	[director_ setProjection:kCCDirectorProjection2D];
    //	[director setProjection:kCCDirectorProjection3D];
    
	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	//if( ! [director_ enableRetinaDisplay:YES] )
    CCLOG(@"Retina Display Not supported");
*/
    director = [CCDirector sharedDirector];
	
	
	//
	// Create the EAGLView manually
	//  1. Create a RGB565 format. Alternative: RGBA8
	//	2. depth format of 0 bit. Use 16 or 24 bit for 3d effects, like CCPageTurnTransition
	//
	//
	EAGLView *glView = [EAGLView viewWithFrame:[[UIScreen mainScreen] bounds] pixelFormat:kEAGLColorFormatRGB565 depthFormat:0];
	
    
	// attach the openglView to the director
    [director setOpenGLView:glView];
    
	
    // Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
    if( ! [director enableRetinaDisplay:YES] )
    	CCLOG(@"Retina Display Not supported");
	
	//
	// VERY IMPORTANT:
	// If the rotation is going to be controlled by a UIViewController
	// then the device orientation should be "Portrait".
	//
	// IMPORTANT:
	// By default, this template only supports Landscape orientations.
	// Edit the RootViewController.m file to edit the supported orientations.
	//
    
	[director setAnimationInterval:1.0/60];
	//[director setDisplayFPS:YES];
    
    
	
	// make the OpenGLView a child of the view controller
	//[self setView:glView];
    [self.view addSubview:glView];
    
	
	// make the View Controller a child of the main window

	
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
	
	// Removes the startup flicker
	[self removeStartupFlicker];
	


    
    
    static NSString * const kADBannerViewClass = @"ADBannerView";
    if (NSClassFromString(kADBannerViewClass) != nil) {
        
        self.bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        [self.bannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
                                                            ADBannerContentSizeIdentifierPortrait,
                                                            ADBannerContentSizeIdentifierLandscape, nil]];
        
        self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
        
        [self.bannerView setDelegate:self];
        
        [self.view addSubview:self.bannerView];
        [self moveBannerOffScreen];
        
    }
    /*
    // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    

    
	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
    
	// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
	//[director_ pushScene: [HelloWorldLayer scene]];

    [director_ runWithScene:[HelloWorldLayer scene]];
    //[[CCDirector sharedDirector] runWithScene: [HelloWorldLayer scene]];
    */
    


    
}

- (void)viewWillAppear:(BOOL)animated{
    // Run the intro Scene

    
#ifdef IOS_NEWER_OR_EQUAL_TO_6
    //[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeOrientation:) name:@"UIDeviceOrientationDidChangeNotification" object:[UIDevice currentDevice]];
#endif
}

- (void)viewDidAppear:(BOOL)animated{
    [[CCDirector sharedDirector] runWithScene: [HelloWorldLayer scene]];
}

#ifdef IOS_OLDER_THAN_6
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    
    return ( UIInterfaceOrientationIsLandscape( interfaceOrientation ) );
}
#endif
#ifdef IOS_NEWER_OR_EQUAL_TO_6
-(BOOL)shouldAutorotate {
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (NSUInteger)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window
{
    
    return UIInterfaceOrientationMaskLandscape;
}

- (void) didChangeOrientation: (id)object {
    NSLog(@"did AutoRotate ");
    UIInterfaceOrientation interfaceOrientation = [[object object] orientation];
    //DLog(@"val is %i", interfaceOrientation);
    if (interfaceOrientation == UIDeviceOrientationLandscapeLeft || interfaceOrientation == UIDeviceOrientationLandscapeRight) {
        NSLog(@"land");
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGRect rect = CGRectZero;
        
        
        if(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
            rect = screenRect;
        
        else if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
            rect.size = CGSizeMake( screenRect.size.height, screenRect.size.width );
        
        CCDirector *director = [CCDirector sharedDirector];
        EAGLView *glView = [director openGLView];
        float contentScaleFactor = [director contentScaleFactor];
        
        if( contentScaleFactor != 1 ) {
            rect.size.width *= contentScaleFactor;
            rect.size.height *= contentScaleFactor;
        }
        glView.frame = rect;
        
        NSLog(@"screen height: %f", glView.frame.size.height );
        NSLog(@"screen width: %f", glView.frame.size.width );
        
        

    }
}
#endif


//
// This callback only will be called when GAME_AUTOROTATION == kGameAutorotationUIViewController
//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"will AutoRotate ");
	//
	// Assuming that the main window has the size of the screen
	// BUG: This won't work if the EAGLView is not fullscreen
	///
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGRect rect = CGRectZero;
    
	
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
		rect = screenRect;
	
	else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
		rect.size = CGSizeMake( screenRect.size.height, screenRect.size.width );
	
	CCDirector *director = [CCDirector sharedDirector];
	EAGLView *glView = [director openGLView];
	float contentScaleFactor = [director contentScaleFactor];
	
	if( contentScaleFactor != 1 ) {
		rect.size.width *= contentScaleFactor;
		rect.size.height *= contentScaleFactor;
	}
	glView.frame = rect;
}
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


-(void) moveBannerOffScreen
{
    CGSize windowSize = [[CCDirector sharedDirector] winSize];
    
    self.bannerView.frame = CGRectMake(0, (-1) * windowSize.height, 320, 50);
    
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    //NSLog(@"bannerViewDidLoadAd");
    
    [self moveBannerOnScreen];
}

-(void) moveBannerOnScreen
{
    
    [UIView beginAnimations:@"BannerViewIntro" context:NULL];
    
    

    self.bannerView.frame = CGRectZero;
    [UIView commitAnimations];
}

@end


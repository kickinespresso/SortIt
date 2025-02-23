//
//  HelloWorldLayer.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright Desch Enterprises 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "HeapSort.h"
#import "MergeSort.h"
#import "BubbleSort.h"
#import "SelectionSort.h"
#import "InsertionSort.h"
#import "QuickSort.h"
#import "ShuttleSort.h"
#import "ConfigMenuViewController.h"
#import "ConfigMenuViewControlleriPhone.h"
#import "RootViewController.h"



// HelloWorldLayer
@interface HelloWorldLayer  : CCLayer <HeapSortDelegate, MergeSortDelegate, BubbleSortDelegate, SelectionSortDelegate, InsertionSortDelegate, QuickSortDelegate, ShuttleSortDelegate,ConfigMenuViewControllerDelegate> {
    
    HeapSort* heapSort;
    MergeSort* mergeSort;
    BubbleSort* bubbleSort;
    SelectionSort* selectionSort;
    InsertionSort* insertionSort;
    QuickSort*      quickSort;
    ShuttleSort*    shuttleSort;
    
    CCSprite*   greenArrow;
    CCSprite*   redArrow;
    CCSprite*   blueArrow;
    
   
    NSMutableArray* spriteElements;
    NSMutableArray* elements;
    NSMutableArray* actionQueue;
    
    int titleFontSize;
    int menuFontSize;
    int fontSize;
    float resOffset;
    
    float gameSpeed;
    
    CCMenu *menu;
    CCMenu *doneMenu;
    
    //ConfigMenuViewController *configMenuViewController;
    //ConfigMenuViewControlleriPhone *configMenuViewControlleriPhone;
    //This is a trick, AdMob uses a viewController to display its Ads, trust me, you'll need this
	RootViewController *viewController;
    

    
    
}

@property (nonatomic, retain) HeapSort* heapSort;
@property (nonatomic, retain) MergeSort* mergeSort;
@property (nonatomic, retain) BubbleSort* bubbleSort;
@property (nonatomic, retain) SelectionSort* selectionSort;
@property (nonatomic, retain) InsertionSort* insertionSort;
@property (nonatomic, retain) QuickSort* quickSort;

@property (nonatomic, retain) NSMutableArray* spriteElements;
@property (nonatomic, retain) NSMutableArray* elements;
@property (nonatomic, retain) NSMutableArray* actionQueue;

@property (nonatomic, retain) id adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
- (void)start:(id)sender;
- (void)doneButton:(id)sender;
- (void)optionsButton:(id)sender;
- (void)createElements;
- (void)startHeapSort:(id)sender;
- (void)startInsertionSort:(id)sender;
- (void)startBubbleSort:(id)sender;
- (void)startSelectionSort:(id)sender;
- (void)startQuickSort:(id)sender;
- (void)startShuttleSort:(id)sender;

- (void)sort:(id)sender;

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber;


@end

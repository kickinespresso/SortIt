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

// HelloWorldLayer
@interface HelloWorldLayer  : CCLayer <HeapSortDelegate, MergeSortDelegate, BubbleSortDelegate, SelectionSortDelegate, InsertionSortDelegate> {
    
    HeapSort* heapSort;
    MergeSort* mergeSort;
    BubbleSort* bubbleSort;
    SelectionSort* selectionSort;
    InsertionSort* insertionSort;
    
    NSMutableArray* spriteElements;
    NSMutableArray* elements;
    NSMutableArray* actionQueue;
    
    int titleFontSize;
    int fontSize;
    float resOffset;
    
    CCMenu *menu;
    CCMenu *doneMenu;
    
}

@property (nonatomic, retain) HeapSort* heapSort;
@property (nonatomic, retain) MergeSort* mergeSort;
@property (nonatomic, retain) BubbleSort* bubbleSort;
@property (nonatomic, retain) SelectionSort* selectionSort;
@property (nonatomic, retain) InsertionSort* insertionSort;

@property (nonatomic, retain) NSMutableArray* spriteElements;
@property (nonatomic, retain) NSMutableArray* elements;
@property (nonatomic, retain) NSMutableArray* actionQueue;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
- (void)start:(id)sender;
- (void)createElements;
- (void)startHeapSort:(id)sender;
- (void)startInsertionSort:(id)sender;
- (void)startBubbleSort:(id)sender;
- (void)startSelectionSort:(id)sender;

- (void)sort:(id)sender;

@end

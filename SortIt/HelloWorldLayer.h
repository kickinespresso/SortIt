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
// HelloWorldLayer
@interface HelloWorldLayer  : CCLayer <HeapSortDelegate>
{
    HeapSort* heapSort;
    NSMutableArray* spriteElements;
    NSMutableArray* elements;
    NSMutableArray* actionQueue;
}

@property (nonatomic, retain) HeapSort* heapSort;
@property (nonatomic, retain) NSMutableArray* spriteElements;
@property (nonatomic, retain) NSMutableArray* elements;
@property (nonatomic, retain) NSMutableArray* actionQueue;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
- (void)start:(id)sender;
- (void)createElements;
- (void)startHeapSort;
- (void)sort:(id)sender;

@end

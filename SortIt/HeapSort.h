//
//  HeapSort.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//
#import "cocos2d.h"
#import <Foundation/Foundation.h>

@protocol HeapSortDelegate;

@interface HeapSort : NSObject{
    id <HeapSortDelegate> delegate;
    NSMutableArray* elements;

    int heapsize;
    int largest;
}

@property (retain) id delegate;

@property (nonatomic, retain) NSMutableArray *elements;

- (id)init;
- (id)initWithArray:(NSMutableArray*)aArray;
- (void)run;
- (void)heapSort:(NSMutableArray*)array;
- (void)buildHeap:(NSMutableArray*)array;
- (void)heapify:(NSMutableArray*)array i:(int)i;
@end

@protocol HeapSortDelegate <NSObject>

- (void)exchangeValues:(HeapSort *)heapSort first:(int)first second:(int)second;

@end


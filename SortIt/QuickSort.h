//
//  QuickSort.h
//  SortIt
//
//  Created by Chris Desch on 11/25/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuickSortDelegate;

@interface QuickSort : NSObject {
    id <QuickSortDelegate> delegate;
    NSMutableArray* elements;
}

@property (retain) id delegate;
@property (nonatomic, retain) NSMutableArray *elements;

- (id)initWithArray:(NSMutableArray*)aArray;
- (void)run;
- (void)quickSort:(NSMutableArray*)array left:(int)left right:(int)right;

@end


@protocol QuickSortDelegate <NSObject>

- (void)exchangeItemsQuick:(QuickSort *)quickSort first:(int)first second:(int)second;
- (void)currentItemQuick:(QuickSort *)quickSort item:(int)item;
- (void)compareItemQuick:(QuickSort *)quickSort item:(int)item;
- (void)pivotItemQuick:(QuickSort *)quickSort item:(int)item;


@end

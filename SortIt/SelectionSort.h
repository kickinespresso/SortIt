//
//  SelectionSort.h
//  SortIt
//
//  Created by Chris Desch on 11/14/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SelectionSortDelegate;

@interface SelectionSort : NSObject{
    id <SelectionSortDelegate> delegate;
    NSMutableArray* elements;
    
}

@property (retain) id delegate;
@property (nonatomic, retain) NSMutableArray *elements;

- (id)initWithArray:(NSMutableArray*)aArray;
- (void)run;
- (void)selectionSort:(NSMutableArray *)array;

@end



@protocol SelectionSortDelegate <NSObject>

- (void)exchangeItemsSelection:(SelectionSort *)selectionSort first:(int)first second:(int)second;
- (void)currentItemSelection:(SelectionSort *)selectionSort item:(int)item;
- (void)compareItemSelection:(SelectionSort *)selectionSort item:(int)item;
- (void)findMinItemSelection:(SelectionSort *)selectionSort item:(int)item;

@end
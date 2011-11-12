//
//  MergeSort.h
//  SortIt
//
//  Created by Chris Desch on 11/11/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MergeSortDelegate;

@interface MergeSort : NSObject{
    id <MergeSortDelegate> delegate;
    NSMutableArray* elements;
}

@property (retain) id delegate;
@property (nonatomic, retain) NSMutableArray *elements;


- (id)initWithArray:(NSMutableArray*)aArray;
- (void)merge_sort:(int)low high:(int)high;
- (void)merge:(int)low mid:(int)mid high:(int)high;
@end

@protocol HeapSortDelegate <NSObject>

- (void)exchangeValues:(MergeSort *)mergeSort first:(int)first second:(int)second;

@end

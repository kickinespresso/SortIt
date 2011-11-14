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
- (void)run;
//void merge(NSMutableArray *a, NSMutableArray *b, int lo, int mi, int hi);
- (void)merge:(NSMutableArray *)a b:(NSMutableArray *)b lo:(int)lo mi:(int)mi hi:(int)hi;
//void divideAndMerge(NSMutableArray *a, NSMutableArray *b, int lo, int hi);
- (void)divideAndMerge:(NSMutableArray*)a b:(NSMutableArray *)b lo:(int)lo hi:(int) hi;
//void mergeSort(NSMutableArray *array);
- (void)mergeSort:(NSMutableArray *)array;

@end

@protocol MergeSortDelegate <NSObject>

- (void)divideAndMergeItems:(MergeSort *)mergeSort a:(NSMutableArray*)a b:(NSMutableArray*)b lo:(int)lo hi:(int) hi;
- (void)mergeItems:(MergeSort *)mergeSort first:(int)first second:(int)second;

@end

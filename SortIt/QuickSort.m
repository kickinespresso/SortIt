//
//  QuickSort.m
//  SortIt
//
//  Created by Chris Desch on 11/25/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import "QuickSort.h"


@implementation QuickSort

@synthesize delegate;
@synthesize elements;

- (id)initWithArray:(NSMutableArray*)aArray{
    self = [super init];
    if (self) {
        
        // Initialization code here.
        
        
        elements = aArray;
        
        
    }
    
    return self;
}

- (void)run{
    //NSLog(@"Starting Quick Sort");
    //NSLog(@"Before %@",[elements description]);
    [self quickSort:elements left:0 right:([elements count] -1)];
    //NSLog(@"After: %@",[elements description]);
}


- (void)quickSort:(NSMutableArray*)array left:(int)left right:(int)right {
    
    int i = left, j = right;
    //int pivot = arr[(left + right) / 2];
    int pivot = [[array objectAtIndex:((left + right) /2)] intValue];
    [self.delegate pivotItemQuick:self item:((left + right) /2)];
    /* partition */
    while (i <= j) {
        [self.delegate compareItemQuick:self item:i];
        while ([[array objectAtIndex:i] intValue] < pivot){
            [self.delegate currentItemQuick:self item:i];
            i++;
        }
            
        while ([[array objectAtIndex:j] intValue] > pivot){
            [self.delegate currentItemQuick:self item:j];
            j--;
        }
            
        if (i <= j) {
            //tmp = arr[i];
            //arr[i] = arr[j];
            //arr[j] = tmp;

            [self.delegate exchangeItemsQuick:self first:i second:j];
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
            j--;
        }
    };
    
    /* recursion */
    if (left < j){
        //quickSort(arr, left, j);
        [self quickSort:array left:left right:j];
    }
        
    if (i < right){
        //quickSort(arr, i, right);
        [self quickSort:array left:i right:right];
    }
        
    
}    

@end

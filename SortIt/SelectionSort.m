//
//  SelectionSort.m
//  SortIt
//
//  Created by Chris Desch on 11/14/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

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
    //NSLog(@"Starting Selection Sort");
    //NSLog(@"Before %@",[elements description]);
    //mergeSort(elements);
    [self selectionSort:elements];
    //NSLog(@"After: %@",[elements description]);
}


//void SelectionSort(int a[], int array_size)
- (void)selectionSort:(NSMutableArray *)array{
    
    int i;
    for (i = 0; i < [array count] - 1; ++i)
    {
        int j, min;
        [self.delegate currentItemSelection:self item:i];
        min = i;
        for (j = i+1; j < [array count]; ++j)
        {
            //if (a[j] < a[min])
                //min = j;
            [self.delegate compareItemSelection:self item:j];
            if([[array objectAtIndex:j] intValue] < [[array objectAtIndex:min] intValue]){
                [self.delegate findMinItemSelection:self item:j];
                min = j;
            }
        }
        
        //temp = a[i];
        //a[i] = a[min];
        //a[min] = temp;
        [self.delegate exchangeItemsSelection:self first:i second:min];
        [array exchangeObjectAtIndex:i withObjectAtIndex:min];
        
    }
}
@end

//
//  BubbleSort.m
//  SortIt
//
//  Created by Chris Desch on 11/14/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

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
    //NSLog(@"Starting Bubble Sort");
    //NSLog(@"Before %@",[elements description]);
    //mergeSort(elements);
    [self bubbleSort:elements];
    //NSLog(@"After: %@",[elements description]);
}

//void BubbleSort(int a[], int array_size)
- (void)bubbleSort:(NSMutableArray *)array{
    
    int i, j;
    for (i = 0; i < ([array count] - 1); ++i)
    {
        [self.delegate currentItemBubble:self item:i];
        for (j = 0; j < [array count] - 1 - i; ++j )
        {
            [self.delegate findMinItemBubble:self item:j];
            //if (a[j] > a[j+1])
            if([[array objectAtIndex:j] intValue] > [[array objectAtIndex:(j+1)] intValue])
            {
                //temp = a[j+1];
                //a[j+1] = a[j];
                //a[j] = temp;
                [self.delegate exchangeItemsBubble:self first:j second:(j+1)];
                [array exchangeObjectAtIndex:j withObjectAtIndex:(j+1)];
                
            }
        }
    }
}


@end

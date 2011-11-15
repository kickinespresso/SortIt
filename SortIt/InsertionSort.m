//
//  InsertionSort.m
//  SortIt
//
//  Created by Chris Desch on 11/11/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

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
    NSLog(@"Starting Insertion Sort");
    NSLog(@"Before %@",[elements description]);
    //mergeSort(elements);
    [self insertionSort:elements];
    NSLog(@"After: %@",[elements description]);
}

//void insertionSort(int a[], int array_size)
- (void)insertionSort:(NSMutableArray *)array{

    int i, j, index;
    for (i = 1; i < [array count]; ++i)
    {
        [self.delegate currentItemInsertion:self item:i];
        //index = a[i];
        index = [[array objectAtIndex:i] intValue];
        
        for (j = i; j > 0 && [[array objectAtIndex:(j-1)] intValue] > index; j--){
            [self.delegate findMinItemInsertion:self item:j];
            //a[j] = a[j-1];
            //[array objectAtIndex:j] = [array objectAtIndex:(j-1)];
            //[array exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            [self.delegate exchangeItemsInsertion:self first:j second:(j-1)];
            [array replaceObjectAtIndex:j withObject:[array objectAtIndex:(j-1)]];
            
        }
                
        //a[j] = index;[NSNumber numberWithInt:(arc4random() % maxNumValue)]];
        //[self.delegate exchangeItemsInsertion:self first:j second:(j-1)];
        [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:index]];
    }
}


@end

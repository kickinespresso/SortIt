//
//  HeapSort.m
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import "HeapSort.h"
#include <stdlib.h>

@implementation HeapSort

@synthesize elements;
@synthesize delegate;

- (id)init
{
    self = [super init];
    if (self) {
        
        // Initialization code here.
        NSLog(@"Starting Heap Sort");
        
        //Prompt for values
        int numberValues = 10;
        int maxNumValue = 100;
        
        
        
        //Create the array and add the number objects to it. 
        elements = [[NSMutableArray alloc] init];

        for (int i = 0; i < numberValues; i++){

            [elements addObject:[NSNumber numberWithInt:(arc4random() % maxNumValue)]];
        }
        
        /*
        for (NSNumber i in elements){
            
        }
         */

        
        NSLog(@"Before %@",[elements description]);
        [self heapSort:elements];
        NSLog(@"After: %@",[elements description]);
        
    }
    
    return self;
}

- (id)initWithArray:(NSMutableArray*)aArray{
    self = [super init];
    if (self) {
        
        // Initialization code here.

        
        elements = aArray;

       
    }
    
    return self;
}

- (void)run{
    NSLog(@"Starting Heap Sort");
    NSLog(@"Before %@",[elements description]);
    [self heapSort:elements];
    NSLog(@"After: %@",[elements description]);
}


- (void)heapSort:(NSMutableArray*)array {

    [self buildHeap:array];

    //for i <- length(A) downto 2 {
    for (int i = [array count]-1; i > 0; i--)
    {
        
        //exchange A[1] <-> A[i]
        [self.delegate exchangeValues:self first:0 second:i];
        [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
        
        heapsize = heapsize - 1;
        //Heapify(A, 1)
        [self heapify:array i:0];
    }
    
    NSLog(@"Completed");
    
}    
    
    
- (void)buildHeap:(NSMutableArray*)array {
    NSLog(@"Build Heap");
    //heapsize <- length(A)
    heapsize = [array count]-1;
    //    for i <- floor( length/2 ) downto 1
    for(int i = floor(([array count]-1)/2); i >= 0; i--){
    //for(int i = ([array count]-1)/2; i >= 0; i--){
        //Heapify(A, i)
        [self heapify:array i:i];
    }
    NSLog(@"done building heap");
        
}    
    
    
- (void)heapify:(NSMutableArray*)array i:(int)i {   
    NSLog(@"Heapify");
    //le <- left(i)
    //ri <- right(i)
    //int left = [array objectAtIndex:(i+1)];
    //int right  = [array objectAtIndex:(i+2)];
    
    int left = (2*i);
    int right  = (2*i)+1;
    NSLog(@"i %d %d , %d", i, left, right);

    [self.delegate currentItemHeap:self item:i]; //Animate
    
    //Animate
    if(left <= heapsize){
        [self.delegate currentItemHeap:self item:left];
    }
    
    //if (le<=heapsize) and (A[le]>A[i])
    if (left <= heapsize  && ([[array objectAtIndex:left] intValue] > [[array objectAtIndex:i] intValue])) {
        //largest <- le
        largest = left;
    }else{
        //largest <- i    
        largest = i;
    }
    
    //Animate
    if(right <= heapsize){
        [self.delegate currentItemHeap:self item:right];
    }
    
    //if (ri<=heapsize) and (A[ri]>A[largest])
    if ((right<=heapsize) && ([[array objectAtIndex:right] intValue] >  [[array objectAtIndex:largest] intValue])){
        //largest <- ri
        largest = right;
    }
    
    [self.delegate findLargestHeap:self item:largest];
    
    if (largest != i) {
        //exchange A[i] <-> A[largest]
        [self.delegate findMinItemHeap:self item:i]; //Animate
        [self.delegate exchangeValues:self first:i second:largest]; //Animate
        [array exchangeObjectAtIndex:i withObjectAtIndex:largest];
        //Heapify(A, largest)
        [self heapify:array i:largest];
                    
    }
}

@end



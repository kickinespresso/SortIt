//
//  ShuttleSort.m
//  SortIt
//
//  Created by cj on 10/6/12.
//  Copyright (c) 2012 Desch Enterprises. All rights reserved.
//

#import "ShuttleSort.h"

@implementation ShuttleSort

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
    //NSLog(@"Starting Shuttle Sort");
    //NSLog(@"Before %@",[elements description]);
    [self shuttleSort:elements];
    //NSLog(@"After: %@",[elements description]);
}


- (void)shuttleSort:(NSMutableArray *)array{
    
    
    int begin = -1;
    int end = [array count]-2;
    
    BOOL swapped = false;
    
    do {
        begin += 1;
        
        for (int i = begin; i <= end; i++){
            
            [self.delegate currentItemShuttle:self item:i];
            [self.delegate compareItemShuttle:self item:(i+1)];
            if([[array objectAtIndex:i] intValue] > [[array objectAtIndex:(i+1)] intValue]){
                [self.delegate exchangeItemsShuttle:self first:i second:(i+1)];
                [array exchangeObjectAtIndex:i withObjectAtIndex:i+1];
                swapped = true;
                
            }
            
        }
        
        //
        if (swapped == false){
            return;
        }
        
        swapped = false;
        end --;
        
        
        
        for (int i = end; i >= begin ; i--){
            [self.delegate currentItemShuttle:self item:i];
            [self.delegate compareItemShuttle:self item:(i+1)];
            if([[array objectAtIndex:i] intValue] > [[array objectAtIndex:i+1] intValue]){
                [self.delegate exchangeItemsShuttle:self first:i second:(i+1)];
                [array exchangeObjectAtIndex:i withObjectAtIndex:i+1];
                swapped = true;
                
            }
            
        }
        
        if (swapped == false){
            return;
        }
        
        swapped = false;
        
        
    }while (!swapped);

    
    
}

@end

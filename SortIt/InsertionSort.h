//
//  InsertionSort.h
//  SortIt
//
//  Created by Chris Desch on 11/11/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InsertionSortDelegate;

@interface InsertionSort : NSObject {
    id <InsertionSortDelegate> delegate;
    NSMutableArray* elements;
    
}

@property (retain) id delegate;
@property (nonatomic, retain) NSMutableArray *elements;


- (id)initWithArray:(NSMutableArray*)aArray;
- (void)run;
- (void)insertionSort:(NSMutableArray *)array;

@end

@protocol InsertionSortDelegate <NSObject>

- (void)exchangeItemsInsertion:(InsertionSort *)insertionSort first:(int)first second:(int)second;



@end

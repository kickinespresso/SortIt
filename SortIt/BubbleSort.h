//
//  BubbleSort.h
//  SortIt
//
//  Created by Chris Desch on 11/14/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BubbleSortDelegate;

@interface BubbleSort : NSObject {
    id <BubbleSortDelegate> delegate;
    NSMutableArray* elements;

}

@property (retain) id delegate;
@property (nonatomic, retain) NSMutableArray *elements;

- (id)initWithArray:(NSMutableArray*)aArray;
- (void)run;
- (void)bubbleSort:(NSMutableArray *)array;

@end


@protocol BubbleSortDelegate <NSObject>

- (void)exchangeItemsBubble:(BubbleSort *)bubbleSort first:(int)first second:(int)second;

@end
//
//  ShuttleSort.h
//  SortIt
//
//  Created by cj on 10/6/12.
//  Copyright (c) 2012 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShuttleSortDelegate;

@interface ShuttleSort : NSObject{
    id <ShuttleSortDelegate> delegate;
    NSMutableArray* elements;
    
}




@property (retain) id delegate;
@property (nonatomic, retain) NSMutableArray *elements;

- (id)initWithArray:(NSMutableArray*)aArray;
- (void)run;
- (void)shuttleSort:(NSMutableArray*)array left:(int)left right:(int)right;

@end


@protocol ShuttleSortDelegate <NSObject>

- (void)exchangeItemsShuttle:(ShuttleSort *)shuttleSort;
- (void)currentItemShuttle:(ShuttleSort *)shuttleSort item:(int)item;
- (void)compareItemShuttle:(ShuttleSort *)shuttleSort item:(int)item;
- (void)pivotItemShuttle:(ShuttleSort *)shuttleSort item:(int)item;


@end

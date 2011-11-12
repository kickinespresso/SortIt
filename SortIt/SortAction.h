//
//  SortAction.h
//  SortIt
//
//  Created by Chris Desch on 10/27/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortAction : NSObject {
    
    
    int firstIndex;
    CGPoint firstLocation;
    int secondIndex;
    CGPoint secondLocation;
}

@property (nonatomic, readwrite) int firstIndex;
@property (nonatomic, readwrite) CGPoint firstLocation;
@property (nonatomic, readwrite) int secondIndex;
@property (nonatomic, readwrite) CGPoint secondLocation;


@end

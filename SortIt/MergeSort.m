//
//  MergeSort.m
//  SortIt
//
//  Created by Chris Desch on 11/11/11.
//  Copyright (c) 2011 Desch Enterprises. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

@synthesize elements;
@synthesize delegate;

- (id)initWithArray:(NSMutableArray*)aArray{
    self = [super init];
    if (self) {
        
        // Initialization code here.
        
        
        elements = aArray;
        
        
    }
    
    return self;
}

- (void)merge_sort:(int)low high:(int)high{
    
    int mid;
    if(low<high)
    {
        mid=(low+high)/2;
        [self  merge_sort:low high:mid];
        //merge_sort(low,mid);
        [self merge_sort:(mid+1) high:high];
        //merge_sort(mid+1,high);
        //merge(low,mid,high);
        [self merge:low mid:mid high:high];
    }
}

- (void)merge:(int)low mid:(int)mid high:(int)high{ 
    int h,i,j,k;
    //int b[]=new int[50];
    NSMutableArray* b = [[NSMutableArray alloc] init];
    h=low;
    i=low;
    j=mid+1;
    
    while((h<=mid)&&(j<=high))
    {
        if(a[h]<=a[j])
        {
            b[i]=a[h];
            h++;
        }
        else
        {
            b[i]=a[j];
            j++;
        }
        i++;
    }
    if(h>mid)
    {
        for(k=j;k<=high;k++)
        {
            b[i]=a[k];
            i++;
        }
    }
    else
    {
        for(k=h;k<=mid;k++)
        {
            b[i]=a[k];
            i++;
        }
    }
    for(k=low;k<=high;k++) a[k]=b[k];
}
@end

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

- (void)run{
    NSLog(@"Starting Merge Sort");
    NSLog(@"Before %@",[elements description]);
    //mergeSort(elements);
    [self mergeSort:elements];
    NSLog(@"After: %@",[elements description]);
}

//void merge(NSMutableArray *a, NSMutableArray *b, int lo, int mi, int hi){
- (void)merge:(NSMutableArray *)a b:(NSMutableArray *)b lo:(int)lo mi:(int)mi hi:(int)hi{
	int i, i1 = lo, i2 = mi + 1; // sub-array indexes
	for (i = lo; i <= hi; i++) // for each element in destination b
	{
		if (i1 > mi){
            // if i1 is out of bounds, copy from i2
            //[self.delegate mergeItems:self first:i second:i2];
			[b replaceObjectAtIndex: i withObject: [a objectAtIndex: i2++]];   
            
        }else if (i2 > hi){
            // if i2 is out of bounds, copy from i1
            //[self.delegate mergeItems:self first:i second:i1];
			[b replaceObjectAtIndex: i withObject: [a objectAtIndex: i1++]];

        }
		else if ([[a objectAtIndex: i1] compare: [a objectAtIndex: i2]] == NSOrderedAscending){
            // if (a[i1] < a[i2]) copy from i1
            //[self.delegate mergeItems:self first:i second:i1];
			[b replaceObjectAtIndex: i withObject: [a objectAtIndex: i1++]];   
        }
		else{
            // if (a[i1] >= a[i2]) copy from i2
            //[self.delegate mergeItems:self first:i second:i2];
			[b replaceObjectAtIndex: i withObject: [a objectAtIndex: i2++]];

        }
	}
	// copy back b into a --> same as [a setArray: b];
	for (i = lo; i <= hi; i++)
        
		[a replaceObjectAtIndex: i withObject: [b objectAtIndex: i]];
}

//void divideAndMerge(NSMutableArray *a, NSMutableArray *b, int lo, int hi){
- (void)divideAndMerge:(NSMutableArray*)a b:(NSMutableArray *)b lo:(int)lo hi:(int)hi{
	int mi = (lo + hi) / 2; // calculate middle point
	if (lo >= hi) return; // size is 1 or less --> done
	//divideAndMerge(a, b, lo, mi); // sort lower half
    [self divideAndMerge:a b:b lo:lo hi:mi];
	//divideAndMerge(a, b, mi+1, hi); // sort upper half
	[self divideAndMerge:a b:b lo:(mi+1) hi:hi];
    //merge(a, b, lo, mi, hi); // merge back sorted halves
    [self merge:a b:b lo:lo mi:mi hi:hi];
    
}

//void mergeSort(NSMutableArray *array){
- (void)mergeSort:(NSMutableArray *)array{
	NSMutableArray *buffer = [array mutableCopy]; // helper buffer
	int n = [array count]; // number of items in array
	//divideAndMerge(array, buffer, 0, n-1); // sort everything
    [self divideAndMerge:array b:buffer lo:0 hi:(n-1)];
	[buffer release]; // release the helper buffer
}

/*
 
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
    //NSMutableArray* b = [[NSMutableArray alloc] initWithCapacity:[elements count]];
    NSMutableArray* b = [[NSMutableArray alloc] initWithArray:elements copyItems:YES];
    h=low;
    i=low;
    j=mid+1;
    
    while((h<=mid)&&(j<=high))
    {
        if([[elements objectAtIndex:h] intValue] <= [[elements objectAtIndex:j] intValue]){
          
            [b removeObjectAtIndex:i];
            [b insertObject:[elements objectAtIndex:h]  atIndex:i];
            //[b replaceObjectAtIndex:i withObject:[[elements objectAtIndex:h]copy]];

            h++;
        } else {
          //  b[i]=a[j];
            //[b replaceObjectAtIndex:i withObject:[[elements objectAtIndex:j]copy]];
            [b removeObjectAtIndex:i];
            [b insertObject:[elements objectAtIndex:j]  atIndex:i];
            j++;
        }
        i++;
    }
    if(h>mid)
    {
        for(k=j;k<=high;k++)
        {
            //b[i]=a[k];
            [b replaceObjectAtIndex:i withObject:[[elements objectAtIndex:k]copy]];
            i++;
        }
    }
    else
    {
        for(k=h;k<=mid;k++)
        {
            [b replaceObjectAtIndex:i withObject:[[elements objectAtIndex:k]copy]];
            //b[i]=a[k];
            i++;
        }
    }
    for(k=low;k<=high;k++){
     //a[k]=b[k];   
        [elements replaceObjectAtIndex:k withObject:[[elements objectAtIndex:k]copy]];
    }
}
 */
@end

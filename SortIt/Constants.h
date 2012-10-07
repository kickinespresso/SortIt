//
//  Constants.h
//  SortIt
//
//  Created by cj on 10/6/12.
//  Copyright (c) 2012 Desch Enterprises. All rights reserved.
//

#define IOS_OLDER_THAN_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] < 6.0 )
#define IOS_NEWER_OR_EQUAL_TO_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] >= 6.0 )
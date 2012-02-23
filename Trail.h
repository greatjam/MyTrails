//
//  Trail.h
//  MyTrail
//
//  Created by alex on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trail : NSObject
{
    NSDate *startDate;
    NSDate *endDate;
    NSMutableArray *pictures;
}

@property (nonatomic,retain) NSDate *startDate;
@property (nonatomic,retain) NSDate *endDate;
@property (nonatomic,retain) NSMutableArray *pictures; 

@end

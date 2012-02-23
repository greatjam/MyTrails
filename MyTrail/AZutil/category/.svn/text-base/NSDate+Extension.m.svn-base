//
//  NSDate+Extension.m
//  Binfen
//
//  Created by alex on 11-12-11.
//  Copyright 2011年 Bfen. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (missingFunctions)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}   
@end
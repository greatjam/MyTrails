//
//  NSMutuableDictionary+Sort.m
//  MM
//
//  Created by alex on 11-6-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+Sort.h"


@implementation NSDictionary (Sort)

- (NSComparisonResult)myCompareMethodWithDic: (NSDictionary*)compareDic
{
	//NSDictionary *firstDic = self;
//	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//	//NSDate *date = [dateFormatter dateFromString:message.time];
//	NSDate *firstDate = [dateFormatter dateFromString:firstMeg.time];
//	NSDate *secondDate = [dateFormatter dateFromString:anotherMeg.time];
//	
//	[dateFormatter release];
//	
	NSNumber* selfCount = [NSNumber numberWithInt:[[self objectForKey:@"list"] count]];
	NSNumber* compareCount =  [NSNumber numberWithInt:[[compareDic objectForKey:@"list"] count]];
	
	return [compareCount compare: selfCount];
}



@end

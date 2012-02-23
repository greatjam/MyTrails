//
//  NSIndexPath+Sort.m
//  MM
//
//  Created by alex on 11-7-5.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSIndexPath+Sort.h"

@implementation NSIndexPath (Sort)

- (NSComparisonResult)myCompareMethodWithMessageTime: (NSIndexPath*)comparePath
{
	
	NSNumber* selfIndex = [NSNumber numberWithInt:self.section];
	NSNumber* compareIndex =  [NSNumber numberWithInt:comparePath.section];
	NSComparisonResult sectionCompareResult = [compareIndex compare: selfIndex];
	
	if(sectionCompareResult==NSOrderedSame)
	{
		NSNumber* selfRow = [NSNumber numberWithInt:self.row];
		NSNumber* compareRow =  [NSNumber numberWithInt:comparePath.row];
		NSComparisonResult rowCompareResult = [compareRow compare: selfRow];
		return rowCompareResult;
	}
	return sectionCompareResult;
}

@end
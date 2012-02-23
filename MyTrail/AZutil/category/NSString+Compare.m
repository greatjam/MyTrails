//
//  NSString+Compare.m
//  MM
//
//  Created by alex on 11-7-29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Compare.h"

@implementation NSString (CompareAdditions)

- (int)compareByVersion: (NSString*)compareStr
{
	NSArray *selfArray = [self componentsSeparatedByString:[NSString stringWithString:@"."]];
    NSArray *compareArray = [compareStr componentsSeparatedByString:[NSString stringWithString:@"."]];
	for(int i=0;i<[selfArray count] && i<[compareArray count];i++)
	{
		int selfValue = [[selfArray objectAtIndex:i] intValue];
		int compareValue = [[compareArray objectAtIndex:i] intValue];
	  if(selfValue>compareValue)
	  {return bigger;}
		else if(selfValue<compareValue){
			return smaller;
		}

	}
	return equal;
}

+(NSString *)connectStrWithArray:(NSArray *)infoArray
{
    NSString *str = (NSString *)[infoArray objectAtIndex:0];
    for(int i=1;i<[infoArray count];i++)
    {
        str = [str stringByAppendingFormat:@",%@",(NSString *)[infoArray objectAtIndex:i]];
    }
    return str;
}


@end

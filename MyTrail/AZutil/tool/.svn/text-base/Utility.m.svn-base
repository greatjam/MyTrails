//
//  Utility.m
//  CC
//
//  Created by  mac on 11-4-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Utility.h"

static Utility *sharedInstance = nil;
@implementation Utility


-(id)init
{
   self = [super init];
	if (self) {
	}
	return self;
}

+ (id)sharedInstance {
	@synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[Utility alloc] init];
            return sharedInstance;
        }
    }
    return sharedInstance;
}

+(CGSize)sizeofString:(NSString*)str font:(UIFont*)strFont
{
	CGSize boundingSize = CGSizeMake(320.0f, CGFLOAT_MAX);
	CGSize requiredSize = [str sizeWithFont:strFont constrainedToSize:boundingSize
								 lineBreakMode:UILineBreakModeWordWrap];
	return requiredSize;
	//CGFloat requiredHeight = requiredSize.height;
}


-  (int)convertToInt:(NSString*)strtemp {
	
	int strlength = 0;
	char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
	for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
		if (*p) {
			p++;
			strlength++;
		}
		else {
			p++;
		}
	}
	return strlength;
	
}

-(unsigned int)convertStringToUnsigned:(NSString *)myUnsignedIntString
{
	long long    myLongLong           = [myUnsignedIntString longLongValue];
	NSNumber     *myNSNumber          = [NSNumber numberWithLongLong:myLongLong];
	unsigned int myUnsignedInt        = [myNSNumber unsignedIntValue];
	return myUnsignedInt;
}



-(NSNumber*)changeToFloat:(NSDate*)date{
	
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
	NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
	
	//NSNumber *res = [NSNumber numberWithFloat:[comps month]+[comps day]*0.01];
	NSNumber *res = [[[NSNumber alloc] initWithFloat:[comps month]+[comps day]*0.01] autorelease];
	
	
	[calendar release];
	return res;
	
}

-(NSString *)dateToAs:(NSDate*)date
{
	
	NSArray *as =  [[NSArray alloc] initWithObjects:@"魔羯座",@"水瓶座",@"双鱼座",@"牡羊座",@"金牛座",
					@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",nil];
	
	NSArray *numbers = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:1.19],
					   [NSNumber numberWithFloat:2.18],[NSNumber numberWithFloat:3.20],
					   [NSNumber numberWithFloat:4.20],[NSNumber numberWithFloat:5.20],
					   [NSNumber numberWithFloat:6.21],[NSNumber numberWithFloat:7.22],
					   [NSNumber numberWithFloat:8.22],[NSNumber numberWithFloat:9.22],
					   [NSNumber numberWithFloat:10.22],[NSNumber numberWithFloat:11.22],
					   [NSNumber numberWithFloat:12.21],nil];
	
	NSNumber *n = [self changeToFloat:date];
	
	//NSNumber *n = [NSNumber numberWithFloat:2.12];
	
	int order = -1;
	for (int i  =0 ;i<12;i++) {
		NSNumber *number = [numbers objectAtIndex:i];
		if ([n floatValue] <= [number floatValue]) {
			order = i;
			break;
		}
		
	}
	
	if (order < 0) {
		order = 0;
	}
	
	NSString *res = [[[NSString alloc] initWithString:[as objectAtIndex:order]] autorelease];
	
	[as release];
	[numbers release];
	
	return res;
	
}


-(void)dictionaryPrint:(NSDictionary*)dictionary{
	
	NSArray *keys = [dictionary allKeys];
	
	for (NSString *key in keys) {
		
		id values =  [dictionary objectForKey:key];
		if ([values isKindOfClass:[NSArray class]] || [values isKindOfClass:[NSMutableArray class]]) {
			NSLog([NSString stringWithFormat:@"key :: %@ values ::",key]);
			for (NSString* value in values) {
				NSLog(value);
			}
		}
		else if([values isKindOfClass:[NSDictionary class]] || [values isKindOfClass:[NSMutableDictionary class]])
		{
			NSLog([NSString stringWithFormat:@"key :: %@ values ::",key]);
			[self dictionaryPrint:values];
		}
		
	}
	
}


-(void)transUniversityFormat
{
   NSString *path = [[NSBundle mainBundle] pathForResource:@"personalProfilesData" ofType:@"plist"];
   NSMutableDictionary *totalDataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSMutableDictionary *foreignData = [totalDataDictionary objectForKey:@"国外"];
    NSMutableDictionary *inlandData = [totalDataDictionary objectForKey:@"国内"];
    
    NSMutableDictionary *newForeignData = [[NSMutableDictionary alloc] init];
    for(int i=0;i<[[foreignData allKeys] count];i++)
    {
      
    }
}

@end

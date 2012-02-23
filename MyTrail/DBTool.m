//
//  DBTool.m
//  MyTrail
//
//  Created by alex on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DBTool.h"

@implementation DBTool

static DBTool *sharedInstance = nil;

+ (id)sharedInstance {
	@synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[DBTool alloc] init];
            return sharedInstance;
        }
    }
    return sharedInstance;
}


#pragma mark -
#pragma mark self function

- (id)init {
	if ((self = [super init])) {
		NSString *pathName = [NSString stringWithString:@"Documents/mydb.db"];
		NSString *tmpPath = [NSHomeDirectory() stringByAppendingPathComponent:pathName];
		FMDatabase *tmpDB = [FMDatabase databaseWithPath:tmpPath];
		db = [tmpDB retain];
		if (![db open]) {
			DebugLog(@"Could not open db.");
			//return;
		}
		//[db setShouldCacheStatements:NO];
			}
	return self;
}

- (id)retain {
	return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}



- (id)autorelease {
    return self;
}


-(void)createTrailTable
{
    NSString *createSQL = [NSString stringWithFormat:@"create table %@ (trailID int, )"];
}

-(void)createTrailPicturesTable
{
    FMResultSet *rs = [db executeQuery:testSQL];
	if ([db hadError]) {
		DebugLog([NSString stringWithFormat:@"%s %d ",__FILE__,__LINE__]);
		DebugLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
	if ([rs next]) {
		int count = [rs intForColumn:@"count(*)"];
		if (count == 0) {
			NSString *createSQL = [NSString stringWithFormat:@"create table %@ (recordID int, fromID int, toID int, message blob, time DATETIME, duration double,lat double,lng double,readType int, sendType int)",tableName];
			[db executeUpdate:createSQL];
			if ([db hadError]) {
				DebugLog([NSString stringWithFormat:@"%s %d ",__FILE__,__LINE__]);
				DebugLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
			}
		}
	}
	[rs close];
}

@end

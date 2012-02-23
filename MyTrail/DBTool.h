//
//  DBTool.h
//  MyTrail
//
//  Created by alex on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DBTool : NSObject
{
FMDatabase *db;
}

+ (id)sharedInstance;
@end

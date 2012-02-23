//
//  Picture.h
//  MyTrail
//
//  Created by alex on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trail;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * describe;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) Trail *trail;

@end

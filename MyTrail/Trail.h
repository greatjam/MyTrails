//
//  Trail.h
//  MyTrail
//
//  Created by alex on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface Trail : NSManagedObject

@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSSet * events;
@end

@interface Trail (CoreDataGeneratedAccessors)

- (void)addPicturesObject:(Event *)value;
- (void)removePicturesObject:(Event *)value;
- (void)addPictures:(NSSet *)values;
- (void)removePictures:(NSSet *)values;


@end

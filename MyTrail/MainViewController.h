//
//  ViewController.h
//  MyTrail
//
//  Created by alex on 12-1-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Trail;
@interface MainViewController : UIViewController<NSFetchedResultsControllerDelegate,UITableViewDelegate,UITableViewDataSource>

{
    Trail *trackingTrail;
    NSMutableArray *trailArray;
    UITableView *trailTableView;
    BOOL isTrailOn;
@private
    NSFetchedResultsController *fetchedResultsController_;
    NSManagedObjectContext *managedObjectContext_;
}

@property(nonatomic,retain) IBOutlet UIButton *controlButton;
@property(nonatomic,retain) IBOutlet UIButton *eventButton;
@property(nonatomic,retain) IBOutlet UILabel *timeLabel;
@property (nonatomic,retain) NSTimer *showTimer;
@property(nonatomic,retain) NSDate *startDate;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic,retain) NSMutableArray *trailArray;
@property (nonatomic,assign) BOOL isTrailOn;
@property (nonatomic,retain) Trail *trackingTrail;
@property (nonatomic,retain) IBOutlet UITableView *trailTableView;

-(IBAction)startButtonDown: (id)sender;
-(IBAction)eventButtonDown:(id)sender;
-(void)startTrail;
-(void)endCurrentTrail;
-(void)showTimeChange;
-(void)fetchTrialData;
- (Trail *)createTrail:(NSDate *)theStartDate;
- (BOOL)doAddEvent:(Trail *)trail Describe:(NSString *)describe CreationDate:(NSDate *)creationDate Image:(NSString *)imageName;
- (NSArray *)getTrailsWithPredicate;


@end

//
//  ViewController.m
//  MyTrail
//
//  Created by alex on 12-1-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Event.h"
#import "Trail.h"
#import "MainViewController.h"
#include <math.h>

@implementation MainViewController
@synthesize controlButton;
@synthesize eventButton;

@synthesize timeLabel;
@synthesize showTimer;
@synthesize startDate;
@synthesize trailArray;
@synthesize isTrailOn;
@synthesize trackingTrail;
@synthesize trailTableView;
@synthesize fetchedResultsController=fetchedResultsController_, 
managedObjectContext=managedObjectContext_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
	self.managedObjectContext = appDelegate.managedObjectContext;
    //[self init];
    //[self clearManagedObjectsWithPredicate];
    [self fetchTrialData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

-(IBAction)startButtonDown:(id)sender
{
    if (isTrailOn) {
        [self endCurrentTrail];
    }
    else
    {
        [self startTrail];
    }
}

-(void)startTrail
{
   // self.startDate = [NSDate date];
    showTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(showTimeChange)
                                               userInfo:nil
                                                repeats:YES];
    //controlButton.enabled = NO;
    [controlButton setTitle:@"结束" forState:UIControlStateNormal];
    trackingTrail = [self createTrail:[NSDate date]];
    isTrailOn = YES;
    
}

-(void)endCurrentTrail
{
    [showTimer invalidate];
    showTimer = nil;
    [controlButton setTitle:@"开始" forState:UIControlStateNormal];
    isTrailOn = NO;
    [trackingTrail setEndDate:[NSDate date]];
    //trackingTrail.endDate = [NSDate date];
   // [self fetchTrialData];
    [self updateTrail:trackingTrail];
    [trailTableView reloadData];
}

-(IBAction)eventButtonDown:(id)sender
{
    
}


-(void)showTimeChange
{
   NSDate *currentDate = [NSDate date];
   //int interval = [currentDate timeIntervalSinceDate:startDate];
    int time = round([currentDate timeIntervalSinceDate:startDate] * 10.0/10.0);
   timeLabel.text = [NSString stringWithFormat:@"Trail计时开始：%d",time];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


#pragma mark -
#pragma mark Core Data management
-(void)fetchTrialData
{
    /*
	 Fetch existing events.
	 Create a fetch request; find the Event entity and assign it to the request; add a sort descriptor; then execute the fetch.
	 */
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Trail" inManagedObjectContext:managedObjectContext_];
	[request setEntity:entity];
	
	// Order the events by creation date, most recent first.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"startDate" ascending:NO];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	[request setSortDescriptors:sortDescriptors];
	[sortDescriptor release];
	[sortDescriptors release];
	
	// Execute the fetch -- create a mutable copy of the result.
	NSError *error = nil;
	NSMutableArray *mutableFetchResults = [[managedObjectContext_ executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil || [mutableFetchResults count]<=0) {
		// Handle the error.
        return;
	}
	
	// Set self's events array to the mutable array, then clean up.
	self.trailArray = mutableFetchResults;
    Trail *firstTrail = [trailArray objectAtIndex:0];
    NSSet *theSet = firstTrail.events;
    NSLog(@"trail count:%d, first event count:%d, startdate:%@,enddate:%@",[trailArray count],[theSet count],[firstTrail.startDate description],[firstTrail.endDate description]);
	[mutableFetchResults release];
	[request release];
}

-(void)fetchEventData:(Trail *)trail
{
	
}

-(void)updateTrail:(Trail *)trail
{
    // Retrieve the context
    if (managedObjectContext_ == nil) {
        managedObjectContext_ = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    
    // Retrieve the entity from the local store -- much like a table in a database
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Trail" inManagedObjectContext:managedObjectContext_];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Set the predicate -- much like a WHERE statement in a SQL database
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", trail];
    [request setPredicate:predicate];
    
    // Set the sorting -- mandatory, even if you're fetching a single record/object
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"yourIdentifyingQualifier" ascending:YES];
//    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
//    [request setSortDescriptors:sortDescriptors];
//    [sortDescriptors release]; sortDescriptors = nil;
//    [sortDescriptor release]; sortDescriptor = nil;
    
    NSError *error;
    // Request the data -- NOTE, this assumes only one match, that 
    // yourIdentifyingQualifier is unique. It just grabs the first object in the array. 
    Trail *theTrail = [[managedObjectContext_ executeFetchRequest:request error:&error] objectAtIndex:0];
    [request release]; request = nil;
    //Update the object
    
    theTrail.endDate = trail.endDate;
   // theTrail.ExampleNSDateAttributeName = [NSDate date];
    //Save the change
    [self.managedObjectContext save:&error];
}


- (Trail *)createTrail:(NSDate *)theStartDate{
	Trail *trail =  
	[NSEntityDescription insertNewObjectForEntityForName:@"Trail" 
                                  inManagedObjectContext:self.managedObjectContext];
	// If appropriate, configure the new managed object.
    [trail setStartDate:theStartDate];
    //[trail setName:[NSString stringWithFormat:@"category%d",i]];
    for(int i = 30; i < 36; i++){
		NSString *image = [NSString stringWithFormat:@"IMG_00%d.PNG",i];		
        [self doAddEvent:trail Describe:@"test" CreationDate:[NSDate date] Image:image];
	}	
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
	 	NSLog(@"Error: %@", [error localizedDescription]);
	 	return FALSE;
    }	
    return trail;	 
}

- (BOOL)doAddEvent:(Trail *)trail Describe:(NSString *)describe CreationDate:(NSDate *)creationDate Image:(NSString *)imageName{
	
	// Create a new instance of the entity managed by the fetched results controller.
    //NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    //NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
	
	NSURL *url = [NSURL URLWithString: [self getImagePath:imageName]];
	NSData *imageData = [NSData dataWithContentsOfURL:url]; 	
    
    Event *newEvent  = 
    [NSEntityDescription insertNewObjectForEntityForName:@"Event" 
								  inManagedObjectContext:self.managedObjectContext];
    [newEvent setTrail:trail];
    [newEvent setDescribe:describe];
    [newEvent setCreationDate:creationDate];
    [newEvent setImage:imageData];
	
    //NSError *error = nil;
	//if (![self.managedObjectContext save:&error]) {
	//	NSLog(@"Error: %@", [error localizedDescription]);
	//	return FALSE;
	//}
    // Save the context.
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }	
	return TRUE;
	
}

- (NSString *)getImagePath:(NSString *)imageName{
	NSString *homePath = [[NSBundle mainBundle] executablePath];
	NSArray *strings = [homePath componentsSeparatedByString: @"/"];
	NSString *executableName  = [strings objectAtIndex:[strings count]-1];	
	NSString *rawDirectory = [homePath substringToIndex:
							  [homePath length]-[executableName length]-1];
	NSString *baseDirectory = [rawDirectory stringByReplacingOccurrencesOfString:@" " 
																	  withString:@"%20"];
	NSString *imagePath = [NSString stringWithFormat:@"file://%@/%@",baseDirectory,imageName];	
    NSLog(@"imagePath: %@",imagePath);
	return imagePath;
}


- (NSArray *)getTrailsWithPredicate{
	
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent = [NSEntityDescription entityForName:@"Trail" 
                                           inManagedObjectContext:self.managedObjectContext];
    [request setEntity:ent];
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"uid == %d",iCurrentCategory];
//    [request setPredicate:pred];
    NSArray *objects = [self.managedObjectContext executeFetchRequest:request error:NULL];
    [request release];
    		
    return objects;
}

- (void)clearManagedObjectsWithPredicate { //:(NSManagedObject*)except{
	//NSPredicate * allExcept = [NSPredicate predicateWithFormat:@"SELF != %@", exception];
	//NSArray *objects = [self fetchMyManagedObjectsWithPredicateOrNil:nil];	
	NSArray *objects = [self getTrailsWithPredicate];	
	for (NSManagedObject *object in objects) {
		[self.managedObjectContext deleteObject:object];
	}	
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return[trailArray count];	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    static NSString *cellIdentifier = @"TrailIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[trailTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    Trail* trail = (Trail *)[trailArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = [NSString stringWithFormat:@"第%d段 from:%@ to:%@",indexPath.row,trail.startDate,trail.endDate];
    return cell;
}

@end

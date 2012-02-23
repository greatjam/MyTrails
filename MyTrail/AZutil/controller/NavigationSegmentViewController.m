//
//  SegmentViewController.m
//  Binfen
//
//  Created by alex on 11-11-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationSegmentViewController.h"
#import "SegmentSubViewController.h"
@implementation NavigationSegmentViewController
@synthesize titles;
@synthesize switchControl;
@synthesize viewControllers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithViewControllers:(NSArray *)controllers titles:(NSArray *)theTitles
{
    self = [super init];
    if(self)
    {
        self.viewControllers = controllers;
        self.titles = theTitles;
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    UISegmentedControl *m_segmentedControl = [[UISegmentedControl alloc] initWithItems:titles];
    [m_segmentedControl addTarget:self action:@selector(segChanged) forControlEvents:UIControlEventValueChanged];
    m_segmentedControl.frame = CGRectMake(0, 0, 60*[viewControllers count], 30);
    m_segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    m_segmentedControl.selectedSegmentIndex = 0;
    self.switchControl = m_segmentedControl;
    [m_segmentedControl release];
    self.navigationItem.titleView = switchControl;
    for(UIViewController *controller in viewControllers)
    {
      if([controller isKindOfClass:[SegmentSubViewController class]])
      {
          SegmentSubViewController *newController = (SegmentSubViewController *)controller;
          newController.parentNavController = self.navigationController;
      }
    }
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self showViewOfIndex:0];
}


-(void)segChanged
{
    int index = switchControl.selectedSegmentIndex;
    [self showViewOfIndex:index];
    
}

-(void)setControllersNav
{
    for(UIViewController *controller in viewControllers)
    {
        
    }
}

-(void)showViewOfIndex:(int)index
{
    for(int i=0;i<[viewControllers count];i++)
    {
      if(i==index)
      {
          
             UIViewController *newcontroller = [viewControllers objectAtIndex:i];
              newcontroller.view.frame = CGRectMake(0, 0, 320, 450);
              [self.view addSubview:newcontroller.view];
          
      }
      else
      {
          UIViewController *invisibleController = [viewControllers objectAtIndex:i];
          [invisibleController.view removeFromSuperview];
      }
    }
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

-(void)dealloc
{
    self.switchControl = nil;
    self.viewControllers = nil;
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

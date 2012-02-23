//
//  ToolbarSegmentViewController.m
//  Binfen
//
//  Created by alex on 11-11-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ToolbarSegmentViewController.h"
#import "SegmentSubViewController.h"

@implementation ToolbarSegmentViewController
@synthesize titles;
@synthesize switchControl;
@synthesize viewControllers;
@synthesize toolBar;
@synthesize recoverTabWhenQuit;

-(id)initWithViewControllers:(NSArray *)controllers titles:(NSArray *)theTitles
{
    self = [super init];
    if(self)
    {
        self.viewControllers = controllers;
        self.titles = theTitles;
        self.hidesBottomBarWhenPushed = YES;
        recoverTabWhenQuit = NO;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

 
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    [self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithString:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(backToParentView)];
    [self.navigationItem setLeftBarButtonItem:temporaryBarButtonItem];
    [temporaryBarButtonItem release];
    
    UISegmentedControl *m_segmentedControl = [[UISegmentedControl alloc] initWithItems:titles];
    [m_segmentedControl addTarget:self action:@selector(segChanged) forControlEvents:UIControlEventValueChanged];
    m_segmentedControl.frame = CGRectMake(0, 0, 80*[viewControllers count], 30);
    m_segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    m_segmentedControl.selectedSegmentIndex = 0;
    self.switchControl = m_segmentedControl;
    [m_segmentedControl release];
    //self.navigationItem.titleView = switchControl;
    [self showViewOfIndex:0];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:switchControl];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *toolBarItems = [NSArray arrayWithObjects:flexibleSpace,barItem,flexibleSpace,nil];
    [barItem release];
    [flexibleSpace release];
    
    UIToolbar *tBar = [[UIToolbar alloc] init];
    self.toolBar = tBar;
    [tBar release];
    toolBar.barStyle = UIBarStyleBlack;
    [toolBar sizeToFit];
    toolBar.items = toolBarItems;
    [toolBar setFrame:CGRectMake(0,480-44-20-44,320,44)];
   //[self.view addSubview:toolBar];
    for(UIViewController *controller in viewControllers)
    {
        if([controller isKindOfClass:[SegmentSubViewController class]])
        {
            SegmentSubViewController *newController = (SegmentSubViewController *)controller;
            newController.parentNavController = self.navigationController;
        }
    }
    [self.view addSubview:toolBar];
    [self hideSystemTabBar];
}

-(void)backToParentView
{
    [self.navigationController popViewControllerAnimated:YES];
    [toolBar removeFromSuperview];
    
    if(recoverTabWhenQuit==YES)
    [self showSystemTabBar];
}

-(void)hideSystemTabBar
{
   
}

-(void)showSystemTabBar
{
   //显示原tabBar
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self showSystemTabBar];

}

-(void)segChanged
{
    int index = switchControl.selectedSegmentIndex;
    [self showViewOfIndex:index];
    
}

-(void)showViewOfIndex:(int)index
{
    for(int i=0;i<[viewControllers count];i++)
    {
        if(i==index)
        {
            
                UIViewController *newcontroller = [viewControllers objectAtIndex:i];
                newcontroller.view.frame = CGRectMake(0, 0, 320, 480-44-20-44);
                [self.view addSubview:newcontroller.view];
        }
        else
        {
            UIViewController *invisibleController = [viewControllers objectAtIndex:i];
            [invisibleController.view removeFromSuperview];
        }
    }
    
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

-(void)dealloc
{
    self.toolBar = nil;
    self.switchControl = nil;
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.toolBar = nil;
    self.switchControl = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  CustomTabBar.m
//  LeqiClient
//
//  Created by ui on 11-5-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "Reachability.h"

@implementation CustomTabBarViewController

@synthesize currentSelectedIndex;
@synthesize tabItemsView;
@synthesize backgroundView;
@synthesize slideBg;
@synthesize buttons;

-(void)viewDidLoad
{
    [super viewDidLoad];
   UIImageView *sView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomfocus.png"]];
    self.slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomfocus.png"]];
    [sView release];
    
}

- (void)viewDidAppear:(BOOL)animated{
	//slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomfocus.png"]];
	[super viewDidAppear:YES];
    [self resetTabBar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}



- (void)hideExistingTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

-(void)resetTabBar
{
    [self hideRealTabBar];
	[self customTabBar];
}

- (void)hideRealTabBar{
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.hidden = YES;
			break;
		}
	}
}

-(void)hideCustomItems
{
  //  self.tabBar.hidden = YES;
    backgroundView.hidden=YES;
    slideBg.hidden=YES;
    tabItemsView.hidden=YES;
    for(UIButton *button in buttons)
        button.hidden = YES;
    
}

-(void)showCustomItems
{
  //  self.tabBar.hidden = NO;
    backgroundView.hidden=NO;
    slideBg.hidden=NO;
    tabItemsView.hidden=NO;
    for(UIButton *button in buttons)
        button.hidden = NO;
}

- (void)customTabBar{
    if(backgroundView==nil)
    {
	UIImageView *imgView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tabbg2.png"]];
	imgView.frame = CGRectMake(0, 425, imgView.image.size.width, imgView.image.size.height);
    self.backgroundView = imgView;
        [imgView release];
	[self.view addSubview:backgroundView];
    }
    
    if(buttons==nil)
    {
	int viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
	self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
	double _width = 320 / viewCount;
	double _height = self.tabBar.frame.size.height;
	for (int i = 0; i < viewCount; i++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.frame = CGRectMake(i*_width,self.tabBar.frame.origin.y, _width, _height);
		[btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
		btn.tag = i;
		[self.buttons addObject:btn];
		[self.view  addSubview:btn];
		//[btn release];
	}
    slideBg.frame = CGRectMake(-30, self.tabBar.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
	[self.view addSubview:slideBg];
    }
    if(tabItemsView==nil)
    {
	UIImageView *imgFront = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabitem.png"]];
	imgFront.frame = backgroundView.frame;
    self.tabItemsView = imgFront;
	[self.view addSubview:tabItemsView];
	[imgFront release];
    }
	[self selectedTab:[self.buttons objectAtIndex:0]];

}

- (void)selectedTab:(UIButton *)button{
	if (self.currentSelectedIndex == button.tag) {
		
	}
	self.currentSelectedIndex = button.tag;
	self.selectedIndex = self.currentSelectedIndex;
	[self performSelector:@selector(slideTabBg:) withObject:button];
}

- (void)slideTabBg:(UIButton *)btn{
	[UIView beginAnimations:nil context:nil];  
	[UIView setAnimationDuration:0.20];  
	[UIView setAnimationDelegate:self];
    DebugLog(@"slide:%@ btn:%@",NSStringFromCGRect(btn.frame),NSStringFromCGRect(slideBg.frame));
	slideBg.frame = CGRectMake(btn.frame.origin.x - 30, btn.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
	[UIView commitAnimations];
}

- (void) dealloc{
	[slideBg release];
	[buttons release];
	[super dealloc];
}


@end

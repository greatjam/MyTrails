//
//  ScrollMenubar.m
//  Untitled
//
//  Created by huang yongbin on 8/7/10.
//  Copyright 2010 libii2010@gmail.com . All rights reserved.
//

#import "ScrollMenubar.h"
#import <QuartzCore/QuartzCore.h>

@interface ScrollMenubar(private)

- (void)removeButtonsFromView:(UIView*)view;
- (void)setupButtonsInView:(UIView*)view inPage:(NSUInteger)page;
- (void)setupScrollView;
- (void)mathLayOutInfo;
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;

@end

#define TOPSPACE 20.0
#define LEFTSPACE 25.0
#define RIGHTSPACE 10.0
#define BOTTOMSPACE 20.0
#define SPACE 30

#define LABELSECTION 3
#define LABELHEIGHT 12
#define VIEWEDGE 4


@implementation ScrollMenubar
@synthesize backgroundImage,menubarItems,scrollView,pageControl,views,btnLabelList;
@synthesize delegate;
@synthesize layout;


- (id)initWithFrame:(CGRect)frame layout:(CGLayout)theLayout{
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		self.backgroundColor = [UIColor blackColor];
		layout = theLayout;//CGLayoutMake(TOPSPACE, BOTTOMSPACE, LEFTSPACE, RIGHTSPACE, SPACE);
    }
    return self;
}

// init the scroll menubar view
- (id)initWithFrame:(CGRect)frame withMenubarItems:(NSArray*)buttonItems Names:(NSArray *)names layout:(CGLayout)theLayout
{
	if ((self = [super initWithFrame:frame]))
	{
        // Initialization code
		self.backgroundColor = [UIColor blackColor];
		layout = theLayout;//CGLayoutMake(TOPSPACE, BOTTOMSPACE, LEFTSPACE, RIGHTSPACE, SPACE);
		[buttonItems retain];
		[menubarItems release];
		menubarItems = buttonItems;
        self.btnLabelList = [NSMutableArray array];
        for(NSString *name in names)
        {
            UILabel *nLabel = [[UILabel alloc] init];
            nLabel.text = name;
            nLabel.font = [UIFont systemFontOfSize:12];
            nLabel.backgroundColor = [UIColor clearColor];
            nLabel.textAlignment = UITextAlignmentCenter;
            nLabel.textColor = [UIColor whiteColor];
            [btnLabelList addObject:nLabel];
            [nLabel release];
        }
		[self mathLayOutInfo];
	    [self setupScrollView];
    }
    return self;
}

// set background Image
-(void)setBackgroundImage:(UIImage*)image
{
	[image retain];
	[backgroundImage release];
	backgroundImage = image;
	[self setNeedsDisplay];
}

// set items of menubar
-(void)setMenubarItems:(NSArray *)buttonItems
{
	[buttonItems retain];
	[menubarItems release];
	menubarItems = buttonItems;
	[self setNeedsDisplay];
	[self mathLayOutInfo];
	[self setupScrollView];
}

// set layout info
-(void)setLayout:(CGLayout)_layout
{
	layout = _layout;
	[self setNeedsDisplay];
	[self mathLayOutInfo];
	[self setupScrollView];
}

// compute the info of layout
- (void)mathLayOutInfo
{
	if (menubarItems == nil || [menubarItems count] == 0) {
		return;
	}
	UIButton *btn = [menubarItems objectAtIndex:0];
	if (btn.frame.size.width < self.frame.size.width && btn.frame.size.height < self.frame.size.height) {
		columnCount = (self.frame.size.width - layout.leftSpace	- layout.rightSpace + layout.space)/(btn.frame.size.width+layout.space);
		rowCount = (self.frame.size.height - layout.topSpace - layout.bottomSpace + layout.space)/(btn.frame.size.height+layout.space);
		kNumberOfItemsPerPage = columnCount * rowCount;
		kNumberOfPages = ([menubarItems count] -1)/kNumberOfItemsPerPage + 1;
	}
}

// setup scroll view
- (void)setupScrollView
{
	// remove existed scrollView
	if ([[self subviews] indexOfObject:scrollView] >= 0) {
		[scrollView removeFromSuperview];
		[scrollView release];
	}
	// view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
	NSMutableArray *tViews = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
        [tViews addObject:[NSNull null]];
    }
    self.views = tViews;
    [tViews release];
	// set attribute of scrollView 
	// a page is the width of the scroll view
	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
	scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:scrollView];
	
	if (pageControl == nil) {
		pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 30, self.frame.size.width, 18)];
	}
	pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
	[pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
	[self addSubview:pageControl];
	[self bringSubviewToFront:pageControl];
	
	// pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
	[self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
	
    // replace the placeholder if necessary
    UIView *tView = [views objectAtIndex:page];
    if ((NSNull *)tView == [NSNull null]) {
        tView = [[UIView alloc] initWithFrame:scrollView.frame];
        [views replaceObjectAtIndex:page withObject:tView];
        [tView release];
    }
	
    // add the controller's view to the scroll view
    if (nil == tView.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        tView.frame = frame;
		[self removeButtonsFromView:tView];
		[self setupButtonsInView:tView inPage:page];
        [scrollView addSubview:tView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

// remove all buttons before setup buttons
- (void)removeButtonsFromView:(UIView*)view
{
	for(id item in view.subviews)
	{
		if ([NSStringFromClass([item class]) isEqualToString:@"UIButton"]) {
			[item removeFromSuperview];
		}
	}
}

// setup new buttons
- (void)setupButtonsInView:(UIView*)view inPage:(NSUInteger)page
{
	int btnIndex = page * kNumberOfItemsPerPage;
	if (view == nil) {
		return;
	}
	for(int i=0;i<kNumberOfItemsPerPage;i++)
	{
		if (btnIndex >= [menubarItems count]) {
			return;
		}
		UIButton *btn = [menubarItems objectAtIndex:btnIndex];
		CGFloat tX;
		CGFloat tY;
		// compute layout of buttons  
		if (btnIndex%columnCount == 0) {
			tX = layout.leftSpace;
		}
		//else if((btnIndex+1)%kNumberOfItemsPerPage == 0) {
//			tX = self.frame.size.width - RIGHTSPACE - btn.frame.size.width;
//		}
		else {
			UIButton *btnBefore = [menubarItems objectAtIndex:btnIndex-1];
			tX = btnBefore.frame.origin.x + btnBefore.frame.size.width + layout.space;
		}
//		if (btnIndex < columnCount*(page*rowCount+1) ) {
//			tY = layout.topSpace;
//		}
//		else {
//			UIButton *btnTop = [menubarItems objectAtIndex:btnIndex-1];
//			tY = btnTop.frame.origin.y + btnTop.frame.size.height + layout.space;
//		}
        int t = (btnIndex%kNumberOfItemsPerPage)/columnCount;
        tY = layout.topSpace + t*(layout.space+btn.frame.size.height);
        
		btn.frame = CGRectMake(tX+VIEWEDGE, tY, btn.frame.size.width, btn.frame.size.height);
        btn.layer.cornerRadius = 5;
		btn.layer.masksToBounds = YES;
        NSLog(@"The btn frame:%@",NSStringFromCGRect(btn.frame));
		btn.tag = btnIndex;
		[btn addTarget:self
				action:@selector(clickButton:) 
	    forControlEvents:UIControlEventTouchUpInside];
		[view addSubview:btn];
        
        UILabel *buttonLabel = [btnLabelList objectAtIndex:btnIndex];
        buttonLabel.frame = CGRectMake(btn.frame.origin.x,btn.frame.origin.y+btn.frame.size.height+LABELSECTION,btn.frame.size.width,LABELHEIGHT);
        [view addSubview:buttonLabel];
        
		btnIndex ++;
	}
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// Drawing code
	[[backgroundImage stretchableImageWithLeftCapWidth:21 topCapHeight:16] drawInRect:rect];
}

#pragma mark -
#pragma mark privateMethods
- (void)clickButton:(id)sender{
	UIButton *button = (UIButton*)sender;
	if([self.delegate respondsToSelector:@selector(menubar:clickedButtonAtIndex:)]){
		[self.delegate menubar:self clickedButtonAtIndex:button.tag];
	}
}

- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    // update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

- (void)dealloc
{
	[backgroundImage release];
	[menubarItems release];
	[views release];
	[scrollView release];
	[pageControl release];
    [super dealloc];
}


@end

//
//  ScrollMenubar.h
//  Untitled
//
//  Created by huang yongbin on 8/7/10.
//  Copyright 2010 libii2010@gmail.com . All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ScrollMenubarDelegate;

/* Layout. */
struct CGLayout {
	CGFloat topSpace;
	CGFloat bottomSpace;
	CGFloat leftSpace;
	CGFloat rightSpace;
	CGFloat space;
};
typedef struct CGLayout CGLayout;

CG_INLINE CGLayout CGLayoutMake(CGFloat topSpace, CGFloat bottomSpace,CGFloat leftSpace,CGFloat rightSpace,CGFloat space);

CG_INLINE CGLayout
CGLayoutMake(CGFloat topSpace, CGFloat bottomSpace,CGFloat leftSpace,CGFloat rightSpace,CGFloat space)
{
	CGLayout layout;
	layout.topSpace = topSpace; 
	layout.bottomSpace = bottomSpace;
	layout.leftSpace = leftSpace;
	layout.rightSpace = leftSpace;
	layout.space = space;
	return layout;
}
@interface ScrollMenubar : UIView <UIScrollViewDelegate>
{
	UIImage *backgroundImage;
	NSArray *menubarItems;
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	NSMutableArray *views;
    NSMutableArray *btnLabelList;
	id<ScrollMenubarDelegate> delegate;
	CGLayout layout;
	// To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
	
	 int kNumberOfPages;
	 int kNumberOfItemsPerPage;
	 int columnCount;
	 int rowCount;
}

@property (nonatomic,retain) UIImage *backgroundImage;
@property (nonatomic,retain) UIScrollView *scrollView;
@property (nonatomic,retain) UIPageControl *pageControl;
@property (nonatomic,retain) NSMutableArray *btnLabelList;
@property (nonatomic,retain) NSArray *menubarItems;
@property (nonatomic, retain) NSMutableArray *views;
@property (nonatomic,assign) id<ScrollMenubarDelegate> delegate;
@property (nonatomic,assign) CGLayout layout;;

- (id)initWithFrame:(CGRect)frame layout:(CGLayout)theLayout;
- (id)initWithFrame:(CGRect)frame withMenubarItems:(NSArray*)buttonItems Names:(NSArray *)names layout:(CGLayout)theLayout;

- (IBAction)changePage:(id)sender;

@end

@protocol ScrollMenubarDelegate <NSObject>

- (void)menubar:(ScrollMenubar *)menubar clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

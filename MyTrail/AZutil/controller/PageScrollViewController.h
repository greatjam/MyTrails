//
//  PageScrollViewController.h
//  Binfen
//
//  Created by alex on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageScrollViewController : UIViewController
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}

@property(nonatomic,retain) UIScrollView *scrollView;
@property(nonatomic,retain) UIPageControl *pageControl;


@end

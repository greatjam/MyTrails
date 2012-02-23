//
//  SegmentViewController.h
//  Binfen
//
//  Created by alex on 11-11-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationSegmentViewController : UIViewController

{
    UISegmentedControl *switchControl;
    NSArray *viewControllers;
    NSArray *titles;
}

@property(nonatomic,retain) UISegmentedControl *switchControl;
@property(nonatomic,retain) NSArray *viewControllers;
@property(nonatomic,retain) NSArray *titles; 

-(void)showViewOfIndex:(int)index;
-(id)initWithViewControllers:(NSArray *)controllers titles:(NSArray *)theTitles;

@end

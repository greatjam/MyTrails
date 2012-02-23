//
//  ToolbarSegmentViewController.h
//  Binfen
//
//  Created by alex on 11-11-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolbarSegmentViewController : UIViewController

{
    UISegmentedControl *switchControl;
    NSArray *viewControllers;
    NSArray *titles;
    UIToolbar *toolBar;
    BOOL recoverTabWhenQuit;
}

@property(nonatomic,retain) UISegmentedControl *switchControl;
@property(nonatomic,retain) NSArray *viewControllers;
@property(nonatomic,retain) NSArray *titles; 
@property(nonatomic,retain) UIToolbar *toolBar;
@property(nonatomic,assign) BOOL recoverTabWhenQuit;

-(void)showViewOfIndex:(int)index;
-(id)initWithViewControllers:(NSArray *)controllers titles:(NSArray *)theTitles;
-(void)backToParentView;
-(void)hideSystemTabBar;
-(void)showSystemTabBar;

@end

//
//  CustomTabBar.h
//  LeqiClient
//
//  Created by ui on 11-5-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTabBarViewController : UITabBarController {
	NSMutableArray *buttons;
	int currentSelectedIndex;
	UIImageView *slideBg;
    UIImageView *tabItemsView;
    UIImageView *backgroundView;
    
}
@property (nonatomic, assign) int	currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;
@property (nonatomic,retain) UIImageView *slideBg;
@property (nonatomic,retain) UIImageView *tabItemsView;
@property (nonatomic,retain) UIImageView *backgroundView;

-(void)resetTabBar;
- (void)hideRealTabBar;
- (void)customTabBar;
- (void)hideExistingTabBar;
-(void)hideCustomItems;
-(void)showCustomItems;
- (void)selectedTab:(UIButton *)button;
@end


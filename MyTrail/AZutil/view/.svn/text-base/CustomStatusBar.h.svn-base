//
//  CustomStatusBar.h
//  CC
//
//  Created by alex on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	hide = 0,
	connecting,
	disconnected,
	isconnecting,
	isDisconnecting,
	newFriend,
	newMessage
} BarStatus;

@interface CustomStatusBar : UIWindow
{
//@private
	UIImageView* bubbleView;
	UIImageView* backgroundView;
	UILabel* _statusLabel; // Text label to display informations
	UILabel* nameLabel;
	UIActivityIndicatorView* _indicator; // The indicator
	BarStatus status;
}
@property(nonatomic,retain) UILabel* nameLabel;

-(void)showWithStatusMessage:(NSString*)msg;
-(void)setBarStatus:(int)currentStatus;
-(void)hide;
-(void)stopAnimate;
+ (id)sharedInstance;
-(void)setBarBubble:(NSString *)senderName;
-(void)setNewFriendAdded:(NSString *)friendName;
@end

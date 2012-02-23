//
//  BubbleView.h
//  MM
//
//  Created by alex on 11-5-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonViewDelegate;


@interface ButtonView : UIView {

	BOOL isTouching;
	BOOL inside;
	CGPoint touchPoint;
	CGPoint prePoint;
	id<ButtonViewDelegate> delegate;
}
@property(nonatomic,assign) BOOL inside;
@property(nonatomic,retain) id<ButtonViewDelegate> delegate;
@end

@protocol ButtonViewDelegate
-(void)buttonTouchBegin;
-(void)buttonTouchMoveIn;
-(void)buttonTouchMoveOut;
-(void)buttonTouchEnd;
@end

//
//  BubbleView.m
//  MM
//
//  Created by alex on 11-5-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ButtonView.h"


@implementation ButtonView
@synthesize delegate;
@synthesize inside;
- (id)initWithFrame:(CGRect)frame {
    
	DebugLog(@"init buttonView");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.userInteractionEnabled = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	DebugLog(@"buttonview touchesbegan");
	isTouching = YES;
	inside = YES;
	UITouch* touch = [[event touchesForView:self] anyObject];
	touchPoint = [touch locationInView:self];
	prePoint = touchPoint;
	[delegate buttonTouchBegin];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  	//CGRect bounds = [self bounds];
	DebugLog(@"buttonview touchesMoved");
	UITouch* touch = [[event touchesForView:self] anyObject];
	touchPoint = [touch locationInView:self];
	if (touchPoint.y<=self.frame.size.height && touchPoint.x<=self.frame.size.width && touchPoint.y>=0 &&touchPoint.x>=0) {
		if (inside==NO) {
			DebugLog(@"buttonview touchesMoveIn");
			[delegate buttonTouchMoveIn];
		}
		inside = YES;
	}
	else {
		if (inside==YES) {
			DebugLog(@"buttonview touchesMoveOut");
			[delegate buttonTouchMoveOut];
		}
		inside = NO;
	}

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	DebugLog(@"buttonview touchesEnd");
	[delegate buttonTouchEnd];
	isTouching = NO;
	inside = NO;
}


- (void)dealloc {
    [super dealloc];
}


@end

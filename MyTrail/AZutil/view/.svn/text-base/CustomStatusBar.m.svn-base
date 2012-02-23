//
//  CustomStatusBar.m
//  CC
//
//  Created by alex on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomStatusBar.h"
@implementation CustomStatusBar

static CustomStatusBar *sharedInstance = nil;
static const int fullBarLength = 320;
static const int partBarLength = 120;
static const int statusLabelLength = 80;
@synthesize nameLabel;
+ (id)sharedInstance {
	@synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[CustomStatusBar alloc] initWithFrame:CGRectZero];
            return sharedInstance;
        }
    }
    return sharedInstance;
}

-(id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame]))
	{
		// Place the window on the correct level & position
		self.windowLevel = UIWindowLevelStatusBar + 1.0f;
		self.frame = [UIApplication sharedApplication].statusBarFrame;
		// Create an image view with an image to make it look like the standard grey status bar
		backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 0, partBarLength, self.frame.size.height)];
		backgroundView.image = [[UIImage imageNamed:@"statusbar_background.png"] stretchableImageWithLeftCapWidth:2 topCapHeight:0];
		[self addSubview:backgroundView];
//		
		
		_indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		_indicator.frame = CGRectMake(200, 3, self.frame.size.height - 6, self.frame.size.height - 6);
		//(CGRect){.origin.x = 185.0+27, .origin.y = 3.0f, .size.width = self.frame.size.height - 6, .size.height = self.frame.size.height - 6};
		_indicator.hidesWhenStopped = YES;
		[self addSubview:_indicator];
		
		_statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(200+self.frame.size.height,0 ,80, self.frame.size.height)];
						//(CGRect){.origin.x = self.frame.size.height+185+28, .origin.y = 0.0f, .size.width = 200.0f, .size.height = self.frame.size.height}];
		_statusLabel.backgroundColor = [UIColor clearColor];
		_statusLabel.textAlignment = UITextAlignmentRight;
		_statusLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
		_statusLabel.font = [UIFont boldSystemFontOfSize:11.0f];
		
		[self addSubview:_statusLabel];
		
		bubbleView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 0, 20, 20)];
		bubbleView.image = [UIImage imageNamed:@"litte_bubble.png"];
		[self addSubview:bubbleView];
		
		nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 0, 100, 20)];
		nameLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
		nameLabel.font = [UIFont boldSystemFontOfSize:11];
		nameLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:nameLabel];
	}
	return self;
}



-(void)showWithUnreadMessage:(NSString*)fromUser
{

}

-(void)setBarStatus:(int)currentStatus
{
//  switch (currentStatus) {
//	  case isConnecting:
//		  status = isconnecting;
//		  backgroundView.frame = CGRectMake(self.frame.size.width-fullBarLength, 0, fullBarLength, self.frame.size.height);
//		  _statusLabel.bounds = CGRectMake(0, 0, statusLabelLength, self.frame.size.height);
//		   _statusLabel.center = CGPointMake(145, self.frame.size.height/2);
//		  _indicator.frame = CGRectMake( 0, 3, self.frame.size.height - 6, self.frame.size.height - 6);
//		  _statusLabel.text = [NSString stringWithString:@"正在连接"];
//		  _statusLabel.hidden = NO;
//		  backgroundView.hidden = NO;
//		  bubbleView.hidden = YES;
//		  nameLabel.hidden = YES;
//		  DebugLog(NSStringFromCGRect(_indicator.frame));
//		  [_indicator startAnimating];
//		  self.hidden = NO;
//		  break;
//	  case isConnected:
//		   status = hide;
//		  _statusLabel.hidden = YES;
//		  backgroundView.hidden = YES;
//		  bubbleView.hidden = YES;
//		  nameLabel.hidden = YES;
//		   [_indicator stopAnimating];
//		  self.hidden = YES;
//		  break;
//      case isDisConnected:
//		   status = disconnected;
//		  _statusLabel.hidden = NO;
//		  backgroundView.hidden = NO;
//		  bubbleView.hidden = YES;
//		  nameLabel.hidden = YES;
//		  [_indicator stopAnimating];
//		  self.hidden = NO;
//		  backgroundView.frame = CGRectMake(self.frame.size.width-partBarLength, 0, partBarLength, self.frame.size.height);
//		  _statusLabel.bounds = CGRectMake(0, 0, statusLabelLength, self.frame.size.height);
//           _statusLabel.center = CGPointMake(backgroundView.frame.origin.x+partBarLength/2, self.frame.size.height/2);
//		  _indicator.frame = CGRectMake( backgroundView.frame.size.width*0.2, 3, self.frame.size.height - 6, self.frame.size.height - 6);
//		  _statusLabel.text = [NSString stringWithString:@"未连接"];
//		  break;
//      case isDisConnecting:
//		  status = isDisConnecting;
//		  backgroundView.frame = CGRectMake(self.frame.size.width-fullBarLength, 0, fullBarLength, self.frame.size.height);
//		  _statusLabel.bounds = CGRectMake(0, 0, statusLabelLength, self.frame.size.height);
//		  _statusLabel.center = CGPointMake(backgroundView.frame.origin.x+fullBarLength/2, self.frame.size.height/2);
//		  _indicator.frame = CGRectMake( backgroundView.frame.size.width*0.2, 3, self.frame.size.height - 6, self.frame.size.height - 6);
//		  _statusLabel.text = [NSString stringWithString:@"断开中"];
//		  _statusLabel.hidden = NO;
//		  backgroundView.hidden = NO;
//		  bubbleView.hidden = YES;
//		  nameLabel.hidden = YES;
//		  [_indicator startAnimating];
//		  self.hidden = NO;
//		  break;
//		
//
//	  default:
//		  break;
//  }
}

-(void)setNewFriendAdded:(NSString *)friendName
{
	status = newFriend;
	backgroundView.frame = CGRectMake(self.frame.size.width-partBarLength, 0, partBarLength, self.frame.size.height);
	DebugLog(NSStringFromCGRect(backgroundView.frame));
	_statusLabel.hidden = YES;
	backgroundView.hidden = NO;
	[_indicator stopAnimating];
	bubbleView.hidden = NO;
	nameLabel.frame = CGRectMake(220, 0, 100, 20);
	nameLabel.hidden = NO;
	nameLabel.text = [NSString stringWithFormat:@"新的好友%@",friendName];
	self.hidden = NO;
}

-(void)setBarBubble:(NSString *)senderName
{
	status=newMessage;
	//backgroundView.image = [[UIImage imageNamed:@"statusbar_background.png"] stretchableImageWithLeftCapWidth:2 topCapHeight:0];
	 backgroundView.frame = CGRectMake(self.frame.size.width-partBarLength, 0, partBarLength, self.frame.size.height);
	DebugLog(NSStringFromCGRect(backgroundView.frame));
	_statusLabel.hidden = YES;
	backgroundView.hidden = NO;
	[_indicator stopAnimating];
	bubbleView.hidden = NO;
	nameLabel.frame = CGRectMake(220, 0, 100, 20);
	nameLabel.hidden = NO;
	nameLabel.text = senderName;
	self.hidden = NO;
}

-(void)showWithStatusMessage:(NSString*)msg
{
	if (!msg) return;
	_statusLabel.hidden = NO;
	_statusLabel.text = msg;
	[_indicator startAnimating];
	self.hidden = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	DebugLog(@"buttonview touchesbegan");
	UITouch* touch = [[event touchesForView:self] anyObject];
	CGPoint touchPoint = [touch locationInView:self];
	if(touchPoint.x>self.frame.size.width-partBarLength)
	{
//	  if (status==newMessage) 
//	  { [[NSNotificationCenter defaultCenter] postNotificationName:gotoNewMessageNotification object:nil];}
//	  else if(status==newFriend){
//		  [[NSNotificationCenter defaultCenter] postNotificationName:AddNewFriendNotification object:nil];
//	  }
	}


}

-(void)hide
{
	[_indicator stopAnimating];
	self.hidden = YES;
}

-(void)stopAnimate
{
  [_indicator stopAnimating];
}

-(void)dealloc
{
	[backgroundView release];
	[bubbleView release];
	[nameLabel release];
	[_statusLabel release];
	[_indicator release];
	[super dealloc];
}

@end

#import "StandardCell.h"
#import "TSCellBackgroundView.h"
#import <QuartzCore/QuartzCore.h>
@implementation StandardCell

@synthesize downLabel;
@synthesize upLabel;
@synthesize addButton;
@synthesize headImageView;
@synthesize footLine;
@synthesize backView;
@synthesize indicator;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier
		   {
	
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle =  UITableViewCellSelectionStyleBlue;
		
		TSCellBackgroundView *grView = [[TSCellBackgroundView alloc] init];
		self.backView = grView;
		[grView release];
		backView.theCellStyle = CellStyle_Middle;
		//[self.contentView addSubview:backView];
		self.backgroundView = backView;
		UIView *headLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 1)];
		headLineView.backgroundColor = [UIColor colorWithRed:0.996 green:0.996 blue:0.996 alpha:1.0];
		[self.contentView addSubview:headLineView];
		[headLineView release];
		
		footLine = [[UIView alloc] initWithFrame:CGRectZero];
		footLine.backgroundColor = [UIColor colorWithRed:0.776 green:0.776 blue:0.776 alpha:1.0];
		[self.contentView addSubview:footLine];
		
		UIImageView *_imageView = [[UIImageView alloc] init];
		self.headImageView = _imageView;
		[_imageView release];
		headImageView.frame = CGRectMake(STANDARD_EDGE_WIDTH, STANDARD_EDGE_HEIGHT, STANDARD_HEAD_WIDTH, STANDARD_HEAD_WIDTH);
		headImageView.layer.cornerRadius = 4;
		headImageView.layer.masksToBounds = YES;
		[self.contentView addSubview:_imageView];
		
		
		UILabel* _upLabel = [[UILabel alloc] init];
		self.upLabel = _upLabel;
		[_upLabel release];
		upLabel.font = [UIFont boldSystemFontOfSize:18];
		upLabel.backgroundColor = [UIColor clearColor];
		upLabel.frame = CGRectMake(headImageView.frame.origin.x+headImageView.frame.size.width+STANDARD_EDGE_WIDTH, STANDARD_EDGE_HEIGHT, 150, 25);
		[self.contentView addSubview:upLabel];
		
		UILabel* _downLabel = [[UILabel alloc] init];
		self.downLabel = _downLabel;
		[_downLabel release];
		downLabel.font = [UIFont systemFontOfSize:12];
		downLabel.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
		downLabel.backgroundColor = [UIColor clearColor];
		downLabel.frame = CGRectMake(headImageView.frame.origin.x+headImageView.frame.size.width+STANDARD_EDGE_WIDTH, STANDARD_EDGE_HEIGHT+upLabel.frame.size.height, 200, 25);
		[self.contentView addSubview:downLabel];
		
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(225,14, 75, 30);
		//[button setTitle:@"加为好友" forState:UIControlStateNormal];
		//[button setBackgroundColor:[UIColor grayColor]];
		[button addTarget:self action:@selector(AddFriend)  forControlEvents:UIControlEventTouchUpInside];
		self.addButton = [button retain];
		addButton.titleLabel.font = [UIFont systemFontOfSize:15];
		addButton.titleLabel.textAlignment = UITextAlignmentCenter;
		[self.contentView addSubview:addButton];
		addButton.hidden = YES;
		
		self.indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
		indicator.center = CGPointMake(addButton.frame.size.width/2, addButton.frame.size.height/2);
		indicator.bounds = CGRectMake(0, 0, 20, 20);
		//indicator.frame = CGRectMake(40, 10, 20, 20);
		[addButton addSubview:indicator];
		
	}
	return self;
}


-(void)layoutSubviews
{
	[super layoutSubviews];
	backView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	footLine.frame = CGRectMake(0, backView.frame.size.height-1, backView.frame.size.width, 1);
}





-(void)dealloc{
	self.headImageView = nil;
	self.downLabel = nil;
	self.upLabel = nil;
	self.addButton = nil;
	//self.person = nil;
	[backView release];
	[indicator release];
	[footLine release];
	[super dealloc];
}



@end

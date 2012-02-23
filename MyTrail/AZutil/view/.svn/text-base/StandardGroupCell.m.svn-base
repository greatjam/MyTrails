#import "StandardGroupCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation StandardGroupCell

@synthesize downLabel;
@synthesize upLabel;
@synthesize addButton;
@synthesize headImageView;
@synthesize footLine;
@synthesize backView;
@synthesize indicator;
//@synthesize accessryView;

static const float cell_radius = 11.0;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier
{
	
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle =  UITableViewCellSelectionStyleBlue;
		
		//TSCellBackgroundView *grView = [[TSCellBackgroundView alloc] init];
//		self.backView = grView;
//		[grView release];
//		backView.theCellStyle = CellStyle_Middle;
//		self.backgroundView = backView;
		//UIView *headLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 1)];
//		headLineView.backgroundColor = [UIColor colorWithRed:0.996 green:0.996 blue:0.996 alpha:1.0];
//		[self.contentView addSubview:headLineView];
//		[headLineView release];
//		
//		footLine = [[UIView alloc] initWithFrame:CGRectZero];
//		footLine.backgroundColor = [UIColor colorWithRed:0.776 green:0.776 blue:0.776 alpha:1.0];
		[self.contentView addSubview:footLine];
		self.backgroundColor = [UIColor clearColor];//[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
		
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
		downLabel.frame = CGRectMake(headImageView.frame.origin.x+headImageView.frame.size.width+STANDARD_EDGE_WIDTH, STANDARD_EDGE_HEIGHT+upLabel.frame.size.height, 150, 25);
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
		
		UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		self.indicator = indicatorView;
		[indicatorView release];
		indicator.center = CGPointMake(addButton.frame.size.width/2, addButton.frame.size.height/2);
		indicator.bounds = CGRectMake(0, 0, 20, 20);
		//indicator.frame = CGRectMake(40, 10, 20, 20);
		[addButton addSubview:indicator];
		
		//UIView *headLine = [[UIView alloc] initWithFrame:CGRectMake(6, 0, 288, 1)];
//		headLine.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0];
//		[self.contentView addSubview:headLine];
//		[headLine release];
//		
//		UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(6, 60, 288, 1)];
//		footView.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0];
//		self.footLine = footView;
//		[footView release];
//		[self.contentView addSubview:footLine];
		
		UIImageView *aView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"custom_accessry.png"]];
		aView.frame = CGRectMake(240, 20, 29, 29);
		self.accessoryView = aView;
		
		UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_background2.png"]];
		self.backgroundView = backgroundImageView;
		[backgroundImageView release];
		
		//UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(1, 1, 320, 63)] autorelease];
//		CAGradientLayer *gradient = [CAGradientLayer layer];
//		//CGRect rect = view.bounds;
//		gradient.frame = CGRectMake(1, 1, view.bounds.size.width, view.bounds.size.height-2);
//		gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.957 green:0.957 blue:0.957 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:0.929 green:0.929 blue:0.929 alpha:1.0] CGColor], nil];
//		[view.layer insertSublayer:gradient atIndex:0];
//		view.layer.cornerRadius = cell_radius;
//		view.layer.masksToBounds = YES;
		//view.layer.shadowOffset = CGSizeMake(0, 2);
//		view.layer.shadowRadius = cell_radius;
//		view.layer.shadowColor = [UIColor blackColor].CGColor;
//		view.layer.shadowOpacity = 0.8;
		//[self setBackgroundView:view];
	}
	return self;
}



-(void)layoutSubviews
{
	[super layoutSubviews];
	//backView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	//footLine.frame = CGRectMake(0, backView.frame.size.height-1, backView.frame.size.width, 1);
	//[self setNeedsDisplay];
	
}

- (void)drawRect:(CGRect)rect
{
	//CGContextRef context = UIGraphicsGetCurrentContext();
//
//		CGContextSetRGBStrokeColor(context, 0.776, 0.776, 0.776, 1.0);
//		//CGContextSetRGBFillColor(context, 0.23, 0.24, 0.25, 1.0);
//	    CGContextSetShadowWithColor(context, CGSizeMake(1.0, 1.0), 1.0, [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0].CGColor);
//		CGContextSetLineWidth(context, 1.0);
//
//		CGRect squareRect = CGRectMake(9,0,self.bounds.size.width-18,self.bounds.size.height);
//		CGFloat minx = CGRectGetMinX(squareRect), midx = CGRectGetMidX(squareRect),maxx = CGRectGetMaxX(squareRect);
//		CGFloat miny = CGRectGetMinY(squareRect), midy = CGRectGetMidY(squareRect), maxy = CGRectGetMaxY(squareRect);
//		CGContextMoveToPoint(context, minx, midy);
//		// Add an arc through 2 to 3
//		CGContextAddArcToPoint(context, minx, miny, midx, miny, cell_radius);
//		// Add an arc through 4 to 5
//		CGContextAddArcToPoint(context, maxx, miny, maxx, midy, cell_radius);
//		// Add an arc through 6 to 7
//		CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, cell_radius);
//		// Add an arc through 8 to 9
//		CGContextAddArcToPoint(context, minx, maxy, minx, midy, cell_radius);
//		// Close the path
//	CGContextClosePath(context);
//	
//	CGContextDrawPath(context, kCGPathStroke);
	
	
	//CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
//	CGContextSetLineWidth(context, 1.0);
//	
//	squareRect = CGRectMake(11,2,self.bounds.size.width-22,self.bounds.size.height-4);
//	minx = CGRectGetMinX(squareRect), midx = CGRectGetMidX(squareRect),maxx = CGRectGetMaxX(squareRect);
//	miny = CGRectGetMinY(squareRect), midy = CGRectGetMidY(squareRect), maxy = CGRectGetMaxY(squareRect);
//	CGContextMoveToPoint(context, minx, midy);
//	// Add an arc through 2 to 3
//	CGContextAddArcToPoint(context, minx, miny, midx, miny, cell_radius);
//	// Add an arc through 4 to 5
//	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, cell_radius);
//	// Add an arc through 6 to 7
//	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, cell_radius);
//	// Add an arc through 8 to 9
//	CGContextAddArcToPoint(context, minx, maxy, minx, midy, cell_radius);
//	
//	
//	
//	
//		CGContextClosePath(context);
//
//		CGContextDrawPath(context, kCGPathStroke);
	
}



-(void)dealloc{
	//self.accessryView = nil;
	self.headImageView = nil;
	self.downLabel = nil;
	self.upLabel = nil;
	self.addButton = nil;
	//self.person = nil;
	self.backView = nil;
	[indicator release];
	self.footLine = nil;
	[super dealloc];
}



@end

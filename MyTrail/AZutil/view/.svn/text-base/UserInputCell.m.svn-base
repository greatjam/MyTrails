//
//  UserInputCell.m
//  CC
//
//  Created by  mac on 11-4-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserInputCell.h"

@implementation UserInputCell
@synthesize inputField;
@synthesize delegate;
@synthesize titleStr;
@synthesize row;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
		self.textLabel.font = [UIFont boldSystemFontOfSize:16];
		UITextView* field = [[UITextView alloc] initWithFrame:CGRectZero];
		self.inputField = field;
        inputField.scrollEnabled=NO;
        inputField.backgroundColor = [UIColor clearColor];
		[field release];
		[self addSubview:inputField];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}

-(void)addTextFieldWithTitle:(NSString *)title content:(NSString *)content edgeRate:(float)edgeRate keyboardType:(UIKeyboardType)type
{
	//self.titleStr = title;
	//[title retain];
	self.textLabel.text = title;
	//if(inputField==nil)
	//	{
    inputField.text = content;
	CGSize requiredSize = [content sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-50-[title length]*18, CGFLOAT_MAX)
								lineBreakMode:UILineBreakModeWordWrap];
	inputField.frame = CGRectMake([title length]*16+self.frame.size.width/12, self.frame.size.height*edgeRate-2, requiredSize.width+20, requiredSize.height+10);
	NSLog(@"The self:%@",NSStringFromCGRect(self.frame));
	NSLog(@"The textField:%@",NSStringFromCGRect(inputField.frame));
	//inputField.delegate = self;
	//self.inputField = field;
	//[field release];
	[inputField setKeyboardType:type];
	//}
}

-(void)addInstructionLabel
{
	UITextView* label = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, 90)];
	// detailsLabel = [[UILabel alloc] initWithFrame:self.bounds];
	//label.numberOfLines=5;
	label.editable = NO;
	label.text = @"我们承诺以上所填信息的隐私安全，请用户默认同意以下的条款。";
	label.font = [UIFont systemFontOfSize:14];
	label.text = [label.text stringByReplacingCharactersInRange:NSMakeRange(0,0) withString:@"    "];
	[self addSubview:label];
	[label release];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	
	[self.delegate textFieldSelected:self];
	return YES;
//	}
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField { 
    [textField resignFirstResponder];
	//NSDictionary *userInfo = [NSDictionary dictionaryWithObject:self forKey:@"cell"];

    return YES;
}

- (void)dealloc {
	//[titleStr release];
    [super dealloc];
}


@end

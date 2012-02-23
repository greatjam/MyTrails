//
//  UserInputCell.h
//  CC
//
//  Created by  mac on 11-4-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserInputCellDelegate;

@interface UserInputCell : UITableViewCell<UITextFieldDelegate> {

	//NSString *titleStr;
	id<UserInputCellDelegate> delegate;
	UITextView *inputField;
	NSString *titleStr;
	int row;
}
@property(nonatomic,retain) UITextView *inputField;
@property(nonatomic,retain) id<UserInputCellDelegate> delegate;
@property(nonatomic,retain) NSString *titleStr;
@property(nonatomic,assign) int row;

-(void)addTextFieldWithTitle:(NSString *)title content:(NSString *)content edgeRate:(float)edgeRate keyboardType:(UIKeyboardType)type;
@end

@protocol UserInputCellDelegate
- (void)textFieldSelected:(UserInputCell *)cell;

@end

//
//  StandardGroupCell.h
//  MM
//
//  Created by alex on 11-5-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSCellBackgroundView;
@interface StandardGroupCell : UITableViewCell {
	UILabel *downLabel;
	UILabel *upLabel;
	UIButton *addButton;
	UIImageView *headImageView;
	//UIImageView *accessryView;
	UIView *footLine;
	TSCellBackgroundView *backView;
	UIActivityIndicatorView *indicator;
}

@property (nonatomic,retain) UILabel *downLabel;
@property (nonatomic,retain) UILabel *upLabel;
@property (nonatomic,retain) UIButton *addButton;
@property (nonatomic,retain) UIImageView *headImageView;
@property (nonatomic,retain) UIView *footLine;
//@property (nonatomic,retain) UIImageView *accessryView;
@property (nonatomic,retain) TSCellBackgroundView *backView;
@property (nonatomic,retain) UIActivityIndicatorView *indicator;


@end
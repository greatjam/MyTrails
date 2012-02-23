//
//  CustomFontView.h
//  CC
//
//  Created by alex on 11-5-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomFontView : UIView {

	NSString *textStr;
	int fontSize;
	UIColor *shadowColor;
	//UIColor *fontColor;
	float fontColorRed;
	float fontColorGreen;
	float fontColorBlue;
	float fontColorAlpha;
}

@property(nonatomic,retain) NSString *textStr;
@property(nonatomic,assign) int fontSize;
@property(nonatomic,retain) UIColor *shadowColor;
//@property(nonatomic,retain) UIColor *fontColor;
@property(nonatomic,assign) float fontColorRed;
@property(nonatomic,assign) float fontColorGreen;
@property(nonatomic,assign) float fontColorBlue;
@property(nonatomic,assign) float fontColorAlpha;
-(void)drawInContext:(CGContextRef)context;
//- (id)initWithFrame:(CGRect)frame text:(NSString*) string;
-(void)setStr:(NSString *)str;
@end

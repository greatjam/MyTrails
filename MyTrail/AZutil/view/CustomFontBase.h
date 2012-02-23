//
//  CustomFontBase.h
//  CustomFont
//
//  Created by fred li on 7/17/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
/*Usage:
 *	CustomFontBase *myLabel = [[[CustomFontBase alloc] initWithFrame:CGRectMake(100, 100, 100, 40)] autorelease];
 *
 *  [myLabel initTextWithSize:40 color:[UIColor blueColor] bgColor:[UIColor clearColor]]; 
 *  fontsize default value is 15, backgroud color is clearColor
 *
 *  myLabel.fontName = @"FREESCPT"; MUST SET TO YOUR CUSTOM FONT FILE
 *
 *  myLabel.fontExtension = @"TTF";
 *  default value is TTF
 *
 *  [myLabel updateText:@"3.3"];
 *
 */



#import <UIKit/UIKit.h>


@interface CustomFontBase : UIView {
	NSMutableString *curText;
	UIColor *fontColor;
	UIColor *bgColor;
	int fontSize;
	NSString *fontName;
	NSString *fontExtension;
	float autoSizeWidth;
	float spaceWidth;
	int glyphOffset;
	BOOL isShadow;
	UIColor *shadowColor;
	CGSize shadowOffset;
	CGFloat blur;
}

- (void)updateText:(NSString*)newText;
- (void)initTextWithSize:(float)size color:(UIColor*)color bgColor:(UIColor*)bgColor;

@property (nonatomic, retain) NSMutableString *curText;
@property (nonatomic, assign) float spaceWidth; //The space width between words.
@property (nonatomic, assign) float autoSizeWidth;
@property (nonatomic, retain) NSString * fontName; // Font file name 
@property (nonatomic, retain) NSString * fontExtension; //Font file extension name
@property (nonatomic, retain) UIColor * fontColor;
@property (nonatomic, retain) UIColor * bgColor; //background color
@property (nonatomic, assign) BOOL isShadow; //default is NO
@property (nonatomic, retain) UIColor * shadowColor;
@property (nonatomic, assign) CGSize shadowOffset; 
@property (nonatomic, assign) CGFloat blur;
@property (nonatomic, assign) int fontSize;
@property (nonatomic, assign) int glyphOffset;

@end

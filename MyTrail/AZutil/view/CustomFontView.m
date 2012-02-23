//
//  CustomFontView.m
//  CC
//
//  Created by alex on 11-5-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomFontView.h"
//#define kTextStringLength strlen(kTextString)

@implementation CustomFontView
@synthesize textStr;
@synthesize fontSize;
@synthesize shadowColor;
//@synthesize fontColor;
@synthesize fontColorRed;
@synthesize fontColorGreen;
@synthesize fontColorBlue;
@synthesize fontColorAlpha;

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		//self.textStr=string;
		fontSize = 16;
		self.shadowColor = [UIColor whiteColor];
		
		fontColorRed = 0.5;
		fontColorGreen = 0.5;
		fontColorBlue = 0.5;
		fontColorAlpha = 1.0;
		
    }
    return self;
}

-(void)setStr:(NSString *)str
{
	self.textStr = str;
	[self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	[self drawInContext:UIGraphicsGetCurrentContext()];
}


- (void)dealloc {
	[textStr release];
	[shadowColor release];
    [super dealloc];
}

-(void)drawInContext:(CGContextRef)context
{
	CGContextSetRGBFillColor(context, fontColorRed, fontColorGreen, fontColorBlue, fontColorAlpha);
	CGContextSetRGBStrokeColor(context, fontColorRed, fontColorGreen, fontColorBlue, fontColorAlpha);
	CGContextSetShadowWithColor(context, CGSizeMake(1, 1), 1, shadowColor.CGColor);
	// Some initial setup for our text drawing needs.
	// First, we will be doing our drawing in Helvetica-36pt with the MacRoman encoding.
	// This is an 8-bit encoding that can reference standard ASCII characters
	// and many common characters used in the Americas and Western Europe.
	CGContextSelectFont(context, "Helvetica",fontSize, kCGEncodingMacRoman);
	// Next we set the text matrix to flip our text upside down. We do this because the context itself
	// is flipped upside down relative to the expected orientation for drawing text (much like the case for drawing Images & PDF).
	CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
	// And now we actually draw some text. This screen will demonstrate the typical drawing modes used.
	//CGContextSetTextDrawingMode(context, kCGTextFill);
//	CGContextShowTextAtPoint(context, 10.0, 30.0, textStr, strlen(textStr));
//	CGContextSetTextDrawingMode(context, kCGTextStroke);
//	CGContextShowTextAtPoint(context, 10.0, 70.0, textStr, strlen(textStr));
	
	char *commentsMsg;
    //UIFont *commentsFont = [UIFont systemFontOfSize:7.0];
    commentsMsg = (char *)[textStr UTF8String];
	
	CGContextSetTextDrawingMode(context, kCGTextFill);
	CGContextShowTextAtPoint(context, 0, 20, commentsMsg, strlen(commentsMsg));
	
	// Now lets try the more complex Glyph functions. These functions allow you to draw any glyph available in a font,
	// but provide no assistance with converting characters to glyphs or layout, and as such require considerably more knowledge
	// of text to use correctly. Specifically, you need to understand Unicode encoding and how to interpret the information
	// present in the font itself, such as the cmap table.
	// To get you started, we are going to do the minimum necessary to draw a glyphs into the current context.
	CGFontRef helvetica = CGFontCreateWithFontName((CFStringRef)@"Helvetica-Bold");
	//CGContextSetFont(context, helvetica);
	//CGContextSetFontSize(context, 10.0);
	//CGContextSetTextDrawingMode(context, kCGTextFill);
	// Next we'll display lots of glyphs from the font. 
	//CGGlyph start = 0;
//	for(int y = 0; y < 20; ++y)
//	{
//		CGGlyph glyphs[32];
//		for(int i = 0; i < 32; ++i)
//		{
//			glyphs[i] = start + i;
//		}
//		start += 32;
//		CGContextShowGlyphsAtPoint(context, 10.0, 150.0 + 12 * y, glyphs, 32);
//	}
	CGFontRelease(helvetica);
}


@end

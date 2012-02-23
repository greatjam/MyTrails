//
//  CustomFontBase.m
//  CustomFont
//
//  Created by fred li on 7/17/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//



#import "CustomFontBase.h"


@implementation CustomFontBase

@synthesize curText;
@synthesize spaceWidth;
@synthesize fontName;
@synthesize fontExtension;
@synthesize fontSize;
@synthesize fontColor;
@synthesize bgColor;
@synthesize isShadow;
@synthesize shadowColor;
@synthesize shadowOffset; 
@synthesize blur;
@synthesize autoSizeWidth;
@synthesize glyphOffset;

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		// set defaults
		[self setBackgroundColor:[UIColor clearColor]];
		self.bgColor = [UIColor clearColor];
		//[self setCurText: [[NSMutableString alloc] initWithString:@""] ];
		curText = [[NSMutableString alloc] initWithString:@""];
		self.fontColor = [UIColor grayColor];
		fontSize = 15;
		isShadow = NO;
		self.fontExtension = @"TTF";
		glyphOffset = -29;//-32;//-29;
		blur = 3;
		[self setContentMode:UIViewContentModeLeft];  // make sure it doesn't scale/deform when setFrame is called 
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	// get context and flip for normal coordinates
	CGContextRef context =  UIGraphicsGetCurrentContext();
	CGContextTranslateCTM ( context, 0, self.bounds.size.height );
    CGContextScaleCTM ( context, 1.0, -1.0 );
	
	// Get the path to our custom font and create a data provider.
	NSString *fontPath = [[NSBundle mainBundle] pathForResource:fontName ofType:fontExtension];
	CGDataProviderRef fontDataProvider = CGDataProviderCreateWithFilename([fontPath UTF8String]);
	// Create the font with the data provider, then release the data provider.
	CGFontRef customFont = CGFontCreateWithDataProvider(fontDataProvider);
	CGDataProviderRelease(fontDataProvider); 
	// Set the customFont to be the font used to draw.
	CGContextSetFont(context, customFont);
	
	// prepare characters for printing
	NSString *theText;
	if(curText != nil)
		theText = [NSString stringWithString: curText];
	else
		theText = @"";
	int length = [theText length];
	unichar chars[length];
	CGGlyph glyphs[length];
	[theText getCharacters:chars range:NSMakeRange(0, length)];
	
	// draw bg
	if( bgColor != [UIColor clearColor] )
	{
		CGRect bgRect = CGRectMake (0, 0, self.bounds.size.width, self.bounds.size.height);
		CGContextSetFillColorWithColor( context, bgColor.CGColor );
		CGContextFillRect( context, bgRect );
	}
	
	// Set how the context draws the font, what color, how big.
	CGContextSetTextDrawingMode(context, kCGTextFill);
	CGContextSetFillColorWithColor(context, fontColor.CGColor );
	CGContextSetFontSize(context, fontSize);
	CGContextSetCharacterSpacing(context, spaceWidth);
	
	// set a glow?
	if( isShadow ) {
		//CGContextSetShadow(context, CGSizeMake(0,0), 3 );
		CGContextSetShadowWithColor( context, shadowOffset, blur, shadowColor.CGColor );
	}
	
	// Loop through the entire length of the text.
	for (int i = length - 1; i >= 0; i--) {
		// Store each letter in a Glyph and subtract the MagicNumber to get appropriate value.
		glyphs[i] = [theText characterAtIndex:i] + glyphOffset;
	}
	
	// draw the glyphs
	CGContextShowGlyphsAtPoint( context, 0, 0 + fontSize * .25, glyphs, length ); // hack the y-point to make sure it's not cut off below font baseline - this creates a perfect vertical fit
	//CGContextShowAtPoint(context,50,50,[str cStringUsingEncoding:NSUTF8StringEncoding],2);
	// get width of text for autosizing the frame later (perhaps)
	CGPoint textEnd = CGContextGetTextPosition( context ); 
	autoSizeWidth = textEnd.x;
	
	// clean up the font
	CGFontRelease( customFont );
}


// call this after creating the LandscapeText object to set the styling
- (void)initTextWithSize:(float)size color:(UIColor*)color bgColor:(UIColor*)txtBgColor {
	// store font properties
	self.fontColor = color;
	fontSize = size;
	self.bgColor = txtBgColor;
	
	// autoscale height to font size
	//[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, fontSize)];
}

// set new text to display
- (void)updateText:(NSString*)newText {
	[self setCurText: [NSString stringWithString:newText] ];
	[self setNeedsDisplay];
}




- (void)dealloc {
	[curText release];
	[fontName release];
	[fontExtension release];
	[fontColor release];
	[bgColor release];
	[shadowColor release];
	[super dealloc];
}


@end
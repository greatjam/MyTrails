//
//  UIImageScale.m
//  caidian
//
//  Created by  heyang on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIImageScale.h"


@implementation UIImage (scale)

-(UIImage*)scaleToSize:(CGSize)size{
	UIGraphicsBeginImageContext(size);
	[self drawInRect:CGRectMake(0,0,size.width,size.height)];
	UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return scaledImage;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
								 float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
		CGContextAddRect(context, rect);
		return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


- (id) getRoundedRectImage//:(CGSize)size
{
    // the size of CGContextRef
    //int w = size.width;
    //int h = size.height;
    
	int w = self.size.width;
	int h = self.size.height;
    //UIImage *img = self;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, 10, 10);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}

- (UIImage*) addNewImageLayer:(UIImage*)newImage
{
	CGSize size = CGSizeMake(50, 50);
	UIGraphicsBeginImageContext(size);
	
	CGPoint thumbPoint = CGPointMake(0, 25 - self.size.height / 2);
	[self drawAtPoint:thumbPoint];
	
	//UIImage* starred = [UIImage imageNamed:@"starred.png"];
	
	CGPoint starredPoint = CGPointMake(0, 0);
	[newImage drawAtPoint:starredPoint];
	
	UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return result;
}

- (UIImage*) maskImage:(UIImage *)maskImage {
	
    CGImageRef maskRef = maskImage.CGImage; 
	
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
										CGImageGetHeight(maskRef),
										CGImageGetBitsPerComponent(maskRef),
										CGImageGetBitsPerPixel(maskRef),
										CGImageGetBytesPerRow(maskRef),
										CGImageGetDataProvider(maskRef), NULL, false);
	
    CGImageRef masked = CGImageCreateWithMask([self CGImage], mask);
    return [UIImage imageWithCGImage:masked];
	
}

@end

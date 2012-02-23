//
//  Global.m
//  MM
//
//  Created by alex on 11-7-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Global.h"


static Global *sharedInstance = nil;
@implementation Global
@synthesize globalBackgroundImage;

-(id)init
{
	self = [super init];
	if (self) {
      [self resetBackGroundImage];
	}
	return self;
}

+ (id)sharedInstance {
	@synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[Global alloc] init];
            return sharedInstance;
        }
    }
    return sharedInstance;
}

-(void)resetBackGroundImage
{
	//UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self getBackgroundImageByRecentTheme] ofType:@"png"]];
    UIImage *image = [UIImage imageNamed:@"background.png"];
	self.globalBackgroundImage = image;
	[image release];
}

-(NSString *)getBackgroundImageByRecentTheme
{
	NSString *imageName;
//	int recentStyle = [[NSUserDefaults standardUserDefaults] integerForKey:NAV_STYLE];
//	if (recentStyle==black_nav_style) {
//		imageName = [NSString stringWithString:@"background_black_theme"];
//	}
//	else if(recentStyle==white_nav_style){
//		imageName = [NSString stringWithString:@"background_white_theme"];
//	}
//    
//	else {
		imageName = [NSString stringWithString:@"background"];
	//}
	return imageName;
}

-(void)dealloc
{
	[super dealloc];
}

@end

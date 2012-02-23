//
//  Utility.h
//  CC
//
//  Created by  mac on 11-4-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject {


}

+ (id)sharedInstance;
+(CGSize)sizeofString:(NSString*)str font:(UIFont*)strFont;
-(void)playSound:(NSString *)soundName type:(NSString *)soundType;
-(unsigned int)convertStringToUnsigned:(NSString *)myUnsignedIntString;
-(int)convertToInt:(NSString*)strtemp;
@end

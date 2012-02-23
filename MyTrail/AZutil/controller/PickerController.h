//
//  PickerController.h
//  Binfen
//
//  Created by alex on 11-11-29.
//  Copyright 2011年 Bfen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerController : UIViewController<UIPickerViewDelegate>
{
    UIPickerView *picker;
    UIToolbar *controlBar;
}
@property(nonatomic,retain) UIPickerView *picker;
@property(nonatomic,retain) UIToolbar *controlBar;

- (UIPickerView *)getPicker;
-(void)gotoPicker;
-(void)quitPicker;

@end

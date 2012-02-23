//
//  PickerController.m
//  Binfen
//
//  Created by alex on 11-11-29.
//  Copyright 2011年 Bfen. All rights reserved.
//

#import "PickerController.h"

@implementation PickerController
@synthesize picker;
@synthesize controlBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)loadView
{
    [super loadView];
//    UIBarButtonItem *temporaryBarButtonItem1= [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithString:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(dismissView)];
//    [self.navigationItem setLeftBarButtonItem:temporaryBarButtonItem1];
//    [temporaryBarButtonItem1 release];
    
    UIBarButtonItem *temporaryBarButtonItem2= [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithString:@"发送"] style:UIBarButtonItemStylePlain target:self action:@selector(post)];
    [self.navigationItem setRightBarButtonItem:temporaryBarButtonItem2];
    [temporaryBarButtonItem2 release];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //[self.navigationController.view addSubview: bgView]; 
    [self.view.window addSubview:[self getPicker]];
    [self.view.window addSubview:controlBar];
}

- (UIPickerView *)getPicker
{
    if (picker == nil) {
        UIPickerView *thePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 524, 320, 180)];
        self.picker = thePicker;
        [thePicker release];
        picker.delegate = self;
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 480, 320, 44)];
        self.controlBar = toolBar;
        [toolBar release];
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithString:@"取消"] style:UIBarButtonItemStyleBordered target:self action:@selector(quitPicker)];
        UIBarButtonItem * spaceButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:       
                                         UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *finishItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithString:@"完成"] style:UIBarButtonItemStyleBordered target:self action:@selector(quitPicker)];
        controlBar.items = [NSArray arrayWithObjects:cancelItem,spaceButton,finishItem, nil];
    }
    return picker;
}

//CGRectMake(0, 300 , 320, 180)
//CGRectMake(0, 256, 320, 44)
-(void)gotoPicker
{
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:0.5];
    picker.frame = CGRectMake(0, 300 , 320, 180);
    controlBar.frame = CGRectMake(0, 256, 320, 44);
    //[UIView commitAnimations];
}

-(void)quitPicker
{
   // [UIView beginAnimations:nil context:nil];
   // [UIView setAnimationDuration:0.5];
    picker.frame = CGRectMake(0, 524, 320, 180);
    controlBar.frame = CGRectMake(0, 480, 320, 44);
   // [UIView commitAnimations];
}


#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.controlBar = nil; 
    self.picker = nil;
}

-(void)dealloc
{
    self.controlBar=nil;
    self.picker=nil;
    [super dealloc];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

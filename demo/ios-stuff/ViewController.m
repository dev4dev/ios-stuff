//
//  ViewController.m
//  ios-stuff
//
//  Created by Alex Antonyuk on 6/20/13.
//  Copyright (c) 2013 Alex Antonyuk. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FrameCSSifier.h"

@interface ViewController ()

@property (nonatomic, strong) UIView* v;
@property (nonatomic, strong) UIView* v2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.v = [[UIView alloc] initWithFrame:CGRectMake(30.0, 30.0, 30.0, 30.0)];
	self.v.backgroundColor = [UIColor yellowColor];
	[self.view addSubview:self.v];

	self.v2 = [[UIView alloc] initWithFrame:CGRectMake(130.0, 130.0, 30.0, 30.0)];
	self.v2.backgroundColor = [UIColor yellowColor];
	[self.view addSubview:self.v2];

	[self performSelector:@selector(moveToBottom) withObject:nil afterDelay:2.0];
}

- (void)
moveToBottom
{
	typeof (self) __weak safeSelf = self;
	self.v.right = 100;
	[UIView animateWithDuration:2.0 animations:^{
		[safeSelf.v startFrameTransaction];
		safeSelf.v.bottom = 10.0;
		safeSelf.v.right = 10.0;
		[safeSelf.v commitFrameTransaction];

		[safeSelf.v2 startFrameTransaction];
		safeSelf.v2.bottom = 10.0;
		safeSelf.v2.left = 10.0;
		[safeSelf.v2 commitFrameTransaction];

	} completion:^(BOOL finished) {
		safeSelf.v.top = 100;
	}];
}

@end

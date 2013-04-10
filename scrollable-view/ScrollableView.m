//
//  ScrollableView.m
//  components
//
//  Created by Alex Antonyuk on 12/3/12.
//  Copyright (c) 2012 Alex Antonyuk. All rights reserved.
//

#import "ScrollableView.h"

@interface ScrollableView() {
	CGFloat _keyBoardOffset;
	CGFloat _bottomOffset;
}

- (void)keyboardWillShow:(NSNotification*)notification;
- (void)keyboardWillHide:(NSNotification*)notification;

@end

@implementation ScrollableView

- (id)
initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
	}

	return self;
}

- (void)
dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)
addSubview:(UIView *)view recalc:(BOOL)recalc
{
	if (recalc) {
		CGRect frame = view.frame;
		CGFloat maxX = CGRectGetMaxX(frame);
		CGFloat maxY = CGRectGetMaxY(frame);
		if (self.contentSize.width > maxX) {
			maxX = self.contentSize.width;
		}
		if (self.contentSize.height > maxY) {
			maxY = self.contentSize.height;
		}
		self.contentSize = CGSizeMake(maxX + self.contentSizePadding.width, maxY + self.contentSizePadding.height);
	}
	[self addSubview:view];
}

- (void)
recalcContentSizeWithViews:(NSArray*)views
{
	CGFloat maxX = 0;
	CGFloat maxY = 0;
	for (UIView* view in views) {
		CGRect frame = view.frame;
		maxX = MAX(maxX, CGRectGetMaxX(frame));
		maxY = MAX(maxY, CGRectGetMaxY(frame));
	}

	self.contentSize = CGSizeMake(maxX + self.contentSizePadding.width, maxY + self.contentSizePadding.height);
}

- (void)
scrollToSubview:(UIView *)subView
{
	CGRect frame = [self convertRect:subView.frame toView:self];
	[self scrollRectToVisible:frame animated:YES];
}

#pragma mark - Notifications

- (void)
keyboardWillHide:(NSNotification *)notification
{
	NSTimeInterval duration = 0.0;
	[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];
	
	CGRect frame = self.frame;
	frame.size.height += _keyBoardOffset - _bottomOffset;

	[UIView animateWithDuration:duration animations:^{
		self.frame = frame;
	}];
}

- (void)
keyboardWillShow:(NSNotification *)notification
{
	CGRect kbFrame = CGRectZero;
	[notification.userInfo[UIKeyboardFrameEndUserInfoKey] getValue:&kbFrame];

	NSTimeInterval duration = 0.0;
	[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];

	CGRect gFrame = [[UIApplication sharedApplication].keyWindow convertRect:self.frame fromView:self];
	_bottomOffset = CGRectGetHeight([UIScreen mainScreen].bounds) - CGRectGetMaxY(gFrame);
	_keyBoardOffset = CGRectGetHeight(kbFrame);

	CGRect frame = self.frame;
	frame.size.height -= _keyBoardOffset - _bottomOffset;
	[UIView animateWithDuration:duration animations:^{
		self.frame = frame;
	}];
}

@end

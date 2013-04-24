//
//  WaitingImageView.m
//
//  Created by Alex Antonyuk on 4/10/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import "WaitingImageView.h"

@interface WaitingImageView()

@property (nonatomic, strong) UIActivityIndicatorView* activityIndicator;

- (void)setupView;

@end

@implementation WaitingImageView

- (id)
initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)
setupView
{
	self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	self.activityIndicator.hidesWhenStopped = YES;
	self.activityIndicator.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
	self.activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAnimationTransitionFlipFromLeft;
	[self addSubview:self.activityIndicator];
}

- (void)
startLoaderAnimating
{
	[self.activityIndicator startAnimating];
}

- (void)
stopLoaderAnimating
{
	[self.activityIndicator stopAnimating];
}

@end

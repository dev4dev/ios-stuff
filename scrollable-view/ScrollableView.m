//
//  ScrollableView.m
//  components
//
//  Created by Alex Antonyuk on 12/3/12.
//  Copyright (c) 2012 Alex Antonyuk. All rights reserved.
//

#import "ScrollableView.h"

@implementation ScrollableView

- (void)
setLowestView:(UIView *)lowestView
{
	CGRect frame = lowestView.frame;
	self.contentSize = CGSizeMake(CGRectGetMaxX(frame) + self.contentSizePadding.width, CGRectGetMaxY(frame) + self.contentSizePadding.height);
}

@end

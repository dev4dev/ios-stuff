//
//  ScrollableView.h
//  components
//
//  Created by Alex Antonyuk on 12/3/12.
//  Copyright (c) 2012 Alex Antonyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollableView : UIScrollView

@property (assign, nonatomic) CGSize contentSizePadding;

- (void)scrollToSubview:(UIView*)subView;
- (void)addSubview:(UIView *)view recalc:(BOOL)recalc;

- (void)recalcContentSizeWithViews:(NSArray*)views;

@end

//
//  ScrollableView.h
//  components
//
//  Created by Alex Antonyuk on 12/3/12.
//  Copyright (c) 2012 Alex Antonyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollableView : UIScrollView

@property (weak, nonatomic) UIView* lowestView;
@property (assign, nonatomic) CGSize contentSizePadding;

@end

//
//  WaitingImageView.h
//
//  Created by Alex Antonyuk on 4/10/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitingImageView : UIImageView

@property (nonatomic, readonly) UIActivityIndicatorView* activityIndicator;

- (void)startLoaderAnimating;
- (void)stopLoaderAnimating;

@end

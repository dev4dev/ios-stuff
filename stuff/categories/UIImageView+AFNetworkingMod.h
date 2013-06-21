//
//  UIImageView+AFNetworkingMod.h
//
//  Created by Alex Antonyuk on 4/11/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>

@interface UIImageView (AFNetworkingMod)

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
			   complete:(VoidBlock)complete;

@end

//
//  UIImageView+AFNetworkingMod.m
//
//  Created by Alex Antonyuk on 4/11/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import "UIImageView+AFNetworkingMod.h"

@implementation UIImageView (AFNetworkingMod)

- (void)
setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage complete:(VoidBlock)complete
{
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];

	SAFE_SELF;
    [self setImageWithURLRequest:request
				placeholderImage:placeholderImage
						 success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
	{
		safeSelf.image = image;
		if (complete) {
			complete();
		}
	} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
	{
		if (complete) {
			complete();
		}
	}];
}

@end

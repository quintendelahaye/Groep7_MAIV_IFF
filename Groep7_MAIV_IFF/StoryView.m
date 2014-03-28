//
//  StoryView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "StoryView.h"

@implementation StoryView

- (id)initWithFrame:(CGRect)frame andStory:(Story*)story
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.story = story;
        
        UIImage *image = [UIImage imageNamed:self.story.image_path];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [self addSubview:imageView];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  RoleView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RoleView.h"

@implementation RoleView

- (id)initWithFrame:(CGRect)frame andRole:(Role *)role
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        NSLog(@"[RoleView] namepath = %@ -- imagepath = %@",namePath,imagePath);
        
        self.role = role;
        
        self.image = [UIImage imageNamed:self.role.image_path];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
        imageView.frame = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
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

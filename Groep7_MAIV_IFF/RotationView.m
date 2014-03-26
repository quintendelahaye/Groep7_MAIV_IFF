//
//  RotationView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RotationView.h"

@implementation RotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.currentAngle = 0;
        
        self.btnRotateLeft= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRotateLeft.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.4];
        [self.btnRotateLeft setFrame:CGRectMake(0, 150, 200, 30)];
        [self.btnRotateLeft setTitle:[NSString stringWithFormat:@"To the left"] forState:UIControlStateNormal];
        [self addSubview:self.btnRotateLeft];
        
        self.btnRotateRight= [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRotateRight.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.4];
        [self.btnRotateRight setFrame:CGRectMake(self.frame.size.width - self.btnRotateLeft.frame.size.width, 150, 200, 30)];
        [self.btnRotateRight setTitle:[NSString stringWithFormat:@"To the right"] forState:UIControlStateNormal];
        [self addSubview:self.btnRotateRight];
        
        
        NSString *imageName = [NSString stringWithFormat:@"1"];
        UIImage *image = [UIImage imageNamed:imageName];
        self.imageView = [[UIImageView alloc] initWithImage:image];
        self.imageView.frame = CGRectMake(self.frame.size.width/2 - image.size.width/2, self.frame.size.height/2 - image.size.height/2, image.size.width, image.size.height);
        [self addSubview:self.imageView];
        
    }
    return self;
}

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees
{
    self.currentAngle = degrees;
    
    NSLog(@"CurrentAngle = %i", self.currentAngle);
    
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
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

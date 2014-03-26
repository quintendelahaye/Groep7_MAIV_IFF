//
//  RotationView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>


#define M_PI   3.14159265358979323846264338327950288
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface RotationView : UIView

@property (nonatomic)int currentAngle;
@property (strong,nonatomic)UIButton *btnRotateLeft;
@property (strong,nonatomic)UIButton *btnRotateRight;
@property (strong,nonatomic)UIImageView *imageView;

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees;
@end

//
//  ChooseRoleView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "ChooseRoleView.h"
#import "RoleView.h"

@implementation ChooseRoleView

- (id)initWithFrame:(CGRect)frame andRoles:(NSMutableArray *)roles
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.currentAngle = 0;
        self.currentRole = [NSString stringWithFormat:@"soldaat"];
        self.titleImage = [UIImage imageNamed:[NSString stringWithFormat:@"rol_name%@",self.currentRole]];
        self.titleImageView = [[UIImageView alloc] initWithImage:self.titleImage];
        self.titleImageView.frame = CGRectMake(self.frame.size.width/2 - self.titleImage.size.width/2, self.frame.size.height/2 - self.titleImage.size.height-50, self.titleImage.size.width, self.titleImage.size.height);
        [self addSubview:self.titleImageView];
        
        self.rolesView = [[RolesView alloc] initWithFrame:frame andRoles:roles];
        [self setAnchorPoint:CGPointMake(0.5, 0.93) forRolesView:self.rolesView];
        [self addSubview:self.rolesView];
        
        self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnStartButtonImage = [UIImage imageNamed:@"rol_btnStart"];
        [self.startButton setBackgroundImage:btnStartButtonImage forState:UIControlStateNormal];
        self.startButton.frame = CGRectMake(self.frame.size.width - btnStartButtonImage.size.width - 30, self.frame.size.height - btnStartButtonImage.size.height - 20, btnStartButtonImage.size.width, btnStartButtonImage.size.height);
        [self addSubview:self.startButton];
        
        self.nextRoleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *nextRoleButtonImage = [UIImage imageNamed:@"rol_btnRight"];
        [self.nextRoleButton setBackgroundImage:nextRoleButtonImage forState:UIControlStateNormal];
        self.nextRoleButton.frame = CGRectMake(self.frame.size.width - nextRoleButtonImage.size.width - 30, 370, nextRoleButtonImage.size.width, nextRoleButtonImage.size.height);
        [self addSubview:self.nextRoleButton];
        
        self.previousRoleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *previousRoleButtonImage = [UIImage imageNamed:@"rol_btnLeft"];
        [self.previousRoleButton setBackgroundImage:previousRoleButtonImage forState:UIControlStateNormal];
        self.previousRoleButton.frame = CGRectMake(30, 370, previousRoleButtonImage.size.width, previousRoleButtonImage.size.height);
        [self addSubview:self.previousRoleButton];
        
        [self.nextRoleButton addTarget:self action:@selector(nextRoleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.previousRoleButton addTarget:self action:@selector(previousRoleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.startButton addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)nextRoleButtonTapped:(id)sender{
    [self addSubview:self.previousRoleButton];
    [self addSubview:self.nextRoleButton];
    [self rotateRolesView:self.rolesView duration:0.5 curve:UIViewAnimationCurveEaseInOut degrees:self.currentAngle-50];
    
    if(self.currentAngle == -50){
        [self.nextRoleButton removeFromSuperview];
    }
    
    if([self.currentRole isEqualToString:@"soldaat"]){
        self.titleImageView.image = Nil;
        self.currentRole = [NSString stringWithFormat:@"hospik"];
        self.titleImage = [UIImage imageNamed:[NSString stringWithFormat:@"rol_name%@",self.currentRole]];
        self.titleImageView = [[UIImageView alloc] initWithImage:self.titleImage];
        self.titleImageView.frame = CGRectMake(self.frame.size.width/2 - self.titleImage.size.width/2, self.frame.size.height/2 - self.titleImage.size.height-50, self.titleImage.size.width, self.titleImage.size.height);
        [self addSubview:self.titleImageView];
    }else if ([self.currentRole isEqualToString:@"piloot"]){
        self.titleImageView.image = Nil;
        self.currentRole = [NSString stringWithFormat:@"soldaat"];
        self.titleImage = [UIImage imageNamed:[NSString stringWithFormat:@"rol_name%@",self.currentRole]];
        self.titleImageView = [[UIImageView alloc] initWithImage:self.titleImage];
        self.titleImageView.frame = CGRectMake(self.frame.size.width/2 - self.titleImage.size.width/2, self.frame.size.height/2 - self.titleImage.size.height-50, self.titleImage.size.width, self.titleImage.size.height);
        [self addSubview:self.titleImageView];
    }
    
}

-(void)previousRoleButtonTapped:(id)sender{
    [self addSubview:self.previousRoleButton];
    [self addSubview:self.nextRoleButton];
    [self rotateRolesView:self.rolesView duration:0.5 curve:UIViewAnimationCurveEaseInOut degrees:self.currentAngle+50];
    
    if(self.currentAngle == 50){
        [self.previousRoleButton removeFromSuperview];
    }
    
    if([self.currentRole isEqualToString:@"soldaat"]){
        self.titleImageView.image = Nil;
        self.currentRole = [NSString stringWithFormat:@"piloot"];
        self.titleImage = [UIImage imageNamed:[NSString stringWithFormat:@"rol_name%@",self.currentRole]];
        self.titleImageView = [[UIImageView alloc] initWithImage:self.titleImage];
        self.titleImageView.frame = CGRectMake(self.frame.size.width/2 - self.titleImage.size.width/2, self.frame.size.height/2 - self.titleImage.size.height-50, self.titleImage.size.width, self.titleImage.size.height);
        [self addSubview:self.titleImageView];
    }else if ([self.currentRole isEqualToString:@"hospik"]){
        self.titleImageView.image = Nil;
        self.currentRole = [NSString stringWithFormat:@"soldaat"];
        self.titleImage = [UIImage imageNamed:[NSString stringWithFormat:@"rol_name%@",self.currentRole]];
        self.titleImageView = [[UIImageView alloc] initWithImage:self.titleImage];
        self.titleImageView.frame = CGRectMake(self.frame.size.width/2 - self.titleImage.size.width/2, self.frame.size.height/2 - self.titleImage.size.height-50, self.titleImage.size.width, self.titleImage.size.height);
        [self addSubview:self.titleImageView];
    }
    
}

-(void)startButtonTapped:(id)sender{
    [self.delegate showChosenRole:self.currentRole];    
}

- (void)rotateRolesView:(RolesView *)rolesView duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees
{
    self.currentAngle = degrees;
    
//    NSLog(@"CurrentAngle = %i", self.currentAngle);
    
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    rolesView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

-(void)setAnchorPoint:(CGPoint)anchorPoint forRolesView:(RolesView *)imageView
{
    CGPoint newPoint = CGPointMake(imageView.bounds.size.width * anchorPoint.x, imageView.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(imageView.bounds.size.width * imageView.layer.anchorPoint.x, imageView.bounds.size.height * imageView.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, imageView.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, imageView.transform);
    
    CGPoint position = imageView.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    imageView.layer.position = position;
    imageView.layer.anchorPoint = anchorPoint;
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

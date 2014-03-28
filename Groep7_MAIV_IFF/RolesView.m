//
//  RolesView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RolesView.h"
#import "Role.h"
#import "RoleView.h"

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@implementation RolesView

- (id)initWithFrame:(CGRect)frame andRoles:(NSMutableArray*)roles
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //        NSLog(@"%i",roles.count);
        
        UIImage *imageGrond = [UIImage imageNamed:@"rol_picBolGrond"];
        UIImageView *imageGrondView = [[UIImageView alloc] initWithImage:imageGrond];
        imageGrondView.frame = CGRectMake(self.frame.size.width/2 - imageGrond.size.width/2 - 50, self.frame.size.height - imageGrond.size.height/1.3, imageGrond.size.width, imageGrond.size.height);
        [self addSubview:imageGrondView];
        
        CGFloat xPos = self.frame.size.width/2 - 320;
        CGFloat yPos = self.frame.size.height/2 - 120;
        
        int angle = -50;
        int i = 1;
        
        self.roleViews = [NSMutableArray array];

//                for (Role *role in roles){
        
        for (Role *role in roles){
            
            if (i%2 == 0) {
                RoleView *roleView = [[RoleView alloc] initWithFrame:CGRectMake(xPos, yPos, role.width, role.height) andRole:role];
                [self setAnchorPoint:CGPointMake(0.5,1) forRoleView:roleView];
                [self addSubview:roleView];
                [self.roleViews addObject:roleView];
                xPos += 150;
            }else{
                RoleView *roleView = [[RoleView alloc] initWithFrame:CGRectMake(xPos, yPos + 100, role.width, role.height) andRole:role];
                roleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
                roleView.transform = CGAffineTransformRotate(roleView.transform,DEGREES_TO_RADIANS(angle));
                [self setAnchorPoint:CGPointMake(0.5,1) forRoleView:roleView];
                [self addSubview:roleView];
                [self.roleViews addObject:roleView];
                angle += 100;
                xPos += 200;
            }
//            NSLog(@"Role = %@ and position is %f",role.image_path,xPos);

            i++;
        }
        
    }
    return self;
}

-(void)setAnchorPoint:(CGPoint)anchorPoint forRoleView:(RoleView *)roleView
{
    CGPoint newPoint = CGPointMake(roleView.bounds.size.width * anchorPoint.x, roleView.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(roleView.bounds.size.width * roleView.layer.anchorPoint.x, roleView.bounds.size.height * roleView.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, roleView.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, roleView.transform);
    
    CGPoint position = roleView.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    roleView.layer.position = position;
    roleView.layer.anchorPoint = anchorPoint;
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

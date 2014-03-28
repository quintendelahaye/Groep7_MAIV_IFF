//
//  ChooseRoleView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseRoleViewDelegate.h"
#import "RolesView.h"
#import "Role.h"

#define M_PI   3.14159265358979323846264338327950288
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)


@interface ChooseRoleView : UIView

- (id)initWithFrame:(CGRect)frame andRoles:(NSMutableArray *)roles;

@property (nonatomic)int currentAngle;
@property (strong,nonatomic)NSString *currentRole;

@property (strong,nonatomic)RolesView *rolesView;

@property (strong,nonatomic)UIButton *nextRoleButton;
@property (strong,nonatomic)UIButton *previousRoleButton;
@property (strong,nonatomic)UIButton *startButton;
@property (strong,nonatomic)UIImage *titleImage;
@property (strong,nonatomic)UIImageView *titleImageView;

@property (nonatomic,weak)id<ChooseRoleViewDelegate>delegate;


@end

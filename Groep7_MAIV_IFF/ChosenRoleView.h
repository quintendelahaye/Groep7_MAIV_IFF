//
//  ChosenRoleView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"

@interface ChosenRoleView : UIView

- (id)initWithFrame:(CGRect)frame;

-(void)showDetailPage;

@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)Role *role;
@property (strong,nonatomic)UIButton *startButton;

@end

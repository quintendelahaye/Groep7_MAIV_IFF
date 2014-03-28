//
//  RoleView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"

@interface RoleView : UIView

- (id)initWithFrame:(CGRect)frame andRole:(Role*)role;

@property (nonatomic)CGFloat imageWidth;
@property (nonatomic)CGFloat imageHeight;

@property (strong,nonatomic)UIImage *image;

@property (strong,nonatomic)Role *role;

@end

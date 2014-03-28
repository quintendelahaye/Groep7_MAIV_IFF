//
//  ChooseRoleViewController.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseRoleView.h"
#import "Role.h"

@interface ChooseRoleViewController : UIViewController<ChooseRoleViewDelegate>

@property (nonatomic)ChooseRoleView *view;

@property (strong,nonatomic)NSMutableArray *roles;

@property (strong,nonatomic)NSArray *loadedData;

@property (strong,nonatomic)Role *chosenRole;

@end

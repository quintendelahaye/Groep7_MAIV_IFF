//
//  ChosenRoleViewController.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChosenRoleView.h"
#import "Role.h"

@interface ChosenRoleViewController : UIViewController<ChosenRoleViewDelegate>

@property (strong,nonatomic)ChosenRoleView *view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil chosenRole:(Role*)role;

@property (strong,nonatomic)Role *role;

@end

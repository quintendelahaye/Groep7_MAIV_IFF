//
//  RolesView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RolesView : UIView

- (id)initWithFrame:(CGRect)frame andRoles:(NSMutableArray*)roles;

@property (strong,nonatomic)NSMutableArray *roleViews;

@end

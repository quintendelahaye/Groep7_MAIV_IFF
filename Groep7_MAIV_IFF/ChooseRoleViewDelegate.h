//
//  ChooseRoleViewDelegate.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChooseRoleViewDelegate <NSObject>

@required
-(void)showChosenRole:(NSString*)chosenRole;

@end

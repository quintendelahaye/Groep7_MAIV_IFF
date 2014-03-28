//
//  MapBoxViewController.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "MapBoxView.h"
#import "Role.h"

@interface MapBoxViewController : UIViewController<MapBoxViewDelegate>

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andRole:(Role*)role;

@property (strong,nonatomic)MapBoxView *view;



@end

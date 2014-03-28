//
//  StoryViewController.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryView.h"
#import "Story.h"

@interface StoryViewController : UIViewController

@property (strong,nonatomic)StoryView *view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andStory:(Story*)story;

@property (strong,nonatomic)Story *story;

@end

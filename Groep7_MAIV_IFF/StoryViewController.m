//
//  StoryViewController.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "StoryViewController.h"
#import "Story.h"

@interface StoryViewController ()

@end

@implementation StoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andStory:(Story*)story
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = story.title;
        
        self.story = story;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.story = self.story;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = CGRectMake(0, 0, 1024, 768);
    self.view = [[StoryView alloc] initWithFrame:bounds andStory:self.story];
}

@end

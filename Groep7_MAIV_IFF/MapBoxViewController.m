//
//  MapBoxViewController.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "MapBoxViewController.h"
#import "Role.h"
#import "Story.h"
#import "StoryFactory.h"
#import "StoryViewController.h"
#import "InfoViewController.h"
#import "FeedbackViewController.h"

@interface MapBoxViewController ()

@end

@implementation MapBoxViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andRole:(Role*)role
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(infoButtonTapped:)];
        self.title = [NSString stringWithFormat:@"%@ wandelroute",role.name];
        
    }
    return self;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //    [self.view setMultipleTouchEnabled:YES];
    self.view.delegate = self;
    
    NSString *path = @"http://student.howest.be/john-alexander.kol1/20132014/MAIV/ieper_api/api/story";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"Loaded data");
        self.view.stories = [NSMutableArray array];
        for (NSDictionary *dict in responseObject) {
            Story *story = [StoryFactory createStoryFromDictionary:dict];
            [self.view.stories addObject:story];
        }
        [self.view showMarkers];
        //        NSLog(@"[MapBoxViewController] stories: %@",self.view.stories);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        NSLog(@"Error Loaded data");
    }];
    
    [operation start];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = CGRectMake(0, 0, 1024, 768);
    self.view = [[MapBoxView alloc] initWithFrame:bounds];
}

-(void)showStory:(Story*)story{
    StoryViewController *storyVC = [[StoryViewController alloc] initWithNibName:Nil bundle:nil andStory:story];
    [self.navigationController pushViewController:storyVC animated:YES];
}


-(void)infoButtonTapped:(id)sender{
    InfoViewController *infoVC = [[InfoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:infoVC animated:YES];
}

-(void)showFeedBack{
    FeedbackViewController *feedbackVC = [[FeedbackViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:feedbackVC animated:YES];
}


@end

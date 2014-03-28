//
//  ChosenRoleViewController.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "ChosenRoleViewController.h"
#import "Role.h"
#import "MapBoxViewController.h"
#import "InfoViewController.h"

@interface ChosenRoleViewController ()

@end

@implementation ChosenRoleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil chosenRole:(Role*)role
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(infoButtonTapped:)];
        
        self.role = role;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
        self.title = [NSString stringWithFormat:@"%@",self.role.name];
    }
    return self;
}

-(void)showMapBoxView{
    NSLog(@"showMapBoxView");
    MapBoxViewController *mapBoxVC = [[MapBoxViewController alloc] initWithNibName:Nil bundle:nil andRole:self.role];
    [self.navigationController pushViewController:mapBoxVC animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.delegate = self;
    self.view.role = self.role;
    NSLog(@"%@",self.view.role.name);
    [self.view showDetailPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = CGRectMake(0, 0, 1024, 768);
    self.view = [[ChosenRoleView alloc] initWithFrame:bounds];
}

-(void)infoButtonTapped:(id)sender{
    InfoViewController *infoVC = [[InfoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:infoVC animated:YES];
}

@end

//
//  ChooseRoleViewController.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "ChooseRoleViewController.h"
#import "Role.h"
#import "RoleFactory.h"
#import "ChosenRoleViewController.h"

@interface ChooseRoleViewController ()

@end

@implementation ChooseRoleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = [NSString stringWithFormat:@"Kies een rol"];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(infoButtonTapped:)];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    
    CGRect bounds = CGRectMake(0, 0, 1024, 768);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"roles" ofType:@"plist"];
    self.loadedData = [NSArray arrayWithContentsOfFile:path];
    
    self.roles = [NSMutableArray array];
    for(NSDictionary *dict in self.loadedData){
        //        NSLog(@"[ViewController] addRole %@",self.roles);
        //            NSLog(@"%@",dict);
        Role *role = [RoleFactory createRoleFromDictionary:dict];
        [self.roles addObject:role];
    }
    //    NSLog(@"%@",[self.roles objectForKey:self.view.currentRole]);
    //    NSLog(@"%@",self.roles[@"hospik"].name);
    self.view = [[ChooseRoleView alloc] initWithFrame:bounds andRoles:self.roles];
}

-(void)showChosenRole:(NSString*)chosenRole{
    for(Role *role in self.roles){
        if([role.name  isEqual:[NSString stringWithFormat:@"%@",chosenRole]]){
            self.chosenRole = role;
        }
    }
    
    ChosenRoleViewController *chosenRoleVC = [[ChosenRoleViewController alloc] initWithNibName:nil bundle:nil chosenRole:self.chosenRole];
    [self.navigationController pushViewController:chosenRoleVC animated:YES];
    
}

-(void)infoButtonTapped:(id)sender{
    
}

@end

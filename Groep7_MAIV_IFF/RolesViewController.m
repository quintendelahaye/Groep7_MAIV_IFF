//
//  RolesViewController.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RolesViewController.h"
#import "Role.h"
#import "RoleFactory.h"

@interface RolesViewController ()

@end

@implementation RolesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = [NSString stringWithFormat:@"Kies een rol"];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"roles" ofType:@"plist"];
        NSArray *loadedData = [NSArray arrayWithContentsOfFile:path];
        
        
        //          NSLog(@"%@",loadedData);
        self.roles = [NSMutableArray array];
        for(NSDictionary *dict in loadedData){
                NSLog(@"%@",dict);
            Role *role = [RoleFactory createRoleFromDictionary:dict];
            [self.roles addObject:role];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = CGRectMake(0, 0, 1024, 768);
    self.view = [[RolesView alloc] initWithFrame:bounds];
}

@end

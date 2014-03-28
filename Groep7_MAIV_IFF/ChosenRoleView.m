//
//  ChosenRoleView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 27/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "ChosenRoleView.h"

@implementation ChosenRoleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        
    }
    return self;
}

-(void)showDetailPage{
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"detail_%@",self.role.name]];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [self addSubview:self.imageView];
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *btnStartButtonImage = [UIImage imageNamed:@"rol_btnStart"];
    [self.startButton setBackgroundImage:btnStartButtonImage forState:UIControlStateNormal];
    self.startButton.frame = CGRectMake(self.frame.size.width - btnStartButtonImage.size.width - 30, self.frame.size.height - btnStartButtonImage.size.height - 20, btnStartButtonImage.size.width, btnStartButtonImage.size.height);
    [self addSubview:self.startButton];
    
    [self.startButton addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)startButtonTapped:(id)sender{
    if ([self.role.name  isEqual: @"soldaat"] || [self.role.name  isEqual: @"hospik"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Under Construction"
                                                        message:@"Dit verhaal moet nog geschreven worden. (Tip: Kies voor de piloot.)"
                                                       delegate:nil
                                              cancelButtonTitle:@"Terug"
                                              otherButtonTitles:nil];
        [alert show];
    }else{
        
    }
    
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

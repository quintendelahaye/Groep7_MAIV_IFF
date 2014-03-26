//
//  RotationViewController.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RotationViewController.h"
#import "RotationView.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSLog(@"[RotationVC] init");
        

            [self.view.btnRotateLeft addTarget:self action:@selector(rotateLeft:) forControlEvents:UIControlEventTouchUpInside];

            [self.view.btnRotateRight addTarget:self action:@selector(rotateRight:) forControlEvents:UIControlEventTouchUpInside];

        
        
        
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
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[RotationView alloc] initWithFrame:bounds];
    [self setAnchorPoint:CGPointMake(0.5,1) forImageView:self.view.imageView];
    
}

-(void)rotateLeft:(id)sender{
    
    [self.view rotateImage:self.view.imageView duration:0.4 curve:UIViewAnimationCurveEaseIn degrees:self.view.currentAngle-30];
    
    
}

-(void)rotateRight:(id)sender{
    
    [self.view rotateImage:self.view.imageView duration:0.4 curve:UIViewAnimationCurveEaseIn degrees:self.view.currentAngle+30];
}

-(void)setAnchorPoint:(CGPoint)anchorPoint forImageView:(UIImageView *)imageView
{
    CGPoint newPoint = CGPointMake(imageView.bounds.size.width * anchorPoint.x, imageView.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(imageView.bounds.size.width * imageView.layer.anchorPoint.x, imageView.bounds.size.height * imageView.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, imageView.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, imageView.transform);
    
    CGPoint position = imageView.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    imageView.layer.position = position;
    imageView.layer.anchorPoint = anchorPoint;
}



@end

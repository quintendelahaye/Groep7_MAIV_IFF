//
//  MapBoxView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "MapBoxView.h"
#import <RMMapboxSource.h>
#import <RMPointAnnotation.h>
#import <RMMarker.h>
#import "Story.h"
#import "Mapbox.h"

@implementation MapBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        //quintendelahaye.hl3f3o1f = mt foto's
        self.frame = frame;
        self.showPhotos = NO;
        
        self.walk_completed = NO;
        
        if(self.showPhotos == NO){
            [self showMapWithId:@"quintendelahaye.hl20ogdp" andWalkCompletion:self.walk_completed]; //GEEN FOTOS
        }else{
            [self showMapWithId:@"quintendelahaye.hl3f3o1f" andWalkCompletion:self.walk_completed]; // WEL FOTOS
        }
    }
    return self;
}

-(void)togglePhotos:(id)sender{
    self.showPhotos = !self.showPhotos;
    if(self.showPhotos == NO){
        [self showMapWithId:@"quintendelahaye.hl20ogdp" andWalkCompletion:self.walk_completed]; //GEEN FOTOS
    }else{
        [self showMapWithId:@"quintendelahaye.hl3f3o1f" andWalkCompletion:self.walk_completed]; // WEL FOTOS
    }
}

-(void)showMapWithId:(NSString*)map_id andWalkCompletion:(BOOL)walkCompletion{
    
    self.mapView = nil;
    
    RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:[NSString stringWithFormat:@"%@",map_id]];
    self.mapView = [[RMMapView alloc] initWithFrame:self.frame andTilesource:source];
    [self.mapView setConstraintsSouthWest:CLLocationCoordinate2DMake(50.8685, 2.8705) northEast:CLLocationCoordinate2DMake(50.8937, 2.9224)];
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(50.8808, 2.8955);
    self.mapView.minZoom = 12;
    self.mapView.maxZoom = 20;
    self.mapView.zoom = 12;
    self.mapView.delegate = self;
    //2.8705,50.8685,2.9224,50.8937
    [self addSubview:self.mapView];
    
    UIButton *showPhotosButton = [UIButton buttonWithType:UIButtonTypeCustom];
    showPhotosButton.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.8];
    [showPhotosButton setFrame:CGRectMake(self.frame.size.width - 200, 100, 200, 50)];
    [showPhotosButton setTitle:[NSString stringWithFormat:@"Satelliet/Luchtfotos"] forState:UIControlStateNormal];
    [showPhotosButton addTarget:self action:@selector(togglePhotos:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:showPhotosButton];
    
    if(walkCompletion == YES){
        [self.wandelingButton removeFromSuperview];
        self.wandelingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.wandelingButton.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.8];
        [self.wandelingButton setFrame:CGRectMake(self.frame.size.width/2 - 100, self.frame.size.height-100, 200, 50)];
        [self.wandelingButton setTitle:[NSString stringWithFormat:@"Beeindig hier je verhaal!"] forState:UIControlStateNormal];
        [self.wandelingButton addTarget:self action:@selector(showEndOfWalk:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.wandelingButton];
    }

    
    [self showMarkers];
}

-(void)showMarkers{
    //    NSLog(@"[MapBoxView] stories: %@",self.stories);
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    for (Story *story in self.stories) {
        
        if([story.title isEqualToString:@"Verkenning"]){
            story.story_tobeviewed = YES;
        }
        //        NSLog(@"%@",story.longitude);
        self.annotation = [[RMAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake([story.latitude doubleValue],[story.longitude doubleValue]) andTitle:[NSString stringWithFormat:@"%@",story.title]];
        if(story.story_tobeviewed == YES){
            self.annotation.userInfo = [NSString stringWithFormat:@"story_active"];
        }else{
            self.annotation.userInfo = [NSString stringWithFormat:@"story_inactive"];
        }
        
        [self.mapView addAnnotation:self.annotation];
    }
}

- (void)mapView:(RMMapView *)mapView didSelectAnnotation:(RMAnnotation *)annotation
{
    
    if([annotation.userInfo isEqualToString:@"story_active"]){
        
        for(Story *story in self.stories){
            //        NSLog(@"story.title = %@", story.title);
            //        NSLog(@"annotation.title = %@", annotation.title);
            
            
            
            if([[NSString stringWithFormat:@"%@",story.title] isEqualToString:[NSString stringWithFormat:@"%@",annotation.title]]){
                if([self.stories indexOfObject:story] == 3){
                    NSLog(@"Laatste dinges");
                    self.walk_completed = YES;
                    [self.wandelingButton removeFromSuperview];
                    self.wandelingButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    self.wandelingButton.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.8];
                    [self.wandelingButton setFrame:CGRectMake(self.frame.size.width/2 - 100, self.frame.size.height-100, 200, 50)];
                    [self.wandelingButton setTitle:[NSString stringWithFormat:@"Beeindig hier je verhaal!"] forState:UIControlStateNormal];
                    [self.wandelingButton addTarget:self action:@selector(showEndOfWalk:) forControlEvents:UIControlEventTouchUpInside];
                    [self addSubview:self.wandelingButton];
                }else{
                    Story *nextStory = [self.stories objectAtIndex:[self.stories indexOfObject:story] + 1];
                    nextStory.story_tobeviewed = YES;
                }


                int currentIndex = [self.stories indexOfObject:story];
                self.selectedStory = [self.stories objectAtIndex:currentIndex];
                //            NSLog(@"selectedStory = %@",self.selectedStory.title);
                [self.delegate showStory:self.selectedStory];
            }
        }
        [self showMarkers];
        //    NSLog(@"selected annotation %@", annotation);
    }
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMMarker *marker;
    
    if ([annotation.userInfo isEqualToString:@"story_active"])
    {
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_poppie"]];
        
    }else if ([annotation.userInfo isEqualToString:@"story_inactive"])
    {
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"poppy_black"]];
    }
    
    marker.canShowCallout = YES;
    return marker;
}

-(void)showEndOfWalk:(id)sender{
    [self.delegate showFeedBack];
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

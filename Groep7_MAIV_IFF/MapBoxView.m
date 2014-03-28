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

@implementation MapBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"quintendelahaye.hl20ogdp"];
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source];
        [self.mapView setConstraintsSouthWest:CLLocationCoordinate2DMake(50.8685, 2.8705) northEast:CLLocationCoordinate2DMake(50.8937, 2.9224)];
        self.mapView.centerCoordinate = CLLocationCoordinate2DMake(50.8808, 2.8955);
        self.mapView.minZoom = 12;
        self.mapView.maxZoom = 20;
        self.mapView.zoom = 13;
        
        //2.8705,50.8685,2.9224,50.8937
        
        
        self.mapView.delegate = self;
        
        [self addSubview:self.mapView];
    }
    return self;
}



-(void)showMarkers{
    //    NSLog(@"[MapBoxView] stories: %@",self.stories);
    
    for (Story *story in self.stories) {
        
        RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake([story.latitude doubleValue],[story.longitude doubleValue]) andTitle:[NSString stringWithFormat:@"%@",story.title]];
        [self.mapView addAnnotation:annotation];
        annotation.userInfo = [NSString stringWithFormat:@"story"];
        
        //  ___CUSTOM MARKERS?_____
        //  ___ANNOTATIONS MOETEN OP TOUCH REAGEREN..._____
    }
}

- (void)mapView:(RMMapView *)mapView didSelectAnnotation:(RMAnnotation *)annotation
{
    for(Story *story in self.stories){
        NSLog(@"story.title = %@", story.title);
        NSLog(@"annotation.title = %@", annotation.title);
        
        if([[NSString stringWithFormat:@"%@",story.title] isEqualToString:[NSString stringWithFormat:@"%@",annotation.title]]){
            int currentIndex = [self.stories indexOfObject:story];
            self.selectedStory = [self.stories objectAtIndex:currentIndex];
            NSLog(@"selectedStory = %@",self.selectedStory.title);
            [self.delegate showStory:self.selectedStory];
            
        }
    }
    NSLog(@"selected annotation %@", annotation);
    
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMMarker *marker;
    
    if ([annotation.userInfo isEqualToString:@"story"])
    {
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_poppie"]];
        marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    }
    
    marker.canShowCallout = YES;
    
    return marker;
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

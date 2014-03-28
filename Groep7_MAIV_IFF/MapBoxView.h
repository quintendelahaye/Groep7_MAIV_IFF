//
//  MapBoxView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMMapView.h>
#import "Story.h"
#import "MapBoxViewDelegate.h"

@interface MapBoxView : UIView <RMMapViewDelegate>

@property (nonatomic, weak)id<MapBoxViewDelegate>delegate;

@property (strong,nonatomic)Story *selectedStory;

@property (strong,nonatomic)RMMapView *mapView;

@property (strong,nonatomic)NSMutableArray *stories;

-(void)showMarkers;

@end

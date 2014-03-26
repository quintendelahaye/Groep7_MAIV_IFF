//
//  MapBoxView.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 25/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "MapBoxView.h"
#import <RMMapboxSource.h>

@implementation MapBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"quintendelahaye.hkc7m4le"];
        
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.855, 2.899) zoomLevel:18 maxZoomLevel:20 minZoomLevel:11 backgroundImage:nil];
        [self addSubview:self.mapView];
    }
    return self;
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

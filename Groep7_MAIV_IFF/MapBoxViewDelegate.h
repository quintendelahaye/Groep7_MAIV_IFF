//
//  MapBoxViewDelegate.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Story.h"

@protocol MapBoxViewDelegate <NSObject>

@required
-(void)showStory:(Story*)story;
-(void)showFeedBack;

@end

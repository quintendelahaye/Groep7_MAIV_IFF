//
//  StoryView.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface StoryView : UIView

- (id)initWithFrame:(CGRect)frame andStory:(Story*)story;

@property (strong,nonatomic)Story *story;

@end

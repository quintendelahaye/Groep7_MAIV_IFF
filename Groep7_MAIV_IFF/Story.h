//
//  Story.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property (nonatomic,strong)NSNumber *story_step;
@property (strong,nonatomic)NSNumber *latitude;
@property (strong,nonatomic)NSNumber *longitude;
@property (strong,nonatomic)NSString *rol;
@property (strong,nonatomic)NSString *story;
@property (strong,nonatomic)NSString *title;
@property (strong,nonatomic)NSString *image_path;

@end

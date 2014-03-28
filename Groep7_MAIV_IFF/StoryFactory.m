//
//  StoryFactory.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 28/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "StoryFactory.h"


@implementation StoryFactory

+(Story*)createStoryFromDictionary:(NSDictionary*)dictionary{
    
    Story *story = [[Story alloc] init];
    story.story = [dictionary objectForKey:@"story"];
    story.latitude = [dictionary objectForKey:@"latitude"];
    story.longitude = [dictionary objectForKey:@"longitude"];
    story.rol = [dictionary objectForKey:@"rol"];
    story.title = [dictionary objectForKey:@"title"];
    story.story_step = [dictionary objectForKey:@"story_step"];
    story.image_path = [dictionary objectForKey:@"image_path"];
    story.story_tobeviewed = NO;
    return story;
    
}

@end

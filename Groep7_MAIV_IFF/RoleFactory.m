//
//  RoleFactory.m
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RoleFactory.h"

@implementation RoleFactory

+(Role*)createRoleFromDictionary:(NSDictionary*)dictionary{
   
    Role *role = [[Role alloc] init];
    role.name = [dictionary objectForKey:@"name"];
    role.image_path = [dictionary objectForKey:@"image_path"];
    role.name_path = [dictionary objectForKey:@"name_path"];
    role.width = [[dictionary objectForKey:@"width"] floatValue];
    role.height = [[dictionary objectForKey:@"height"] floatValue];
    role.retina_width = [[dictionary objectForKey:@"retina_width"] floatValue];
    role.retina_height = [[dictionary objectForKey:@"retina_height"] floatValue];
    
    return role;
    
}

@end

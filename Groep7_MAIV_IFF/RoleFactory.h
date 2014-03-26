//
//  RoleFactory.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Role.h"

@interface RoleFactory : NSObject

+(Role*)createRoleFromDictionary:(NSDictionary*)dictionary;

@end

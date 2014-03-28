//
//  Role.h
//  Groep7_MAIV_IFF
//
//  Created by Quinten Delahaye on 26/03/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Role : NSObject

@property (strong,nonatomic)NSString *name;

@property (strong,nonatomic)NSString *name_path;
@property (strong,nonatomic)NSString *image_path;

@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;

@property(nonatomic)CGFloat retina_width;
@property(nonatomic)CGFloat retina_height;

@end

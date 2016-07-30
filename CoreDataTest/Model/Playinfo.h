//
//  Playinfo.h
//  __PRODUCTNAME__
//
//  Created by duck on 16/07/31
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"



@interface Playinfo : JSONModel

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *name;

@end
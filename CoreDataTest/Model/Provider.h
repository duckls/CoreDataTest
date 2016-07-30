//
//  Provider.h
//  __PRODUCTNAME__
//
//  Created by duck on 16/07/31
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"



@interface Provider : JSONModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *icon;

@end
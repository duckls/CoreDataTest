//
//  Consumption.h
//  __PRODUCTNAME__
//
//  Created by duck on 16/07/31
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Consumption : JSONModel

@property (nonatomic, assign) NSInteger collectionCount;

@property (nonatomic, assign) NSInteger shareCount;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger playCount;

@end
//
//  Consumption.m
//  __PRODUCTNAME__
//
//  Created by duck on 16/07/31
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "Consumption.h"

@implementation Consumption
- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err
{
    self = [super initWithDictionary:dict error:err];
    if (self) {
        
    }
    return self;
}
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

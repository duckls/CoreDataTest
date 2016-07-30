//
//  VideoData.m
//  __PRODUCTNAME__
//
//  Created by duck on 16/07/31
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "VideoData.h"
#import "Playinfo.h"

@implementation VideoData

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err
{
    self = [super initWithDictionary:dict error:err];
    if (self) {

        NSMutableArray * plays = [[NSMutableArray alloc]init];
        for (NSDictionary * playInfo in self.playInfo) {
            Playinfo * info = [[Playinfo alloc]initWithDictionary:playInfo error:nil];
            [plays addObject:info];
        }
        self.playInfo = plays;
    }
    return self;
}
+ (NSDictionary *)objectClassInArray{
    return @{@"playInfo" : [Playinfo class]};
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

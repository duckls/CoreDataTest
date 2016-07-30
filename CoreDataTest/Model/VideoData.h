//
//  VideoData.h
//  __PRODUCTNAME__
//
//  Created by duck on 16/07/31
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class Consumption,Provider,Playinfo,Author;

@interface VideoData : JSONModel

@property (nonatomic, copy) NSString *shareAdTrack;

@property (nonatomic, copy) NSString *coverBlurred;

@property (nonatomic, copy) NSString *webUrl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *webAdTrack;

@property (nonatomic, strong) NSArray<Playinfo *> *playInfo;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, assign) NSInteger idx;

@property (nonatomic, copy) NSString *favoriteAdTrack;

@property (nonatomic, copy) NSString *rawWebUrl;

@property (nonatomic, copy) NSString *coverForFeed;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, strong) Consumption *consumption;

@property (nonatomic, copy) NSString *waterMarks;

@property (nonatomic, assign) NSInteger videoId;

@property (nonatomic, assign) long long date;

@property (nonatomic, copy) NSString *coverForDetail;

@property (nonatomic, copy) NSString *playUrl;

@property (nonatomic, copy) NSString *promotion;

@property (nonatomic, copy) NSString *coverForSharing;

@property (nonatomic, strong) Provider *provider;

@property (nonatomic, copy) NSString *adTrack;

@property (nonatomic, copy) Author *author;

@property (nonatomic, copy) NSString *des;

@end
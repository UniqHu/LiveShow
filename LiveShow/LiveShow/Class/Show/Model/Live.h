//
//  Live.h
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Creator.h"

@interface Live : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) Creator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger online_users;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

@property (nonatomic, copy) NSString * distance;

@property (nonatomic, getter=isShow) BOOL show;

@end

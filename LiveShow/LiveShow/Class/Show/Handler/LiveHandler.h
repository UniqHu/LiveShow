//
//  LiveHandler.h
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "HJBaseHandler.h"

@interface LiveHandler : HJBaseHandler

/**
 *  获取热门直播信息
 *
 *  @param success 成功block
 *  @param failed 失败block
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 *  获取附近的直播信息
 *
 *  @param success 成功block
 *  @param failed 失败block
 */

+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 *  获取广告页
 *
 *  @param success 成功block
 *  @param failed 失败block
 */

+ (void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;


@end

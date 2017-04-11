//
//  LiveHandler.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "LiveHandler.h"
#import "HttpTool.h"
#import "Live.h"

@implementation LiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failed(json);
        } else {
            //如果返回信息正确
            //数据解析
            NSArray * lives =  [Live mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
    
}

@end

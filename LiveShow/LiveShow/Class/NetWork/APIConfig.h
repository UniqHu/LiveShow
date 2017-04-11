//
//  APIConfig.h
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

@interface APIConfig : NSObject

//信息类服务器地址
//#define SERVER_HOST @"http://service.ingkee.com"
#define SERVER_HOST @"http://service.inke.com/"

//图片服务器地址
//#define IMAGE_HOST @"http://img.meelive.cn/"
#define IMAGE_HOST @"http://img2.inke.cn/"


//热门直播
//#define API_HotLive @"api/live/gettop"
#define API_HotLive @"api/live/gettop?&gender=0&gps_info=118.781650%2C32.031273&loc_info=CN%2C%E6%B1%9F%E8%8B%8F%E7%9C%81%2C%E5%8D%97%E4%BA%AC%E5%B8%82&is_new_user=1&lc=0000000000000052&cc=TG0001&cv=IK4.0.20_Iphone&proto=7&idfa=31EEA993-ADFD-43AC-BC5E-922D3C6AFEA4&idfv=B4D13428-2BE4-43C5-AE39-3B44680E053F&devi=149c0180d5281025c71fff5a19d46d61ddf379dd&osversion=ios_10.000000&ua=iPhone6_2&imei=&imsi=&uid=435814612&sid=20ra5A2fZ1lrJCJQGCJSBbmEkIX0x8HQaAmgNpcb2mCsBbz2s3&conn=wifi&mtid=c3e0c09a4b9fa3b2e326275f8296094c&mtxid=aca31ed2b143&logid=137,202,206&count=5&multiaddr=1&s_sg=f1fde9738f3e331f0f93e324681dbe90&s_sc=100&s_st=1491902125"

//附近的人
#define API_NearLive @"api/live/near_recommend" //?uid=85149891&latitude=40.090562&longitude=116.413353

//广告地址
#define API_Advertise @"advertise/get"


@end

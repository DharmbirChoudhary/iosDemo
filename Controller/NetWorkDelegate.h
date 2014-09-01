//
//  NetWorkDelegate.h
//  FinaceDemo
//
//  Created by Wansheng Li on 14-7-29.
//  Copyright (c) 2014年 Wansheng Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

//#define  DEFAULT_PORT 5050
//#define  DEFAULT_HOST @"feed.cqsignal.com"

#define  DEFAULT_PORT 123
#define  DEFAULT_HOST @"192.168.1.130"

#define IP_CACHED_FILE_NAME @"ip_address.txt"

extern NSString* g_hostIpAddress;


typedef void (^processFeedBack) (NSDictionary* jsonData, NSArray* jsonData2, NSError* error);

@interface NetWorkDelegate : NSObject

+ (instancetype)sharedInstance;
+ (NSString *)dataFilePath:(NSString*) fileName;


- (void)initWithDefault;
- (void)initializeWithHost:(NSString*)host Port:(ushort) port;
- (void)sendDataByDictionary:(NSDictionary*)data callBack:(processFeedBack) handler;
- (void)sendRawData:(NSData*)data callBack:(processFeedBack) handler;
-(void)closeConnect;
-(void)changeHost:(NSString*) newHost;
@end

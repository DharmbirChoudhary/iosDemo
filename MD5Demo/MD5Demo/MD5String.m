//
//  MD5String.m
//  fans1
//
//  Created by liweiqiang on 14-5-27.
//  Copyright (c) 2014年 fans1. All rights reserved.
//

#import "MD5String.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5String

+ (NSString *)md5String:(NSString *)input {
    NSData *stringBytes = [input dataUsingEncoding: NSUTF8StringEncoding];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    if (CC_MD5([stringBytes bytes], (CC_LONG)[stringBytes length], digest)) {
        NSMutableString *hashedUUID = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
        for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
            [hashedUUID appendFormat:@"%02x", digest[i]];
        }
        return hashedUUID;
    }
    
    return nil;
}

@end

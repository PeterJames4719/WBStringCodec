//
//  NSString+MD5.m
// 
//
//  Created by 兵伍 on 2018/4/5.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(MD5)
- (NSString *)md5_string {
    const char *cStr = [self UTF8String];
    if (cStr == NULL) {
        cStr = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), r);
    NSString *MD5Str = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    return MD5Str;
}

@end

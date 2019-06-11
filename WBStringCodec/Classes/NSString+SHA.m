//
//  NSString+SHA.m
// 
//
//  Created by 兵伍 on 2019/4/2.
//  Copyright © 2019年 兵伍. All rights reserved.
//

#import "NSString+SHA.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
#import "NSString+Base64.h"

@implementation NSString(SHA)

+ (NSString *)hmacSHA1_base64_stringWithString:(NSString *)origin key:(NSString *)key {
    NSData *data = [self hmacSHA1_dataWithString:origin key:key];
    NSString *result = [NSString base64_encryptedStringWith:data];
    return result;
}

+ (NSData *)hmacSHA1_dataWithString:(NSString *)origin key:(NSString *)key {
    
    if (!origin) {
        return nil;
    }
    
    if (![key isKindOfClass:[NSString class]]) {
        NSLog(@"WBStringCodec:hmacSHA1 key nil");
        return nil;
    }
    
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [origin cStringUsingEncoding:NSUTF8StringEncoding];
    uint8_t cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData * cHMACData = [[NSData alloc]initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    return cHMACData;
}

@end

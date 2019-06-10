//
//  NSString+DES.m
// 
//
//  Created by 兵伍 on 2018/4/11.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+DES.h"
#import <CommonCrypto/CommonCryptor.h>
#import "NSString+Base64.h"

@implementation NSString(DES)

// DES 加密
+ (NSData *)des_encryptedDataWithData:(NSData *)data key:(NSString *)key {
    return [self des_codecedDataWithData:data key:key isEncrypt:YES];
}

// DES 解密
+ (NSData *)des_decryptedDataWithData:(NSData *)data key:(NSString *)key {
    return [self des_codecedDataWithData:data key:key isEncrypt:NO];
}

#pragma mark - DES + Base 64

+ (NSString *)des_base64_encryptedStringWithData:(NSData *)data key:(NSString *)key {
    NSData *desData = [self des_encryptedDataWithData:data key:key];
    return [NSString base64_encryptedStringWith:desData];
}

+ (NSString *)des_base64_decryptedStringWithData:(NSData *)data key:(NSString *)key {
    NSData *originData = [self des_base64_decryptedDataWithData:data key:key];
    return [[NSString alloc] initWithData:originData encoding:NSUTF8StringEncoding];
}

+ (NSData *)des_base64_encryptedDataWithData:(NSData *)data key:(NSString *)key {
    NSData *desData = [self des_encryptedDataWithData:data key:key];
    return [NSString base64_encryptedDataWith:desData];
}

+ (NSData *)des_base64_decryptedDataWithData:(NSData *)data key:(NSString *)key {
    NSData *desData = [NSString base64_decryptedDataWith:data];
    NSData *originData = [self des_decryptedDataWithData:desData key:key];
    return originData;
}

#pragma mark - DES Codec

+ (NSData *)des_codecedDataWithData:(NSData *)data key:(NSString *)key isEncrypt:(BOOL)encrypt
{
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeDES;
    unsigned char buffer[bufferSize];
    memset(buffer, 0, sizeof(buffer));
    size_t numBytes = 0;
    CCCryptorStatus cryptStatus = CCCrypt(encrypt ? kCCEncrypt : kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          [key UTF8String],
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytes);
    NSData *result = nil;
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytes:buffer length:(NSUInteger)numBytes];
    }
    return result;
}

@end



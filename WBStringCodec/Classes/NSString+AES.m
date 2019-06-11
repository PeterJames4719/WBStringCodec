//
//  NSString+AES.m
// 
//
//  Created by 兵伍 on 2018/4/17.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+AES.h"
#import <CommonCrypto/CommonCryptor.h>
#import "NSString+Base64.h"

@implementation NSString(AES)
    
#pragma mark - AES 128

+ (NSData *)aes128_encryptedDataWithData:(NSData *)data key:(NSString *)key {
    return [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES128 isEncrypt:YES];
}

+ (NSData *)aes128_decryptedDataWithData:(NSData *)data key:(NSString *)key {
    return [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES128 isEncrypt:NO];
}

#pragma mark - AES 128 + Base 64

// string
+ (NSString *)aes128_base64_encryptedStringWithData:(NSData *)data key:(NSString *)key {
    NSData *aesData = [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES128 isEncrypt:YES];
    return [NSString base64_encryptedStringWith:aesData];
}

+ (NSString *)aes128_base64_decryptedStringWithData:(NSData *)data key:(NSString *)key {
    NSData *originData = [self aes128_base64_decryptedDataWithData:data key:key];
    return [[NSString alloc] initWithData:originData encoding:NSUTF8StringEncoding];
}

// data
+ (NSData *)aes128_base64_encryptedDataWithData:(NSData *)data key:(NSString *)key {
    NSData *aesData = [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES128 isEncrypt:YES];
    return [NSString base64_encryptedDataWith:aesData];
}

+ (NSData *)aes128_base64_decryptedDataWithData:(NSData *)data key:(NSString *)key {
    NSData *aesData = [NSString base64_decryptedDataWith:data];
    NSData *originData = [self aes_codecedDataWithData:aesData key:key keySize:kCCKeySizeAES128 isEncrypt:NO];
    return originData;
}

#pragma mark - AES 256

+ (NSData *)aes256_encryptedDataWithData:(NSData *)data key:(NSString *)key {
    return [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES256 isEncrypt:YES];
}

+ (NSData *)aes256_decryptedDataWithData:(NSData *)data key:(NSString *)key {
    return [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES256 isEncrypt:NO];
}

#pragma mark - AES 256 + Base 64

// string
+ (NSString *)aes256_base64_encryptedStringWithData:(NSData *)data key:(NSString *)key {
    NSData *aesData = [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES256 isEncrypt:YES];
    return [NSString base64_encryptedStringWith:aesData];
}

+ (NSString *)aes256_base64_decryptedStringWithData:(NSData *)data key:(NSString *)key {
    NSData *originData = [self aes256_base64_decryptedDataWithData:data key:key];
    return [[NSString alloc] initWithData:originData encoding:NSUTF8StringEncoding];
}

// data
+ (NSData *)aes256_base64_encryptedDataWithData:(NSData *)data key:(NSString *)key {
    NSData *aesData = [self aes_codecedDataWithData:data key:key keySize:kCCKeySizeAES256 isEncrypt:YES];
    return [NSString base64_encryptedDataWith:aesData];
}

+ (NSData *)aes256_base64_decryptedDataWithData:(NSData *)data key:(NSString *)key {
    NSData *aesData = [NSString base64_decryptedDataWith:data];
    NSData *originData = [self aes_codecedDataWithData:aesData key:key keySize:kCCKeySizeAES256 isEncrypt:NO];
    return originData;
}

#pragma mark - AES Codec

+ (NSData *)aes_codecedDataWithData:(NSData *)data key:(NSString *)key keySize:(NSInteger)keySize isEncrypt:(BOOL)encrypt {
    if (!data) {
        return data;
    }
    if (!key || key.length !=16) {
        NSLog(@"aes key length must be 16");
        return nil;
    }
    char keyPtr[keySize + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = data.length;
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytes = 0;
    CCCryptorStatus cryptStatus = CCCrypt(encrypt ? kCCEncrypt : kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          data.bytes,
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytes);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytes];
    }
    free(buffer);
    return nil;
}

@end

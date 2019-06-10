//
//  NSString+AES.h
// 
//
//  Created by 兵伍 on 2018/4/17.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(AES)
// AES 128
+ (NSData *)aes128_encryptedDataWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)aes128_decryptedDataWithData:(NSData *)data key:(NSString *)key;

// AES 128 + base 64
+ (NSString *)aes128_base64_encryptedStringWithData:(NSData *)data key:(NSString *)key;
+ (NSString *)aes128_base64_decryptedStringWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)aes128_base64_encryptedDataWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)aes128_base64_decryptedDataWithData:(NSData *)data key:(NSString *)key;


// AES 256
+ (NSData *)aes256_encryptedDataWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)aes256_decryptedDataWithData:(NSData *)data key:(NSString *)key;

// AES 256 + base 64
+ (NSString *)aes256_base64_encryptedStringWithData:(NSData *)data key:(NSString *)key;
+ (NSString *)aes256_base64_decryptedStringWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)aes256_base64_encryptedDataWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)aes256_base64_decryptedDataWithData:(NSData *)data key:(NSString *)key;
@end

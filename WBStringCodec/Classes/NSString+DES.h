//
//  NSString+DES.h
// 
//
//  Created by 兵伍 on 2018/4/11.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(DES)
// DES
+ (NSData *)des_encryptedDataWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)des_decryptedDataWithData:(NSData *)data key:(NSString *)key;

// DES + Base 64
+ (NSString *)des_base64_encryptedStringWithData:(NSData *)data key:(NSString *)key;
+ (NSString *)des_base64_decryptedStringWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)des_base64_encryptedDataWithData:(NSData *)data key:(NSString *)key;
+ (NSData *)des_base64_decryptedDataWithData:(NSData *)data key:(NSString *)key;
@end



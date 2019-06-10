//
//  NSString+Base64.h
//  MinerApp
//
//  Created by 兵伍 on 2019/6/4.
//  Copyright © 2019 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Base64)
// 加密
+ (NSString *)base64_encryptedStringWith:(id)dataOrString;
+ (NSData *)base64_encryptedDataWith:(id)dataOrString;

// 解密
+ (NSString *)base64_decryptedStringWith:(id)dataOrString;
+ (NSData *)base64_decryptedDataWith:(id)dataOrString;
@end


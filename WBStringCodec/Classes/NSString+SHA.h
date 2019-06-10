//
//  NSString+SHA.h
// 
//
//  Created by 兵伍 on 2019/4/2.
//  Copyright © 2019年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(SHA)
+ (NSString *)hmacSHA1_base64_stringWithString:(NSString *)origin key:(NSString *)key;
+ (NSData *)hmacSHA1_dataWithString:(NSString *)origin key:(NSString *)key;
@end



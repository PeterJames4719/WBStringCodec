//
//  NSString+URL.m
// 
//
//  Created by 兵伍 on 2018/4/9.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString(URL)

- (NSURL *)decodedURL {
    return [NSURL URLWithString:[self decodedURLString]];
}

- (NSURL*)encodedURL {
    NSURL *url = [NSURL URLWithString:[self encodedURLString]];
    return url;
}

- (NSString *)decodedURLString {
    NSString *url = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return url;
}

- (NSString *)encodedURLString {
    NSString *collectUrl = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *urlEncodeString = [collectUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlEncodeString;
}

- (NSString *)encodedURLStringCustom {
    NSString *result = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (CFStringRef)self,
                                                                                 NULL,
                                                                                 CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                 kCFStringEncodingUTF8));
    return result;
}

- (NSDictionary *)urlQueryParameters {
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *userParams = [NSMutableDictionary dictionary];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        if (kv.count == 2) {
            NSString *key = [kv objectAtIndex:0];
            NSString *value = [[kv objectAtIndex:1] decodedURLString];
            [userParams setObject:value forKey:key];
        }
    }
    return userParams;
}

@end

//
//  NSString+Base64.m
//  MinerApp
//
//  Created by 兵伍 on 2019/6/4.
//  Copyright © 2019 兵伍. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString(Base64)

#pragma mark - Encrypt

+ (NSString *)base64_encryptedStringWith:(id)dataOrString {
    NSData *data = nil;
    if ([dataOrString isKindOfClass:[NSString class]]) {
        data = [(NSString *)dataOrString dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([dataOrString isKindOfClass:[NSData class]]) {
        data = (NSData *)dataOrString;
    }
    if (!data) {
        return nil;
    }
    NSString *encryptedString = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    return encryptedString;
}

+ (NSData *)base64_encryptedDataWith:(id)dataOrString {
    NSData *data = nil;
    if ([dataOrString isKindOfClass:[NSString class]]) {
        data = [(NSString *)dataOrString dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([dataOrString isKindOfClass:[NSData class]]) {
        data = (NSData *)dataOrString;
    }
    if (!data) {
        return nil;
    }
    NSData *encryptedData = [data base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    return encryptedData;
}

#pragma mark - Decrypt

+ (NSString *)base64_decryptedStringWith:(id)dataOrString {
    NSData *decryptedData = [self base64_decryptedDataWith:dataOrString];
    NSString *decrytedString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return decrytedString;
}
    
+ (NSData *)base64_decryptedDataWith:(id)dataOrString {
    NSData *data = nil;
    if ([dataOrString isKindOfClass:[NSString class]]) {
        data = [(NSString *)dataOrString dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([dataOrString isKindOfClass:[NSData class]]) {
        data = (NSData *)dataOrString;
    }
    if (!data) {
        return nil;
    }
    NSData *decryptedData = [[NSData alloc] initWithBase64EncodedData:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decryptedData;
}


@end


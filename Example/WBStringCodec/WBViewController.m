//
//  WBViewController.m
//  WBStringCodec
//
//  Created by PeterJames4719 on 06/04/2019.
//  Copyright (c) 2019 PeterJames4719. All rights reserved.
//

#import "WBViewController.h"
#import <WBStringCodec.h>

@interface WBViewController ()
{
    NSString *string;
    NSData *stringData;
}
@end

@implementation WBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    string = @"abcdefghijklmzOPQRSTUVWXYZ 0123456789 +【】()[]*&^%$#@! 我是一个兵，来自老百姓。";
    stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    [self testdes];
    [self testaes128];
    [self testaes256];
    [self testhmacSHA1];
}

- (void)testdes {
    NSString *key = @"ighadKSG";

    // DES
    // string data -> des data
    NSData *desData1 = [NSString des_encryptedDataWithData:[string dataUsingEncoding:NSUTF8StringEncoding] key:key];
    // des data -> base 64 string
    NSString *des_enString = [NSString base64_encryptedStringWith:desData1];
    // des data <- base 64 string
    NSData *desData2 = [NSString base64_decryptedDataWith:des_enString];
    // string data <- des data
    NSString *des_deString = [[NSString alloc] initWithData:[NSString des_decryptedDataWithData:desData2 key:key] encoding:NSUTF8StringEncoding];
    
    //NSLog(@"des_enString:%@", des_enString);
    //NSLog(@"des_deString:%@", des_deString);
    
    // base 64 接口
    NSString *des_base64_en_string = [NSString des_base64_encryptedStringWithData:[string dataUsingEncoding:NSUTF8StringEncoding] key:key];
    NSString *des_base64_de_string = [NSString des_base64_decryptedStringWithData:[des_base64_en_string dataUsingEncoding:NSUTF8StringEncoding] key:key];
    NSLog(@"1:%d", [des_enString isEqualToString:des_base64_en_string]);
    NSLog(@"2:%d", [des_deString isEqualToString:string]);
    NSLog(@"3:%d", [des_base64_de_string isEqualToString:string]);

}

- (void)testaes128 {
    NSString *aeskey = @"N76$Yyl5AwP8yaWb";
    // AES 128
    // string data -> aes data
    NSData *aes128Data1 = [NSString aes128_encryptedDataWithData:[string dataUsingEncoding:NSUTF8StringEncoding] key:aeskey];
    // aes data -> base 64 string
    NSString *aes128_enString = [NSString base64_encryptedStringWith:aes128Data1];
    // aes data <- base 64 string
    NSData *aes128Data2 = [NSString base64_decryptedDataWith:aes128_enString];
    // string data <- aes data
    NSString *aes128_deString = [[NSString alloc] initWithData:[NSString aes128_decryptedDataWithData:aes128Data2 key:aeskey] encoding:NSUTF8StringEncoding];
    
    //NSLog(@"aes128_enString:%@", aes128_enString);
    //NSLog(@"aes128_deString:%@", aes128_deString);
    
    // base 64 接口
    NSString *aes_base64_en_string = [NSString aes128_base64_encryptedStringWithData:[string dataUsingEncoding:NSUTF8StringEncoding] key:aeskey];
    NSString *aes_base64_de_string = [NSString aes128_base64_decryptedStringWithData:[aes_base64_en_string dataUsingEncoding:NSUTF8StringEncoding] key:aeskey];
    NSLog(@"1:%d", [aes128_enString isEqualToString:aes_base64_en_string]);
    NSLog(@"2:%d", [aes128_deString isEqualToString:string]);
    NSLog(@"3:%d", [aes_base64_de_string isEqualToString:string]);

}

- (void)testaes256 {
    NSString *aeskey = @"N76$Yyl5AwP8yaWb";

    // AES 256
    // string data -> aes data
    NSData *aes256Data1 = [NSString aes256_encryptedDataWithData:[string dataUsingEncoding:NSUTF8StringEncoding] key:aeskey];
    // aes data -> base 64 string
    NSString *aes256_enString = [NSString base64_encryptedStringWith:aes256Data1];
    // aes data <- base 64 string
    NSData *aes256Data2 = [NSString base64_decryptedDataWith:aes256_enString];
    // string data <- aes data
    NSString *aes256_deString = [[NSString alloc] initWithData:[NSString aes256_decryptedDataWithData:aes256Data2 key:aeskey] encoding:NSUTF8StringEncoding];
    
    //NSLog(@"aes256_enString:%@", aes256_enString);
    //NSLog(@"aes256_deString:%@", aes256_deString);
    
    // base 64 接口
    NSString *aes_base64_en_string = [NSString aes256_base64_encryptedStringWithData:[string dataUsingEncoding:NSUTF8StringEncoding] key:aeskey];
    NSString *aes_base64_de_string = [NSString aes256_base64_decryptedStringWithData:[aes_base64_en_string dataUsingEncoding:NSUTF8StringEncoding] key:aeskey];
    NSLog(@"1:%d", [aes256_enString isEqualToString:aes_base64_en_string]);
    NSLog(@"2:%d", [aes256_deString isEqualToString:string]);
    NSLog(@"3:%d", [aes_base64_de_string isEqualToString:string]);

}

- (void)testhmacSHA1 {
    NSString *shakey = @"N76$Yyl5AwP8yaWb";
    
    // HmacSHA1
    // string data -> sha data
    NSData *shaData1 = [NSString hmacSHA1_dataWithString:string key:shakey];
    // sha data -> base 64 string
    NSString *sha_enString = [NSString base64_encryptedStringWith:shaData1];
    
    //NSLog(@"sha_enString:%@", sha_enString);
    
    // base 64 接口
    NSString *sha_base64_string = [NSString hmacSHA1_base64_stringWithString:string key:shakey];
    NSLog(@"1:%d", [sha_enString isEqualToString:sha_base64_string]);
}


@end

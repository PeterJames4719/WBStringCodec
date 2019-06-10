//
//  NSString+URL.h
// 
//
//  Created by 兵伍 on 2018/4/9.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(URL)

- (NSURL *)decodedURL;
- (NSURL *)encodedURL;
- (NSString *)decodedURLString;
- (NSString *)encodedURLString;

- (NSString *)encodedURLStringCustom;

- (NSDictionary *)urlQueryParameters;
@end

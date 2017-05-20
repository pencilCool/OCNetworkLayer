//
//  BackendAuth.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BackendAuth : NSObject

+ (instancetype)shared;

- (instancetype)initWithDefaults:(NSUserDefaults *)defaluts;

- (void)setToken:(NSString *)token;
- (NSString *)token;
- (void) deleteToken;
@end

//
//  BackendAuth.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "BackendAuth.h"
static NSString *const BackendAuthToken = @"BackendAuthToken";

@interface BackendAuth()
@property (nonatomic, strong) NSUserDefaults *defaults;
@end


@implementation BackendAuth

+ (instancetype)shared
{
    static BackendAuth *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [BackendAuth new];
    });
    return shared;
}

- (instancetype)initWithDefaults:(NSUserDefaults *)defaluts
{
    if (self = [super init]) {
        self.defaults =  defaluts;
    }
    return self;
}
- (void)setToken:(NSString *)token
{
    [self.defaults setValue:token forKey:BackendAuthToken];
}

- (NSString *)token
{
    return [self.defaults valueForKey:BackendAuthToken];
}

- (void)deleteToken
{
    [self.defaults removeObjectForKey:BackendAuthToken];
}
@end

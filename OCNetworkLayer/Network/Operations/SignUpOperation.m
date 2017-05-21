//
//  SignUpOperation.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/21.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignUpOperation.h"
#import "UserResponseMapper.h"
@interface SignUpOperation ()

@property (nonatomic, strong) SignUpRequest *request;

@end


@implementation SignUpOperation

- (instancetype)initWithUser:(UserItem *)user password:(NSString *)password {
    
    if (self = [super init]) {
        self.request = [[SignUpRequest alloc] initWithUser:user password:password];
    }
    return self;
}

- (void)start {
    [super start];
    [self.service requestWith:self.request success:^(id response) {
        UserItem *item = [UserResponseMapper process:response];
    } failure:^(NSError *error) {
        
    }];
}
@end

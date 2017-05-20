//
//  SignInOperation.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignInOperation.h"
#import "SignInRequest.h"
@interface SignInOperation ()

@property (nonatomic, strong) SignInRequest *request;

@end

@implementation SignInOperation

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password
{
    if (self = [super init]) {
        self.request= [[SignInRequest alloc] initWithEmail:email password:password];
    }
    return self;
}

- (void)start
{
    [super start];
    [self.service requestWith:self.request success:^(id obj){
        
    }failure:^(NSError *error){
        
    }];
}


@end

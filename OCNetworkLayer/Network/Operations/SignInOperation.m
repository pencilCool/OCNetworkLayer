//
//  SignInOperation.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignInOperation.h"
#import "SignInRequest.h"
#import "SignInItem.h"
#import "SignInResponseMapper.h"
#import "NSError+Failure.h"
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
        
        @try {
            SignInItem *item = [SignInResponseMapper process:obj];
            if (self.sigInSuccess) {
                self.sigInSuccess(item);
            }
           
        } @catch (NSException *exception) {
            self.sigInFailure([NSError cannotParseResponse]);
        } @finally {
             [self finish];
        }
        
        
    }failure:^(NSError *error){
        self.sigInFailure(error);
        [self finish];
    }];
}


@end

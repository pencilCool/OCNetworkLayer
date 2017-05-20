//
//  SignInOperation.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ServiceOperation.h"
@class SignInItem;

@interface SignInOperation : ServiceOperation

@property (nonatomic,copy) void (^success)(SignInItem *);
@property (nonatomic,copy) void (^failure)(NSError *);

- (instancetype)initWithEmail:(NSString *)email password: (NSString *)password;
@end

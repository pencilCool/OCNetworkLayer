//
//  SignUpOperation.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/21.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ServiceOperation.h"
#import "SignUpRequest.h"

typedef void (^SigUpSuccess)(UserItem *);
typedef void (^SigUpFailure)(NSError *);

@interface SignUpOperation : ServiceOperation


@property (nonatomic,copy) SigUpSuccess success;
@property (nonatomic,copy) SigUpFailure failure;

- (instancetype)initWithUser:(UserItem *)user password: (NSString *)password;
@end

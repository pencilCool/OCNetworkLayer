//
//  SignUpRequest.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackendAPIRequest.h"

#import "UserItem.h"

@interface SignUpRequest : NSObject<BackendAPIRequest>

- (instancetype)initWithUser:(UserItem *)user password:(NSString *)password;

@end

//
//  SignUpRequest.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackendAPIRequest.h"
@interface SignInRequest : NSObject<BackendAPIRequest>


- (instancetype) initWithEmail:(NSString *)email password: (NSString *)password;

@end

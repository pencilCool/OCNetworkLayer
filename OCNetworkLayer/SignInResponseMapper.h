//
//  SignInResponseMapper.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseMapper.h"


@interface SignInResponseMapper : ResponseMapper<ResponseMapperProtocol>
- (id)process:(id)obj;
@end

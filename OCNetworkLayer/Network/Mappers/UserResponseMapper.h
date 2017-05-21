//
//  UserResponseMapper.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/21.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ResponseMapper.h"

@interface UserResponseMapper : ResponseMapper<ResponseMapperProtocol>

+ (id)process:(id)obj;
@end

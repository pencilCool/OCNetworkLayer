//
//  SignInItem.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/20.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParsedItem.h"

@interface SignInItem : NSObject<ParsedItem>
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *uniqueId;
- (instancetype)initWithToken:(NSString *)token uniqueId: (NSString *)uniqueId;
@end

//
//  SignInResponseMapper.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignInResponseMapper.h"
#import "SignInItem.h"
//TypeName blockName = ^returnType(parameters) {...};
// http://fuckingblocksyntax.com/


@implementation SignInResponseMapper
- (id)process:(id)obj
{
    // id<ParsedItem> (^Parse)(NSDictionary <NSString *,id>*);
    Parse signInResponseRarse = ^id<ParsedItem>(NSDictionary *json){
        NSParameterAssert(json);
        @try {
            NSString *token = json[@"token"];
            NSString *uniqueId = json[@"unique_id"];
            if (token && uniqueId) {
                return [[SignInItem alloc] initWithToken:token uniqueId:uniqueId];
            }
            return nil;
        } @catch (NSException *exception) {
            
        }
    };
    return  [SignInResponseMapper process:obj parse:signInResponseRarse];
}
@end

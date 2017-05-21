//
//  UserResponseMapper.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/21.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "UserResponseMapper.h"
#import "UserItem.h"
@implementation UserResponseMapper

+ (id)process:(id)obj {
    Parse userResponseParse = ^id<ParsedItem>(NSDictionary *json) {
        @try {
            NSString *uniqueId = json[@"unique_id"];
            NSString *firstName = json[@"first_name"];
            NSString *lastName = json[@"last_name"];
            NSString *email = json[@"email"];
            NSString *phoneNumber = json[@"phone_number"];
            if (uniqueId && firstName && lastName && email) {
                return [[UserItem alloc] initWithUniqueId:uniqueId firstName:firstName lastName:lastName email:email phoneNumber:phoneNumber];
            }
            return  nil;
        } @catch (NSException *exception) {
            
        }
    };
    
    return [UserResponseMapper process:obj parse:userResponseParse];
}
@end

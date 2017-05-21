//
//  UserItem.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParsedItem.h"
@interface UserItem : NSObject<ParsedItem>
@property (nonatomic, strong, readonly) NSString *uniqueId;
@property (nonatomic, strong, readonly) NSString *firstName;
@property (nonatomic, strong, readonly) NSString *lastName;
@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *phoneNumber;

- (instancetype) initWithUniqueId: (NSString *)uniqueId firstName: (NSString *)firstName lastName: (NSString *)lastName email: (NSString *)email phoneNumber: (NSString *)phoneNumber;
@end

//
//  ResponseMapper.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParsedItem.h"

@protocol ResponseMapperProtocol
- (id)process:(id)obj;
@end

//internal enum ResponseMapperError: Error {
//case invalid
//case missingAttribute
//}
@class ResponseMapperError;
@interface ResponseMapperError:NSError
+ (ResponseMapperError *)invalid;
+ (ResponseMapperError *)missingAttribute;
@end ;

typedef id<ParsedItem> (^Parse)(NSDictionary <NSString *,id>*);

@interface ResponseMapper: NSObject
+ (id<ParsedItem>)process: (id)obj parse:(Parse)parse;
@end

//
//  ResponseMapper.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ResponseMapper.h"


@implementation ResponseMapperError

+ (ResponseMapperError *)invalid {
    return (ResponseMapperError *)[NSError errorWithDomain:@"ResponseMapperError" code:0 userInfo:nil];
}

+ (ResponseMapperError *)missingAttribute {
   return (ResponseMapperError *)[NSError errorWithDomain:@"ResponseMapperError" code:1 userInfo:nil];
}
@end ;

@implementation ResponseMapper


+ (id<ParsedItem>)process: (id)obj parse:(Parse)parse
{
    NSParameterAssert(obj);
    if (![obj isKindOfClass:[NSDictionary class]]) {
        @throw [ResponseMapperError invalid];
    }
    
    id<ParsedItem> item;
    
    if (parse) {
       item =  parse(obj);
        return item;
    }else{
        @throw [ResponseMapperError missingAttribute];
    }
}
@end

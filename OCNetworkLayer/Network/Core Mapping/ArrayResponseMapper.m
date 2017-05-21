//
//  ArrayResponseMapper.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/20.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ArrayResponseMapper.h"

@implementation ArrayResponseMapper


+ (NSArray *) process:(id)json mapper: (Mapper)mapper
{
    NSParameterAssert(json);
    if (![json isKindOfClass:[NSDictionary class]]) {
        @throw [ResponseMapperError invalid];
    }
    NSMutableArray *items = [NSMutableArray array];
    for (id jsonNode in json) {
        id<ParsedItem> item = mapper(jsonNode);
        [items addObject:item];
    }
    return items;
}
@end

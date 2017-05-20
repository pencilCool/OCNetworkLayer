//
//  ArrayResponseMapper.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/20.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseMapper.h"
#import "ParsedItem.h"
@interface ArrayResponseMapper : NSObject
//final class ArrayResponseMapper<A: ParsedItem> {
//    static func process(obj: AnyObject?, mapper: (AnyObject? throws -> A)) throws -> [A] {
//        guard let json = obj as? [[String: AnyObject]] else { throw ResponseMapperError.Invalid }
//        
//        var items = [A]()
//        for jsonNode in json {
//            let item = try mapper(jsonNode)
//            items.append(item)
//        }
//        return items
//    }
//}
typedef id<ParsedItem> (^Mapper)(id);

+ (NSArray *) process:(id)json mapper: (Mapper)mapper;

@end

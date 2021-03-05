//
//  NSArray+Utils.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

/**
 * 回傳第一個元素
 */
- (id) firstObject
{
    if ([self isNotEmpty])
    {
        return self[0];
    }
    else
    {
        return nil;
    }
}

/**
 * 是否為空陣列
 */
- (BOOL) isEmpty
{
    return (self.count == 0);
}

- (BOOL) isNotEmpty
{
    return ![self isEmpty];
}
@end

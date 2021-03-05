//
//  User.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "User.h"

@implementation User
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = isNotNullValue(dic[@"name"]) ? dic[@"name"] : @"";
        self.kokoid = isNotNullValue(dic[@"kokoid"]) ? dic[@"kokoid"] : @"";
    }
    return self;
}
@end

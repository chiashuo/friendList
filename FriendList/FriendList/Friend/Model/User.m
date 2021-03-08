//
//  User.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "User.h"

@implementation User
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *userArray = [dictionary objectForKey:@"response"];
        if (isNotNullValue(userArray) && userArray.count > 0){
            NSDictionary *userRawData = isNotNullValue(userArray.firstObject) ? userArray.firstObject : @{};
            self.name = isNotNullValue(userRawData[@"name"]) ? userRawData[@"name"] : @"";
            self.kokoid = isNotNullValue(userRawData[@"kokoid"]) ? userRawData[@"kokoid"] : @"";
        }else{
            self.name = @"";
            self.kokoid = @"";
        }
    }
    return self;
}
@end

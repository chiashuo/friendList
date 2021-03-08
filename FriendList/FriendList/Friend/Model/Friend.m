//
//  Friend.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "Friend.h"

@implementation Friend
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.name = isNotNullValue(dictionary[@"name"]) ? dictionary[@"name"] : @"";
        self.friendStatus = isNotNullValue(dictionary[@"status"]) ? [dictionary[@"status"] intValue] : 4;
        self.isTop = isNotNullValue(dictionary[@"isTop"]) ? [dictionary[@"isTop"] boolValue] : NO;
        self.fid = isNotNullValue(dictionary[@"fid"]) ? dictionary[@"fid"] : @"";
        self.updateDate = isNotNullValue(dictionary[@"updateDate"]) ? dictionary[@"updateDate"] : @"";
        self.updateDate = [self.updateDate stringByReplacingOccurrencesOfString:@"/" withString:@""];
    }
    return self;
}
- (BOOL)isNewestFriendThan:(Friend *)friendObj {
    
    NSString *formatString = @"yyyyMMdd";
    NSDate *originalFriendDate = [self.updateDate dateWithFormatString: formatString];
    NSDate *duplicateFriendDate = [friendObj.updateDate  dateWithFormatString:formatString];
    return [originalFriendDate compare:duplicateFriendDate] == NSOrderedDescending;
}
@end

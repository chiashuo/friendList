//
//  NSString+Utils.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)
- (NSDate *)dateWithFormatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter dateFromString:self];
}
- (BOOL) canFindSubString:(NSString *)subString {
    return [self rangeOfString:subString].location != NSNotFound;
}

- (BOOL) cannotFindSubString:(NSString *)subString {
    return ![self canFindSubString:subString];
}

- (BOOL) isEmpty
{
    return self.length == 0;
}

- (BOOL) isNotEmpty
{
    return ![self isEmpty];
}
@end

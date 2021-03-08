//
//  NSString+Utils.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Utils)

/// 字串轉為指定格式的NSDate
/// @param formatString 時間格式
- (NSDate *)dateWithFormatString:(NSString *)formatString;
- (BOOL) canFindSubString:(NSString *)subString;
- (BOOL) cannotFindSubString:(NSString *)subString;
- (BOOL) isEmpty;
- (BOOL) isNotEmpty;
@end

NS_ASSUME_NONNULL_END

//
//  UIColor+HexString.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *) hex;
+ (UIColor *)colorWithHexString:(NSString *) hex withAlpha:(CGFloat) alpha;
+ (UIColor *)colorWithR:(CGFloat)RedValue G:(CGFloat)GreenValue B:(CGFloat)BlueValue;
+ (UIColor *)colorWithR:(CGFloat)RedValue G:(CGFloat)GreenValue B:(CGFloat)BlueValue andAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END

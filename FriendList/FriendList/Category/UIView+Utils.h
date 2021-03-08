//
//  UIView+Utils.h
//  FriendList
//
//  Created by Johnny on 2021/3/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utils)

/// 加邊框
/// @param borderColor 顏色
/// @param borderWidth 粗細
/// @param cornerRadius 圓角
- (void)addBorderWithColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;

/// 陰影
/// @param color 陰影的顏色
- (void)addGlowEffect:(UIColor *)color;

/// 對superView做填滿的 autolayout
- (void)layoutAttachAll;
@end

NS_ASSUME_NONNULL_END

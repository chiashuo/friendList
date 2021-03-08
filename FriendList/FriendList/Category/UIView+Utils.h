//
//  UIView+Utils.h
//  FriendList
//
//  Created by Johnny on 2021/3/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utils)
- (void)addBorderWithColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;
- (void)addGlowEffect;
- (void)layoutAttachAll;
@end

NS_ASSUME_NONNULL_END

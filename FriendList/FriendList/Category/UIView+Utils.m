//
//  UIView+Utils.m
//  FriendList
//
//  Created by Johnny on 2021/3/6.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (void)addBorderWithColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth
              cornerRadius:(CGFloat)cornerRadius {
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}
@end

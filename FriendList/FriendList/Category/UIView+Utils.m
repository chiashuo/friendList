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

- (void)addGlowEffect:(UIColor *)color {
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 3.0;
    self.layer.shadowColor = color.CGColor;
}

- (void)layoutAttachAll {
    [self layoutAttachTop];
    [self layoutAttachLeading];
    [self layoutAttachBottom];
    [self layoutAttachTrailing];
}
- (void)layoutAttachTop {
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.superview
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:0];
    [self.superview addConstraint:constraint];
}
- (void)layoutAttachLeading {
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.superview
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0
                                                                   constant:0];
    [self.superview addConstraint:constraint];
}
- (void)layoutAttachBottom {
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.superview
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:0];
    [self.superview addConstraint:constraint];
}
- (void)layoutAttachTrailing {
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.superview
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0
                                                                   constant:0];
    [self.superview addConstraint:constraint];
}
@end

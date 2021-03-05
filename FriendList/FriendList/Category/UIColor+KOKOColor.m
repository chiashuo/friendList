//
//  UIColor+KOKOColor.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "UIColor+KOKOColor.h"
#import "UIColor+HexString.h"

@implementation UIColor (KOKOColor)
+ (UIColor *)steel {
    return [UIColor colorWithHexString:@"8E8E93"];
}
+ (UIColor *)hotPink {
    return [UIColor colorWithHexString:@"EC008C"];
}
+ (UIColor *)softPink {
    return [UIColor colorWithHexString:@"F9B2DC"];
}
+ (UIColor *)greyishBrown {
    return [UIColor colorWithHexString:@"474747"];
}
+ (UIColor *)steel12 {
    return [UIColor colorWithHexString:@"8E8E8E" withAlpha:0.12];
}

+ (UIColor *)veryLightPinkTwo {
    return [UIColor colorWithHexString:@"C9C9C9"];
}

+ (UIColor *)brownGrey {
    return [UIColor colorWithHexString:@"999999"];
}

@end

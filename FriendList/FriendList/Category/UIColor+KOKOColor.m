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

+ (UIColor *)frogGreen {
    return [UIColor colorWithHexString:@"56b30b"];
}
+ (UIColor *)lightOliveGreen {
    return [UIColor colorWithHexString:@"a6cc42"];
}
+ (UIColor *)black10 {
    return [UIColor colorWithHexString:@"000000" withAlpha:0.1];
}
+ (UIColor *)appleGreen40 {
    return [UIColor colorWithHexString:@"79c41b" withAlpha:0.4];
}
+ (UIColor *)whiteTwo {
    return [UIColor colorWithHexString:@"fcfcfc"];
}
@end

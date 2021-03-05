//
//  UIColor+HexString.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "UIColor+HexString.h"

@implementation UIColor (HexString)

+ (UIColor *) colorWithHexString:(NSString *) hex
{
    return [UIColor colorWithHexString:hex withAlpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *) hex withAlpha:(CGFloat) alpha
{
    NSString* cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor grayColor];
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString* rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString* gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString* bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat) r / 255.0f)
                           green:((CGFloat) g / 255.0f)
                            blue:((CGFloat) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithR:(CGFloat)RedValue G:(CGFloat)GreenValue B:(CGFloat)BlueValue
{
    return [self colorWithR:RedValue G:GreenValue B:BlueValue andAlpha:1.0f];
}

+ (UIColor *)colorWithR:(CGFloat)RedValue G:(CGFloat)GreenValue B:(CGFloat)BlueValue andAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((CGFloat) RedValue / 255.0f)
                           green:((CGFloat) GreenValue / 255.0f)
                            blue:((CGFloat) BlueValue / 255.0f)
                           alpha:alpha];
}

@end

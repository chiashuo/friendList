//
//  UITableViewCell+Utils.m
//  FriendList
//
//  Created by Johnny on 2021/3/6.
//

#import "UITableViewCell+Utils.h"

@implementation UITableViewCell (Utils)
+ (NSString *)identifier {
    
    return [NSString stringWithFormat:@"%@Identifier", NSStringFromClass([self class])];
}
+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end

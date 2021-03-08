//
//  FriendListSharedClass.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/7.
//

#import "FriendListSharedClass.h"

@implementation FriendListSharedClass
+(instancetype)sharedInstance {
    static FriendListSharedClass *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FriendListSharedClass alloc] init];
    });
    return instance;
}
- (NSString *)getApiDomain {
    return @"https://dimanyen.github.io";
}
@end

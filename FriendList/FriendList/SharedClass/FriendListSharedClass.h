//
//  FriendListSharedClass.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define kAPIDomain          [[FriendListSharedClass sharedInstance] getApiDomain]

#define kApiUrlUserInfo     [NSString stringWithFormat:@"%@/man.json", kAPIDomain]          /// 使用者資料
#define kApiUrlFriend1      [NSString stringWithFormat:@"%@/friend1.json", kAPIDomain]      /// 好友列表1
#define kApiUrlFriend2      [NSString stringWithFormat:@"%@/friend2.json", kAPIDomain]      /// 好友列表2
#define kApiUrlFriend3      [NSString stringWithFormat:@"%@/friend3.json", kAPIDomain]      /// 好友列表含邀請列表
#define kApiUrlFriend4      [NSString stringWithFormat:@"%@/friend4.json", kAPIDomain]      /// 無資料邀請/好友列表

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

@interface FriendListSharedClass : NSObject

+(instancetype)sharedInstance;

- (NSString *)getApiDomain;
@end

NS_ASSUME_NONNULL_END

//
//  Friend.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, FriendStatus) {
    
    FriendStatusInviting = 0,     //! 送出邀請
    
    FriendStatusCanTransfer,      //! 可轉帳
    
    FriendStatusInvitation,       //! 邀請
    
    FriendStatusUnknow
};

@interface Friend : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) FriendStatus friendStatus;
@property (assign, nonatomic) BOOL isTop;
@property (strong, nonatomic) NSString *fid;
@property (strong, nonatomic) NSString *updateDate;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (BOOL)isNewestFriendThan:(Friend *)friendObj;
@end

NS_ASSUME_NONNULL_END

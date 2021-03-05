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
    
    FriendStatusCanTransfer,      //! 好友
    
    TabBarItemTagKOKO,          //! KOKO
    
    TabBarItemTagTrack,         //! 記帳
    
    TabBarItemTagSetting,       //! 設定
    
    TabBarItemTagUnKnow
};
@interface Friend : NSObject

@end

NS_ASSUME_NONNULL_END

//
//  FriendListViewModel.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/7.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "FriendCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FriendCategory) {
    FriendCategoryFriend = 0,       /// !好友
    FriendCategoryChat,             /// !聊天
};

@protocol FriendListUpdateDelegate <NSObject>

/// 更新User的相關UI
/// @param user 使用者資料
- (void)willUpdateUserProfile:(User *)user;

/// 更新好友清單
- (void)willUpdateFriendList;

/// 顯示無好友的狀態
- (void)shouldShowEmptyResultView;
@end
@interface FriendListViewModel : NSObject

@property (weak, nonatomic) id <FriendListUpdateDelegate> friendListUpdateDelegate;
@property (strong, nonatomic) NSMutableArray<FriendCellViewModel *> *feeds;
@property (assign, nonatomic) NSInteger invitationsCount;
@property (assign, nonatomic) FriendCategory category;
@property (assign, nonatomic) BOOL isInvitationExpand;

/// Public Method
- (instancetype)initWithDelegate:(id)delegate;
- (void)bind;

/// 搜尋好友
/// @param keyword 關鍵字
- (void)seachFriendByKeyword:(NSString *)keyword;

/// 取得誰送給你好友的物件
- (NSArray<Friend *> *)getFriendInvitations;

/// 顯示對應的好友清單
/// @param category FriendCategory
- (void)showFreindListByCategory:(FriendCategory)category;

/// 按下確認或者移除邀請
/// @param fid 好友的ID
- (void)removeInvitationByFid:(NSString *)fid;

@end

NS_ASSUME_NONNULL_END

//
//  FriendInvitationViewModel.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import <Foundation/Foundation.h>
#import "FriendInvitationCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol FriendInvitationUpdateDelegate <NSObject>

/// 更新好友邀請UI
- (void)willUpdateFriendInvitationView;

@end

@interface FriendInvitationViewModel : NSObject

- (instancetype)initWithDelegate:(id)delegate;
- (void)bind:(NSArray <Friend *> *)friends;

/// 確認或刪除
/// @param index 哪個位置
- (void)invitationDidAction:(NSInteger)index;

@property (weak, nonatomic) id <FriendInvitationUpdateDelegate> friendInvitationUpdateDelegate;
@property (strong, nonatomic) NSMutableArray<FriendInvitationCellViewModel *> *feeds;

/// 邀請是否展開
@property (assign, nonatomic) BOOL isExpand;
@end

NS_ASSUME_NONNULL_END

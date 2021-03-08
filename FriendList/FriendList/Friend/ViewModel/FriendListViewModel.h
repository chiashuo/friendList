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

- (void)willUpdateUserProfile:(User *)user;
- (void)willUpdateFriendList;
@end
@interface FriendListViewModel : NSObject

@property (weak, nonatomic) id <FriendListUpdateDelegate> friendListUpdateDelegate;
@property (strong, nonatomic) NSMutableArray<FriendCellViewModel *> *feeds;
@property (assign, nonatomic) NSInteger invitationsCount;
@property (assign, nonatomic) FriendCategory category;

/// Public Method
- (instancetype)initWithDelegate:(id)delegate;
- (void)bind;
- (void)seachFriendByKeyword:(NSString *)keyword;
- (NSArray<Friend *> *)getFriendInvitations;
- (void)showFreindListByCategory:(FriendCategory)category;

@end

NS_ASSUME_NONNULL_END

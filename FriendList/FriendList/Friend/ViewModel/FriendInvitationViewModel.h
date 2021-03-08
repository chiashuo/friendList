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

- (void)willUpdateFriendInvitationView;

@end

@interface FriendInvitationViewModel : NSObject

- (instancetype)initWithDelegate:(id)delegate;
- (void)bind:(NSArray <Friend *> *)friends;

@property (weak, nonatomic) id <FriendInvitationUpdateDelegate> friendInvitationUpdateDelegate;
@property (strong, nonatomic) NSMutableArray<FriendInvitationCellViewModel *> *feeds;
@property (assign, nonatomic) BOOL isExpand;
@end

NS_ASSUME_NONNULL_END

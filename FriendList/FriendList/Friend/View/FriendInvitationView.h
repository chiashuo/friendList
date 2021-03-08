//
//  FriendInvitationView.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendInvitationView : UIView
+ (id)initFriendInvitationView;
- (void)bind:(NSArray <Friend *> *)friendInvitations;
@end

NS_ASSUME_NONNULL_END

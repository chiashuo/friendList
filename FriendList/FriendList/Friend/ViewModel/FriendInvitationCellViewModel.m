//
//  FriendInvitationCellViewModel.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "FriendInvitationCellViewModel.h"

@implementation FriendInvitationCellViewModel
- (instancetype)initWithFriend:(Friend *)friend {
    self = [super init];
    if (self) {
        self.avatar = @"imgFriendsList";
        self.name = friend.name;
        self.message = @"邀請你成為好友：）";
        self.isFakeCardShow = false;
    }
    return self;
}
@end

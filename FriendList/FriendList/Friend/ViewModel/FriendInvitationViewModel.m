//
//  FriendInvitationViewModel.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "FriendInvitationViewModel.h"
#import "Friend.h"

@implementation FriendInvitationViewModel

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        self.friendInvitationUpdateDelegate = delegate;
        self.feeds = [[NSMutableArray alloc] init];
        self.isExpand = NO;
    }
    return self;
}
- (void)bind:(NSArray <Friend *> *)friends{
    
    [self.feeds removeAllObjects];
    
    [friends enumerateObjectsUsingBlock:^(Friend * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.friendStatus == FriendStatusInvitation){
            FriendInvitationCellViewModel *feed = [[FriendInvitationCellViewModel alloc] initWithFriend: obj];
            //只有第一個且超過一則邀情才會有蓋在下面的那張卡
            if (idx == 0 && friends.count > 1){
                feed.isFakeCardShow = true;
            }
            [self.feeds addObject:feed];
        }
    }];
    
    
    if (isNotNullValue(self.friendInvitationUpdateDelegate)) {
        if ([self.friendInvitationUpdateDelegate respondsToSelector:@selector(willUpdateFriendInvitationView)]){
            [self.friendInvitationUpdateDelegate willUpdateFriendInvitationView];
        }
    }
}
- (void)invitationDidAction:(NSInteger)index {
    [[NSNotificationCenter defaultCenter] postNotificationName:kFriendInvitationDidAction object:[NSString stringWithFormat:@"%ld", index]];
    
    if (isNotNullValue(self.friendInvitationUpdateDelegate)) {
        if ([self.friendInvitationUpdateDelegate respondsToSelector:@selector(willUpdateFriendInvitationView)]){
            [self.friendInvitationUpdateDelegate willUpdateFriendInvitationView];
        }
    }
}
@end

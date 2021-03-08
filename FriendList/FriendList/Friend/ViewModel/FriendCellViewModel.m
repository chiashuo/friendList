//
//  FriendCellViewModel.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "FriendCellViewModel.h"

@implementation FriendCellViewModel
- (instancetype)initWithFriend:(Friend *)friend {
    self = [super init];
    if (self) {
        self.friendStatus = friend.friendStatus;
        self.isStarShown = friend.isTop;
        self.name = friend.name;
        self.avatar = @"imgFriendsList";
    }
    return self;
}
@end

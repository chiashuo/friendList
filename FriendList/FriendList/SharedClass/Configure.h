//
//  Configure.h
//  FriendList
//
//  Created by Johnny on 2021/3/4.
//

#ifndef Configure_h
#define Configure_h

typedef NS_ENUM(NSInteger, ResultCode) {

    ResultCodeWrongOwnDefinition = -1002
};

typedef NS_ENUM(NSInteger, LayoutType) {
    LayoutTypeNoFriend,
    LayoutTypeFriendWithInvitation,
    LayoutTypeFriendWithoutInvitation
};

static NSString * const kFriendInvitationViewExpandStatusChanged = @"kFriendInvitationViewExpandStatusChanged";
static NSString * const kFriendInvitationDidAction = @"kFriendInvitationDidAction";
#endif /* Configure_h */

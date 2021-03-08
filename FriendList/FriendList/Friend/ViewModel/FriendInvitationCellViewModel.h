//
//  FriendInvitationCellViewModel.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendInvitationCellViewModel : NSObject
- (instancetype)initWithFriend:(Friend *)friend;
@property (assign, nonatomic) BOOL isFakeCardShow;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *message;
@end

NS_ASSUME_NONNULL_END

//
//  FriendCellViewModel.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import <Foundation/Foundation.h>
#import "Friend.h"
NS_ASSUME_NONNULL_BEGIN

@interface FriendCellViewModel : NSObject
- (instancetype)initWithFriend:(Friend *)friend;
@property (assign, nonatomic) FriendStatus friendStatus;
@property (assign, nonatomic) BOOL isStarShown;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *avatar;

@end

NS_ASSUME_NONNULL_END

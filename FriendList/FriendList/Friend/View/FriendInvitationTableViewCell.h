//
//  FriendInvitationTableViewCell.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import <UIKit/UIKit.h>
#import "FriendInvitationCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol InvitationCellDelegate <NSObject>

- (void)willExpand;
- (void)confirmInvitation:(NSInteger)index;
- (void)deleteInvitation:(NSInteger)index;

@end
@interface FriendInvitationTableViewCell : UITableViewCell
@property (weak, nonatomic) id <InvitationCellDelegate> invitationCellDelegate;

- (void)configure:(FriendInvitationCellViewModel *)feed expend:(BOOL)isExpend;
@end

NS_ASSUME_NONNULL_END

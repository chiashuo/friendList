//
//  FriendTableViewCell.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FirendCellDelegate <NSObject>

- (void)shouldSendInvitation;
- (void)shouldTransfer;
- (void)shouldShowMore;

@end

@interface FriendTableViewCell : UITableViewCell

@property (weak, nonatomic) id <FirendCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

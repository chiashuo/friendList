//
//  FriendSearchView.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FriendSearchDelegate <NSObject>

- (void)didBegainEditing;
- (void)didEndEditing:(NSString *)content;

@end
@interface FriendSearchView : UIView
+ (id)initFriendSearchView;
@property (weak, nonatomic) id <FriendSearchDelegate> searchDelegate;
@end

NS_ASSUME_NONNULL_END

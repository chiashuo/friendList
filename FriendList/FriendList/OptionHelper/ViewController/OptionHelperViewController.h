//
//  OptionHelperViewController.h
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol OptionHelperDelegate <NSObject>

- (void)optionDidChanged;

@end
@interface OptionHelperViewController : BaseViewController
//@property(weak ,nonatomic) id <OptionHelperDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

//
//  AppDelegate.h
//  FriendList
//
//  Created by Johnny on 2021/3/4.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
+ (AppDelegate *) sharedAppDelegate;
@property (assign, nonatomic) LayoutType layoutType;
@property (nonatomic, strong) UIWindow *window;
- (void)setTabBarToRoot;
@end


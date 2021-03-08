//
//  TabBarViewController.m
//  FriendList
//
//  Created by Johnny on 2021/3/4.
//

#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "UIColor+HexString.h"
#import "FriendListViewController.h"
#import "OptionHelperViewController.h"

typedef NS_ENUM(NSInteger, MainTabBarItemTag) {
    
    TabBarItemTagMoney = 0,     //! 錢錢
    
    TabBarItemTagFriend,        //! 好友
    
    TabBarItemTagKOKO,          //! KOKO
    
    TabBarItemTagTrack,         //! 記帳
    
    TabBarItemTagSetting,       //! 設定
    
    TabBarItemTagMax,           //! Tab Bar Items count
};
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    [self setTabBarItem];

    // Do any additional setup after loading the view.
}

- (void)setUpTabBar {
    
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"EC008C"]} forState:UIControlStateSelected];
}

- (void)setTabBarItem {
    
    BaseViewController *moneyVC = [[BaseViewController alloc] init];
    BaseNavigationController *navMoney = [[BaseNavigationController alloc] initWithRootViewController:moneyVC];
    moneyVC.title = @"錢錢";
    UIImage *moneyImage = [[UIImage imageNamed:@"icTabbarProductsOff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [moneyVC.tabBarItem setImage:moneyImage];
    [moneyVC.tabBarItem setSelectedImage:moneyImage];
    
    FriendListViewController *friendVC = [[FriendListViewController alloc] initWithNibName:@"FriendListViewController" bundle:nil];
    friendVC.title = @"朋友";
    BaseNavigationController *navFriend = [[BaseNavigationController alloc] initWithRootViewController:friendVC];
    UIImage *friendImage = [[UIImage imageNamed:@"icTabbarFriendsOn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [friendVC.tabBarItem setImage:friendImage];
    [friendVC.tabBarItem setSelectedImage:friendImage];
    
    BaseViewController *kokoVC = [[BaseViewController alloc] init];
    BaseNavigationController *navKoko = [[BaseNavigationController alloc] initWithRootViewController:kokoVC];
    UIImage *kokoImage = [[UIImage imageNamed:@"icTabbarHomeOff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [kokoVC.tabBarItem setImage:kokoImage];
    [kokoVC.tabBarItem setSelectedImage:kokoImage];
    
    BaseViewController *trackVC = [[BaseViewController alloc] init];
    BaseNavigationController *navTrack = [[BaseNavigationController alloc] initWithRootViewController:trackVC];
    trackVC.title = @"記帳";
    UIImage *trackImage = [[UIImage imageNamed:@"icTabbarManageOff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [trackVC.tabBarItem setImage:trackImage];
    [trackVC.tabBarItem setSelectedImage:trackImage];
    
    BaseViewController *settingVC = [[BaseViewController alloc] init];
    BaseNavigationController *navSetting = [[BaseNavigationController alloc] initWithRootViewController:settingVC];
    UIImage *settingImage = [[UIImage imageNamed:@"icTabbarSettingOff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [settingVC.tabBarItem setImage:settingImage];
    [settingVC.tabBarItem setSelectedImage:settingImage];
    settingVC.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    
    NSArray<UIViewController *> *viewControlls = @[navMoney, navFriend, navKoko, navTrack, navSetting];
    
    [self setViewControllers:viewControlls];
    [self setSelectedIndex:TabBarItemTagFriend];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

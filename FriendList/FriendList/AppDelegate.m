//
//  AppDelegate.m
//  FriendList
//
//  Created by Johnny on 2021/3/4.
//

#import "AppDelegate.h"
#import "OptionHelperViewController.h"
#import "TabBarViewController.h"

@interface AppDelegate ()
@property (strong, nonatomic) OptionHelperViewController *opeionHelperVC;
@property (strong, nonatomic) TabBarViewController *mainTabBarVC;
@end

@implementation AppDelegate

+ (AppDelegate *) sharedAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initWindow];
    [self initOptionHelperVC];
    [self initTabBarVC];
    return YES;
}

- (void)initWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
}
- (void)initOptionHelperVC {
    self.opeionHelperVC = [[OptionHelperViewController alloc] initWithNibName:@"OptionHelperViewController" bundle:nil];
    [self.window setRootViewController: self.opeionHelperVC];
    [self.window makeKeyAndVisible];
}
- (void)initTabBarVC {
    UIStoryboard *tabBarStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.mainTabBarVC = [tabBarStroyboard instantiateViewControllerWithIdentifier:@"TabBarVC"];
}
- (void)setTabBarToRoot{
    [self.window setRootViewController: self.mainTabBarVC];
    [self.window makeKeyAndVisible];
}
@end

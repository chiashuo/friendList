//
//  OptionHelperViewController.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "OptionHelperViewController.h"
#import "AppDelegate.h"

@interface OptionHelperViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *typeButtons;

@end

@implementation OptionHelperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)noFriendButtonPressed:(id)sender {
    [AppDelegate sharedAppDelegate].layoutType = LayoutTypeNoFriend;
    [[AppDelegate sharedAppDelegate] setTabBarToRoot];
}
- (IBAction)friendWithInvitationButtonPressed:(id)sender {
    [AppDelegate sharedAppDelegate].layoutType = LayoutTypeFriendWithInvitation;
    [[AppDelegate sharedAppDelegate] setTabBarToRoot];
}
- (IBAction)friendWithoutInvitationButton:(id)sender {
    [AppDelegate sharedAppDelegate].layoutType = LayoutTypeFriendWithoutInvitation;
    [[AppDelegate sharedAppDelegate] setTabBarToRoot];
}

- (void)setupView {
    for (UIButton *typeButton in self.typeButtons) {
        [typeButton addBorderWithColor:[UIColor hotPink] borderWidth:1.2 cornerRadius:4];
    }
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

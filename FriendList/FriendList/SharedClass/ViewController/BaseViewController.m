//
//  BaseViewController.m
//  FriendList
//
//  Created by Johnny on 2021/3/4.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    [self initNavigationItem];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setUp {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.navigationController.navigationBar setHidden:YES];
    
}
- (void)initNavigationItem{
    [self initNavigationBarATMButton];
    [self initNavigationBarTransferButton];
    [self initNavigationBarScanButton];
}
- (void)initNavigationBarATMButton{
    UIButton *atmButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [atmButton setImage:[UIImage imageNamed:@"icNavPinkWithdraw"] forState:UIControlStateNormal];
    self.navigationBarATMButton = [[UIBarButtonItem alloc] initWithCustomView:atmButton];
}
- (void)initNavigationBarTransferButton{
    UIButton *transferButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [transferButton setImage:[UIImage imageNamed:@"icNavPinkTransfer"] forState:UIControlStateNormal];
    self.navigationBarTransferButton = [[UIBarButtonItem alloc] initWithCustomView:transferButton];
}
- (void)initNavigationBarScanButton{
    UIButton *scanButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [scanButton setImage:[UIImage imageNamed:@"icNavPinkScan"] forState:UIControlStateNormal];
    self.navigationBarScanButton = [[UIBarButtonItem alloc] initWithCustomView:scanButton];
}
#pragma mark - Orientation methods

/*
 有轉向要求的頁面需自己覆寫
 */
- (BOOL)shouldAutorotate{
    return false;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
@end

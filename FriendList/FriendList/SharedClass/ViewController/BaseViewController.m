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

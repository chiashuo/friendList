//
//  FriendListViewController.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "FriendListViewController.h"
#import "FriendSearchView.h"
#import "FriendTableViewCell.h"

@interface FriendListViewController () <UITableViewDataSource, FriendSearchDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *userIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userKokoIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendBadgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *chatBadgeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineChatCenterConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineFriendCenterConstraint;
@property (weak, nonatomic) IBOutlet UIButton *friendButton;
@property (weak, nonatomic) IBOutlet UIButton *chatButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userViewTopConstraint;

@end

@implementation FriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self registerCell];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - IBAction

- (IBAction)friendButtonDidPressed:(id)sender {
    self.bottomLineFriendCenterConstraint.priority = UILayoutPriorityDefaultHigh;
    self.bottomLineChatCenterConstraint.priority = UILayoutPriorityDefaultLow;
    [UIView animateWithDuration:0.33 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)chatButtonDidPressed:(id)sender {
    
    self.bottomLineFriendCenterConstraint.priority = UILayoutPriorityDefaultLow;
    self.bottomLineChatCenterConstraint.priority = UILayoutPriorityDefaultHigh;
    
    [UIView animateWithDuration:0.33 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - View Setting

- (void)setupView {
    self.friendBadgeLabel.layer.cornerRadius = 9;
    self.friendBadgeLabel.clipsToBounds = YES;
    self.friendBadgeLabel.text = @"2";
    self.chatBadgeLabel.layer.cornerRadius = 9;
    self.chatBadgeLabel.clipsToBounds = YES;
    self.chatBadgeLabel.text = @" 99+ ";
    [self initSearchTableHeader];
}

- (void)registerCell {
    [self.tableView registerNib:[FriendTableViewCell nib] forCellReuseIdentifier:[FriendTableViewCell identifier]];
}

- (void)initSearchTableHeader {
    FriendSearchView *searchView = [FriendSearchView initFriendSearchView];
    searchView.searchDelegate = self;
    [searchView setFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    [headerView addSubview:searchView];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - Private

- (void) needHideTopView:(BOOL)need {
    self.userViewTopConstraint.constant = need ? - self.topView.frame.size.height : 0.0;
    [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
    }];
}

#pragma mark - FriendSearchDelegate

- (void)didBegainEditing {
    
    [self needHideTopView:YES];
}
- (void)didEndEditing:(NSString *)content {
    
    [self needHideTopView:NO];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FriendTableViewCell identifier] forIndexPath:indexPath];
    return cell;
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

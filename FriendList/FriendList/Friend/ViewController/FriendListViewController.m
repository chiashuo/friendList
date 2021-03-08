//
//  FriendListViewController.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "FriendListViewController.h"
#import "FriendSearchView.h"
#import "FriendTableViewCell.h"
#import "FriendListViewModel.h"
#import "FriendInvitationView.h"
#import "EmptyResultView.h"

#define friendInvitationRowHeight 100
@interface FriendListViewController () <UITableViewDataSource, FriendSearchDelegate, FriendListUpdateDelegate>
/// ! IBOutlet
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
@property (weak, nonatomic) IBOutlet UIView *friendInvitationBaseView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *friendInvitationBaseViewHeight;

/// !Property
@property (strong, nonatomic) FriendListViewModel *viewModel;
@property (strong, nonatomic) FriendInvitationView *friendInvitationView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) EmptyResultView *emptyResultView;
@end

@implementation FriendListViewController
- (void)dealloc {
    NSLog(@"FriendListViewController dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kFriendInvitationViewExpandStatusChanged object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kFriendInvitationDidAction object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupNavigationBar];
    [self regiestNotificationObserver];
    [self registerCell];
    [self setupViewModel];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - IBAction

- (IBAction)friendButtonDidPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.bottomLineFriendCenterConstraint.priority = UILayoutPriorityDefaultHigh;
    self.bottomLineChatCenterConstraint.priority = UILayoutPriorityDefaultLow;
    [UIView animateWithDuration:0.33 animations:^{
        [self.view layoutIfNeeded];
    }];
    [self.viewModel showFreindListByCategory:FriendCategoryFriend];
}

- (IBAction)chatButtonDidPressed:(id)sender {
    
    self.bottomLineFriendCenterConstraint.priority = UILayoutPriorityDefaultLow;
    self.bottomLineChatCenterConstraint.priority = UILayoutPriorityDefaultHigh;
    
    [UIView animateWithDuration:0.33 animations:^{
        [self.view layoutIfNeeded];
    }];
    [self.viewModel showFreindListByCategory:FriendCategoryChat];
}

#pragma mark - View Setting

- (void)setupView {
    self.friendBadgeLabel.layer.cornerRadius = 9;
    self.friendBadgeLabel.clipsToBounds = YES;
    [self.friendBadgeLabel setHidden:YES];
    self.chatBadgeLabel.layer.cornerRadius = 9;
    self.chatBadgeLabel.clipsToBounds = YES;
    self.chatBadgeLabel.text = @" 99+ ";
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self initFriendInvitationView];
    [self initRefreshControl];
    
}
-(void)setupNavigationBar {
    //如果直接設navigationBarTintColor的話會因為透明度導致有色差，故先設一個空白的background在設定顏色
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //移除Bar下面的那條線
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setHidden:NO];
    //bar item
    self.navigationItem.leftBarButtonItems = @[self.navigationBarATMButton, self.navigationBarTransferButton];
    self.navigationItem.rightBarButtonItem = self.navigationBarScanButton;
    self.navigationItem.titleView = [[UIView alloc] init];
    //Bar的底色
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteTwo]];
    self.navigationController.navigationBar.translucent = NO;
    
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
- (void)initFriendInvitationView {
    self.friendInvitationView = [FriendInvitationView initFriendInvitationView];
    [self.friendInvitationBaseView addSubview:self.friendInvitationView];
    [self.friendInvitationView layoutAttachAll];
}
- (void)initRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}
#pragma mark - ViewModel Setting

- (void)setupViewModel {
    self.viewModel = [[FriendListViewModel alloc] initWithDelegate: self];
    [self.viewModel bind];
}

#pragma mark - Private

/// 畫面上推至搜尋框置頂至navigationBar下方
/// @param need 是否需要置頂
- (void) needHideTopView:(BOOL)need {
    self.userViewTopConstraint.constant = need ? - self.topView.frame.size.height : 0.0;
    [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
    }];
}

- (void)showFriendBadgeLabelWithCount:(NSInteger)count {
    [self.friendBadgeLabel setHidden:count == 0];
    if (count >= 99){
        self.friendBadgeLabel.text = @" 99+ ";
    }else{
        self.friendBadgeLabel.text = [NSString stringWithFormat:@"%ld", count];
    }
}
- (void)regiestNotificationObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(invitationViewStatusDidChanged:) name:kFriendInvitationViewExpandStatusChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(invitationDidAction:) name:kFriendInvitationDidAction object:nil];
}

- (void)refreshTable{
    [self.viewModel bind];
    [self.refreshControl beginRefreshing];
}

#pragma mark - Notification Handler
- (void)invitationViewStatusDidChanged:(NSNotification *)notification{
    BOOL isExpand = [notification.object boolValue];
    self.viewModel.isInvitationExpand = isExpand;
    self.friendInvitationBaseViewHeight.constant = isExpand ? self.viewModel.invitationsCount * friendInvitationRowHeight : friendInvitationRowHeight;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)invitationDidAction:(NSNotification *)notification{
    NSInteger index = [notification.object integerValue];
    Friend *changedFriend = [[self.viewModel getFriendInvitations] objectAtIndex:index];
    [self.viewModel removeInvitationByFid:changedFriend.fid];
}
#pragma mark - FriendSearchDelegate

- (void)didBegainEditing {
    
    [self needHideTopView:YES];
}
- (void)didEndEditing:(NSString *)content {
    
    [self needHideTopView:NO];
    [self.viewModel seachFriendByKeyword:content];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isNotNullValue(self.viewModel) && isNotNullValue(self.viewModel.feeds)){
        return self.viewModel.feeds.count;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FriendTableViewCell identifier] forIndexPath:indexPath];
    FriendCellViewModel *feed = [self.viewModel.feeds objectAtIndex:indexPath.row];
    [cell configure:feed];
    return cell;
}

#pragma mark - FriendListUpdateDelegate

- (void)willUpdateUserProfile:(User *)user {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.userNameLabel.text = user.name;
        self.userKokoIdLabel.text = user.kokoid;
    });
}

- (void)willUpdateFriendList {
    NSArray<Friend *> *friendInvitations = [self.viewModel getFriendInvitations];
    [self.friendInvitationView bind:friendInvitations];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.viewModel.feeds.isNotEmpty){
            [self initSearchTableHeader];
        }
        [self.tableView reloadData];
        NSInteger invitationsCount = [self.viewModel invitationsCount];
        //更新好友邀請的Badge及邀請列表
        [self showFriendBadgeLabelWithCount:invitationsCount];
        if (invitationsCount > 0){
            self.friendInvitationBaseViewHeight.constant = self.viewModel.isInvitationExpand ? self.viewModel.invitationsCount * friendInvitationRowHeight : friendInvitationRowHeight;
        }else{
            self.friendInvitationBaseViewHeight.constant = 0;
        }
        if (self.refreshControl.isRefreshing){
            [self.refreshControl endRefreshing];
        }
    });
}
- (void)shouldShowEmptyResultView {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (isNullValue(self.emptyResultView)){
            self.emptyResultView = [EmptyResultView initEmptyResultView];
            self.emptyResultView.frame = self.tableView.frame;
            [self.view addSubview:self.emptyResultView];
            [self.view bringSubviewToFront:self.tableView];
        }
        if (self.refreshControl.isRefreshing){
            [self.refreshControl endRefreshing];
        }
    });
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

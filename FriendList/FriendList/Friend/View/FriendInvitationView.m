//
//  FriendInvitationView.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "FriendInvitationView.h"
#import "FriendInvitationTableViewCell.h"
#import "FriendInvitationViewModel.h"
#import "FriendInvitationCellViewModel.h"

@interface FriendInvitationView() <UITableViewDataSource, InvitationCellDelegate, FriendInvitationUpdateDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) FriendInvitationViewModel *viewModel;
@end
@implementation FriendInvitationView
+ (id)initFriendInvitationView {
    
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"FriendInvitationView" owner:nil options:nil];
    return [nibView firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tableView.dataSource = self;
    self.viewModel = [[FriendInvitationViewModel alloc] initWithDelegate:self];
    [self.tableView registerNib:[FriendInvitationTableViewCell nib] forCellReuseIdentifier:[FriendInvitationTableViewCell identifier]];
}
- (void)bind:(NSArray <Friend *> *)friendInvitations {
    
    [self.viewModel bind:friendInvitations];
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendInvitationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FriendInvitationTableViewCell identifier] forIndexPath:indexPath];
    cell.tag = indexPath.row;
    FriendInvitationCellViewModel *feed = self.viewModel.feeds[indexPath.row];
    [cell configure:feed expend:self.viewModel.isExpand];
    cell.invitationCellDelegate = self;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = (isNotNullValue(self.viewModel.feeds) && self.viewModel.feeds.isNotEmpty) ? self.viewModel.feeds.count : 0;
    if (self.viewModel.isExpand) {
        return count;
    }else{
        return count == 0 ? count : 1;
    }
}
#pragma mark - Private
- (void)updateTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
#pragma mark - InvitationCellDelegate
- (void)willExpand {
    self.viewModel.isExpand = !self.viewModel.isExpand;
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [UIView performWithoutAnimation:^{
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    }];
    NSString *object = self.viewModel.isExpand ? @"YES":@"NO";
    [[NSNotificationCenter defaultCenter] postNotificationName:kFriendInvitationViewExpandStatusChanged object:object];
}
- (void)confirmInvitation:(NSInteger)index {
    
    [self.viewModel invitationDidAction:index];
    [self updateTableView];
}
- (void)deleteInvitation:(NSInteger)index {
    
    [self.viewModel invitationDidAction:index];
    [self updateTableView];
}
#pragma mark - FriendInvitationUpdateDelegate
- (void)willUpdateFriendInvitationView {
    [self updateTableView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  FriendTableViewCell.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "FriendTableViewCell.h"

@interface FriendTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *transferButton;
@property (weak, nonatomic) IBOutlet UIButton *inviteButton;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *transferButtonToInviteButtonConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *transferButtonToMoreButtonConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;

@end
@implementation FriendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.inviteButton setHidden:NO];
    [self.moreButton setHidden:YES];
    self.transferButtonToInviteButtonConstraint.priority = UILayoutPriorityDefaultHigh;
    self.transferButtonToMoreButtonConstraint.priority = UILayoutPriorityDefaultLow;
}

- (void)setupView {
    [self.transferButton addBorderWithColor:[UIColor hotPink] borderWidth:1.2 cornerRadius:2];
    [self.inviteButton addBorderWithColor:[UIColor veryLightPinkTwo] borderWidth:1.2 cornerRadius:2];
}
#pragma mark - Public
- (void)configure:(FriendCellViewModel *)feed {
    self.avatarImageView.image = [UIImage imageNamed:feed.avatar];
    self.nameLabel.text = feed.name;
    switch (feed.friendStatus) {
        case FriendStatusCanTransfer:
            self.transferButtonToMoreButtonConstraint.priority = UILayoutPriorityDefaultHigh;
            self.transferButtonToInviteButtonConstraint.priority = UILayoutPriorityDefaultLow;
            [self.inviteButton setHidden:YES];
            [self.moreButton setHidden:NO];
            break;
        case FriendStatusInviting:
            self.transferButtonToMoreButtonConstraint.priority = UILayoutPriorityDefaultLow;
            self.transferButtonToInviteButtonConstraint.priority = UILayoutPriorityDefaultHigh;
            [self.inviteButton setHidden:NO];
            [self.moreButton setHidden:YES];
            break;
        default:
            break;
    }
    [self.starImageView setHidden:!feed.isStarShown];
}

#pragma mark - IBAction

- (IBAction)inviteButtonDidPressed:(id)sender {
    
    if (isNotNullValue(self.delegate)) {
        
        if ([self.delegate respondsToSelector:@selector(shouldSendInvitation)]){
            
            [self.delegate shouldSendInvitation];
        }
    }
}

- (IBAction)transferButtonDidPressed:(id)sender {
    
    if (isNotNullValue(self.delegate)) {
        
        if ([self.delegate respondsToSelector:@selector(shouldTransfer)]){
            
            [self.delegate shouldTransfer];
        }
    }
}

- (IBAction)moreButtonDidPressed:(id)sender {
    
    if (isNotNullValue(self.delegate)) {
        
        if ([self.delegate respondsToSelector:@selector(shouldShowMore)]){
            
            [self.delegate shouldShowMore];
        }
    }
}
@end

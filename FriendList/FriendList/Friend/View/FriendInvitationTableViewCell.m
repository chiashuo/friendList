//
//  FriendInvitationTableViewCell.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "FriendInvitationTableViewCell.h"
@interface FriendInvitationTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *fakeCardView;
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fakeCardTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fakeCardBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fakeCardLeadingConstraint;

@end
@implementation FriendInvitationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self viewSetting];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - IBAction

- (IBAction)deleteButtonDidPressed:(id)sender {
    
}

- (IBAction)confirmButtonDidPressed:(id)sender {
    
}

#pragma mark - Private

- (void)viewSetting {
    
    self.fakeCardView.layer.cornerRadius = 6;
    self.cardView.layer.cornerRadius = 6;
    
    [self.fakeCardView addGlowEffect];
    [self.cardView addGlowEffect];
    
    self.cardView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleFingerTap:)];
    [self.cardView addGestureRecognizer:tapGesture];
}

- (void)singleFingerTap:(UITapGestureRecognizer *)recognizer{
    if (isNotNullValue(self.invitationCellDelegate)){
        if ([self.invitationCellDelegate respondsToSelector:@selector(willExpand)]){
            [self.invitationCellDelegate willExpand];
        }
    }
}

#pragma mark - Public
- (void)configure:(FriendInvitationCellViewModel *)feed expend:(BOOL)isExpend {
    self.nameLabel.text = feed.name;
    self.avatarImageView.image = [UIImage imageNamed:feed.avatar];
    self.messageLabel.text = feed.message;
    [self.fakeCardView setHidden:!feed.isFakeCardShow];
    CGFloat alpha;
    if (isExpend) {
        self.fakeCardTrailingConstraint.constant = 0;
        self.fakeCardLeadingConstraint.constant = 0;
        self.fakeCardBottomConstraint.constant = 120;
        alpha = 0;
    }else{
        self.fakeCardTrailingConstraint.constant = -10;
        self.fakeCardLeadingConstraint.constant = 10;
        self.fakeCardBottomConstraint.constant = 10;
        alpha = 1;
    }
    
    [UIView animateWithDuration:0.33 animations:^{
        [self layoutIfNeeded];
        self.fakeCardView.alpha = alpha;
    }];
}
@end

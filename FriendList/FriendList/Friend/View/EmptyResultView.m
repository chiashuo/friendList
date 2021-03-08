//
//  EmptyResultView.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/8.
//

#import "EmptyResultView.h"
@interface EmptyResultView()
@property (weak, nonatomic) IBOutlet UIButton *addFriendButton;
@property (weak, nonatomic) IBOutlet UIButton *setKOKOIDButton;

@end
@implementation EmptyResultView
+ (id)initEmptyResultView {
    
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"EmptyResultView" owner:nil options:nil];
    return [nibView firstObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self addUnderLineToSetKOKOIDButton];
    [self setUpAddFriendButton];
}
- (void)addUnderLineToSetKOKOIDButton{
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:@"設定 KOKO ID"];

    [titleString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [titleString length])];

    [self.setKOKOIDButton setAttributedTitle: titleString forState:UIControlStateNormal];
}
- (void)setUpAddFriendButton{
    //漸層
    CAGradientLayer *gradientLayer = [CAGradientLayer new];
    CGFloat width = kScreenWidth - 2 * 92;
    gradientLayer.frame = CGRectMake(0, 0, width, 40);
    gradientLayer.colors = @[ (id)[UIColor frogGreen].CGColor,
                              (id)[UIColor lightOliveGreen].CGColor ];
    gradientLayer.cornerRadius = 20;
    //陰影
    [self.addFriendButton addGlowEffect:[UIColor appleGreen40]];
    [self.addFriendButton.layer insertSublayer:gradientLayer atIndex:0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

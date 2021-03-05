//
//  FriendSearchView.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "FriendSearchView.h"
@interface FriendSearchView() <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation FriendSearchView

+ (id)initFriendSearchView {
    
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"FriendSearchView" owner:nil options:nil];
    return [nibView firstObject];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.searchTextField.delegate = self;
    
    NSDictionary<NSAttributedStringKey, id> *attributes = @{NSForegroundColorAttributeName : [UIColor steel],
                                                            NSFontAttributeName : [UIFont fontWithName:@"PingFangTC-Regular" size:14.f]};
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"想轉一筆給誰呢？" attributes:attributes];
    [self.searchTextField setAttributedPlaceholder:placeholder];
}

- (IBAction)searchButtonPressed:(id)sender {
    [self.searchTextField becomeFirstResponder];
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (isNotNullValue(self.searchDelegate)){
        if([self.searchDelegate respondsToSelector:@selector(didBegainEditing)]){
            [self.searchDelegate didBegainEditing];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSString *content = isNotNullValue(textField.text) ? textField.text : @"";
    
    if (isNotNullValue(self.searchDelegate)){
        
        if ([self.searchDelegate respondsToSelector:@selector(didEndEditing:)]){
            
            [self.searchDelegate didEndEditing:content];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

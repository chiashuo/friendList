//
//  FriendListViewModel.m
//  FriendList
//
//  Created by 家碩 張 on 2021/3/7.
//

#import "FriendListViewModel.h"
#import "Friend.h"
#import "User.h"
#import "NetworkProvider.h"


@interface FriendListViewModel ()
@property (strong, nonatomic) NSMutableArray<Friend *> *friendList;
@property (strong, nonatomic) User *userProfile;
@property (strong, nonatomic) NetworkProvider *provider;
@property (strong, nonatomic) NSString *keyword;
@end

@implementation FriendListViewModel
- (instancetype)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.friendList = [[NSMutableArray alloc] init];
        self.provider = [[NetworkProvider alloc] init];
        self.friendListUpdateDelegate = delegate;
        self.feeds = [[NSMutableArray alloc] init];
        self.category = FriendCategoryFriend;
    }
    return self;
}
- (void)bind {
    [self fetchUserProfile];
    [self fetchFriendListWithInvitation];
}

- (void)seachFriendByKeyword:(NSString *)keyword {
    self.keyword = keyword;
    [self setUpFeedsByKeyword:keyword];
    if (isNotNullValue(self.friendListUpdateDelegate)) {
        if([self.friendListUpdateDelegate respondsToSelector:@selector(willUpdateFriendList)]){
            [self.friendListUpdateDelegate willUpdateFriendList];
        }
    }
}
- (void)showFreindListByCategory:(FriendCategory)category {
    switch (category) {
        case FriendCategoryFriend:
            [self setUpFeedsByKeyword:self.keyword];
            break;
        case FriendCategoryChat:
            [self.feeds removeAllObjects];
            break;;
    }
    if (isNotNullValue(self.friendListUpdateDelegate)) {
        if([self.friendListUpdateDelegate respondsToSelector:@selector(willUpdateFriendList)]){
            [self.friendListUpdateDelegate willUpdateFriendList];
        }
    }
}
#pragma mark - Private

- (void)setUpFeeds{
    [self setUpFeedsByKeyword:@""];
}

- (void)setUpFeedsByKeyword:(NSString *)keyword {
    
    [self.feeds removeAllObjects];
    
    for (Friend *friend in self.friendList) {
        
        if (friend.friendStatus != FriendStatusInvitation && friend.friendStatus != FriendStatusUnknow){
            
            if ([keyword isEmpty]){
                
                [self.feeds addObject:[[FriendCellViewModel alloc] initWithFriend:friend]];
            }else{
                
                if ([friend.name canFindSubString:keyword]){
                    
                    [self.feeds addObject:[[FriendCellViewModel alloc] initWithFriend:friend]];
                }
            }
        }
    }
}
- (NSArray<Friend *> *)getFriendInvitations {
    NSMutableArray<Friend *> *friendInvitations = [[NSMutableArray alloc] init];
    for (Friend *friend in self.friendList) {
        if (friend.friendStatus == FriendStatusInvitation) {
            [friendInvitations addObject:friend];
        }
    }
    return  friendInvitations;
}
- (NSInteger)invitationsCount {
    return [self getFriendInvitations].count;
}

#pragma mark - Fetching Data

- (void)fetchUserProfile {
    
    [self.provider setTarget:kApiUrlUserInfo httpMethod:@"GET"];
    
    __weak __typeof(self) weakSelf = self;
    [self.provider sendWithParameter:@{} success:^(NSDictionary *responseDic) {
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSLog(@"%@ success", NSStringFromSelector(_cmd));
        strongSelf.userProfile = [[User alloc] initWithDictionary:responseDic];
        [strongSelf onFetchUserProfileSuccess];
    } failure:^(NSError *error) {
        NSLog(@"%@ fail with error:%@", NSStringFromSelector(_cmd), error.localizedDescription);
    }];
}

- (void)fetchFriendListWithoutInvitation {
    
    
    __block NSArray<Friend *> *page1Friends = @[];
    __block NSArray<Friend *> *page2Friends = @[];
    __block NSMutableArray<NSError *> *errors = [[NSMutableArray alloc] init];
    
    __weak __typeof(self) weakSelf = self;
    
    /// !Page 1
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    dispatch_group_async(group, globalQueue, ^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [self.provider setTarget:kApiUrlFriend1 httpMethod:@"GET"];
        [self.provider sendWithParameter:@{} success:^(NSDictionary *responseDic) {
            
            page1Friends = [strongSelf handleResultByFriendResponseDic:responseDic];
            dispatch_group_leave(group);
        } failure:^(NSError *error) {
            NSLog(@"fetch page1 fail with error:%@", error.localizedDescription);
            [errors addObject:error];
            dispatch_group_leave(group);
        }];
    });
    /// !Page 2
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        [self.provider setTarget:kApiUrlFriend2 httpMethod:@"GET"];
        [self.provider sendWithParameter:@{} success:^(NSDictionary *responseDic) {
            
            page2Friends = [strongSelf handleResultByFriendResponseDic:responseDic];
            dispatch_group_leave(group);
        } failure:^(NSError *error) {
            NSLog(@"fetch page2 fail with error:%@", error.localizedDescription);
            [errors addObject:error];
            dispatch_group_leave(group);
        }];
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (errors.count == 0){
            NSLog(@"%@ success", NSStringFromSelector(_cmd));
            [self onFetchFriendListWithoutInvitationSuccess: [page1Friends arrayByAddingObjectsFromArray:page2Friends]];
        }else{
            /// !Error Handle
        }
    });
}

- (void)fetchFriendListWithInvitation{
    
    [self.provider setTarget:kApiUrlFriend3 httpMethod:@"GET"];
    __weak __typeof(self) weakSelf = self;
    [self.provider sendWithParameter:@{} success:^(NSDictionary *responseDic) {
        NSLog(@"%@ success", NSStringFromSelector(_cmd));
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.friendList = [[NSMutableArray alloc] initWithArray:[strongSelf handleResultByFriendResponseDic:responseDic]];
        [strongSelf onFetchFriendListWithInvitationSuccess];
    } failure:^(NSError *error) {
        NSLog(@"%@ fail with error:%@", NSStringFromSelector(_cmd), error.localizedDescription);
    }];
}
#pragma mark - Handler

- (void)onFetchUserProfileSuccess {
    if (isNotNullValue(self.friendListUpdateDelegate)) {
        if([self.friendListUpdateDelegate respondsToSelector:@selector(willUpdateUserProfile:)]){
            [self.friendListUpdateDelegate willUpdateUserProfile:self.userProfile];
        }
    }
}

- (void)onFetchFriendListWithoutInvitationSuccess:(NSArray<Friend *> *)friendList {
    NSMutableDictionary<NSString *, Friend *> *dictionary = [NSMutableDictionary new];
    [friendList enumerateObjectsUsingBlock:^(Friend *_Nonnull friend, NSUInteger index, BOOL *_Nonnull stop) {
        Friend *existFriend = dictionary[friend.fid];
        if (isNotNullValue(existFriend)){
            if ([friend isNewestFriendThan:existFriend]){
                [dictionary setValue:friend forKey:friend.fid];
            }
        }else{
            [dictionary setValue:friend forKey:friend.fid];
        }
    }];
    NSMutableArray *combinedFriends = [[NSMutableArray alloc] init];
    for (Friend *tempFriend in friendList) {
        Friend *friend = [dictionary objectForKey: tempFriend.fid];
        if ([combinedFriends containsObject:friend] == NO){
            [combinedFriends addObject:friend];
        }
    }
    self.friendList = combinedFriends;
    [self setUpFeeds];
    
    if (isNotNullValue(self.friendListUpdateDelegate)) {
        if([self.friendListUpdateDelegate respondsToSelector:@selector(willUpdateFriendList)]){
            [self.friendListUpdateDelegate willUpdateFriendList];
        }
    }
}

- (void)onFetchFriendListWithInvitationSuccess{
    [self setUpFeeds];
    
    if (isNotNullValue(self.friendListUpdateDelegate)) {
        if([self.friendListUpdateDelegate respondsToSelector:@selector(willUpdateFriendList)]){
            [self.friendListUpdateDelegate willUpdateFriendList];
        }
    }
}
#pragma mark - Private

- (NSArray<Friend *> *)handleResultByFriendResponseDic:(NSDictionary *)responseDic {
    
    NSArray *responseArray = [responseDic valueForKey:@"response"];

    if (isNotNullValue(responseArray)) {
        NSMutableArray<Friend *> *friends = [[NSMutableArray alloc] init];
        for (NSDictionary *friendRawData in responseArray) {
            Friend *friend = [[Friend alloc] initWithDictionary:friendRawData];
            if (friend) {
                [friends addObject:friend];
            }
        }
        return friends;
    }
    return @[];
}
@end

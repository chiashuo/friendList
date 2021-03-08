//
//  User.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kokoid;
@end

NS_ASSUME_NONNULL_END

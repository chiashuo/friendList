//
//  NSArray+Utils.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Utils)

@property (nonatomic, readonly) id firstObject;

- (BOOL) isEmpty;
- (BOOL) isNotEmpty;

@end

NS_ASSUME_NONNULL_END

//
//  NetworkProvider.h
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkProvider : NSObject

+ (instancetype)sharedInstance;
- (void)setTarget:(NSString *)target httpMethod:(NSString *)httpMethod;
- (void) sendWithParameter:(NSDictionary*)parameters
                   success:(void (^)(NSDictionary *))successBlock
                   failure:(void (^)(NSError *))failureBlock;
@end

NS_ASSUME_NONNULL_END

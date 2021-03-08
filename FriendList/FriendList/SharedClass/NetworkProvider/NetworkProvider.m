//
//  NetworkProvider.m
//  FriendList
//
//  Created by Johnny on 2021/3/5.
//

#import "NetworkProvider.h"

@interface NetworkProvider ()
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *httpMethod;
@end

static NSUInteger const HTTPRequestTimeout = 30;

@implementation NetworkProvider

+ (instancetype)sharedInstance {
    static NetworkProvider *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetworkProvider alloc] init];
    });
    return instance;
}
- (void)setTarget:(NSString *)target httpMethod:(NSString *)httpMethod {
    
    self.url = [NSURL URLWithString:target];
    self.httpMethod = httpMethod.uppercaseString;
}

- (void) sendWithParameter:(NSDictionary*)parameters
                   success:(void (^)(NSDictionary *))successToRun
                   failure:(void (^)(NSError *))failureToRun {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.url
                                                                cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                            timeoutInterval:HTTPRequestTimeout];
    
    request.HTTPMethod = self.httpMethod;
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error;
    if ([self.httpMethod  isEqualToString: @"POST"]){
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    }
    [self sendRequest:request success:successToRun failure:failureToRun];
}

- (void)sendRequest:(NSURLRequest*)request
            success:(void (^)(NSDictionary *))successToRun
            failure:(void (^)(NSError *))failureToRun {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (isNullValue(error)) {
            
            if (httpResponse) {
                /// ! 預設處理statusCode為 200, 204會回傳正確的物件，其他歸納為Error handle
                if (httpResponse.statusCode == 200 || httpResponse.statusCode == 204) {
                    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data
                                                                                options:0
                                                                                  error:nil];
                    if (isNotNullValue(successToRun)) {
                        
                        successToRun(isNotNullValue(responseDic) ? responseDic : @{});
                    }
                    return;
                }else{
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]};
                    failureToRun([[NSError alloc] initWithDomain:@"fetch fail" code:httpResponse.statusCode userInfo:userInfo]);
                }
            }else{
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"連線失敗"};
                failureToRun([[NSError alloc] initWithDomain:@"fetch fail" code:ResultCodeWrongOwnDefinition userInfo:userInfo]);
            }
        } else {
            
            failureToRun(error);
        }
    }];
    
    [task resume];
    
}
@end

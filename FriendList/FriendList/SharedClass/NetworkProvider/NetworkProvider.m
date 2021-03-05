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

- (instancetype)initWithMomoWaURL:(NSURL*)url
                       httpMethod:(NSString *)method {
    
    self = [super init];
    if (self) {
        _url = url;
        _httpMethod = method;
    }
    return self;
}
- (void) sendWithParameter:(NSDictionary*)parameters
                   success:(void (^)(NSDictionary *))successBlock
                   failure:(void (^)(NSError *))failureBlock {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.url
                                                                cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                            timeoutInterval:HTTPRequestTimeout];
    
    request.HTTPMethod = @"POST";
    
    NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    [request setValue:[NSString stringWithFormat:@"application/json; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
    
    NSError *error;
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    
    [self sendRequest:request success:successBlock failure:failureBlock];
}

- (void)sendRequest:(NSURLRequest*)request
            success:(void (^)(NSDictionary *))successBlock
            failure:(void (^)(NSError *))failureBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    __weak typeof (self) selfWeakObj = self;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (!error) {
            
            if (httpResponse) {
                
                if (httpResponse.statusCode == 200 || httpResponse.statusCode == 204) {
                    if (successBlock != nil) {
                        NSLog(@"Success send to momoWa");
                        
                    }
                    
                }else{
                    
                    
                }
            }
        } else {
            
        }
    }];
    
    [task resume];
    
}
@end

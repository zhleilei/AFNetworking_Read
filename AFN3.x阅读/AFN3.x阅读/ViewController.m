//
//  ViewController.m
//  AFN3.x阅读
//
//  Created by 孙春磊 on 2017/8/20.
//  Copyright © 2017年 云积分. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testBaseUrl];
    [self test];
    
}




- (void)test{
    bool lock = false;
    bool result = test_and_set(&lock);
    printf("%d-%d",lock,result);
}

bool test_and_set(bool *target){
    bool rv = *target;
    *target = true;
    return rv;
};


- (void)testBaseUrl{
    
    //    NSURL *baseURL = [NSURL URLWithString:@"http://example.com/v1/"];
    //
    //    // http://example.com/v1/foo
    //    NSURL *url1 = [NSURL URLWithString:@"foo" relativeToURL:baseURL];
    //
    //    // http://example.com/v1/foo?bar=baz
    //    NSURL *url2 = [NSURL URLWithString:@"foo?bar=baz" relativeToURL:baseURL];
    //
    //    // http://example.com/foo
    //    NSURL *url3 = [NSURL URLWithString:@"/foo" relativeToURL:baseURL];
    //
    //
    //    // http://example.com/v1/foo
    //    NSURL *url4 = [NSURL URLWithString:@"foo/" relativeToURL:baseURL];
    //
    //    // http://example.com/foo/
    //    NSURL *url5 = [NSURL URLWithString:@"/foo/" relativeToURL:baseURL];
    //
    //    // http://example2.com/
    //    NSURL *url6 = [NSURL URLWithString:@"http://example2.com/" relativeToURL:baseURL];
    
    //    NSLog(@"%@",url6);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//如果在后台任务正在传输时程序退出，可以使用这个identifier在程序重新启动是创建一个新的configuration和session关联之前传输。
@property(readonly, copy) NSString  *identifier;

//默认为空，NSURLRequest附件的请求头。
//这个属性会给所有使用该configuration的session生成的tasks中的NSURLRequest添加额外的请求头。
//如果这里边添加的请求头跟NSURLRequest中重复了，侧优先使用NSURLRequest中的头
@property(copy) NSDictionary  *HTTPAdditionalHeaders;

//是否使用蜂窝网络，默认是yes.
@property BOOL allowsCellularAccess;

//给request指定每次接收数据超时间隔
//如果下一次接受新数据用时超过该值，则发送一个请求超时给该request。默认为60s
@property NSTimeInterval  timeoutIntervalForRequest;

//给指定resource设定一个超时时间，resource需要在时间到达之前完成
//默认是7天。
@property NSTimeInterval  timeoutIntervalForResource;

//discretionary属性为YES时表示当程序在后台运作时由系统自己选择最佳的网络连接配置，该属性可以节省通过蜂窝连接的带宽。
//在使用后台传输数据的时候，建议使用discretionary属性，而不是allowsCellularAccess属性，因为它会把WiFi和电源可用性考虑在内。
@property (getter=isDiscretionary) BOOL discretionary;

//表示当后台传输结束时，是否启动app.这个属性只对 生效，其他configuration类型会自动忽略该值。默认值是YES。
@property BOOL sessionSendsLaunchEvents;

//是否启动通道，可以用于加快网络请求，默认是NO
@property BOOL HTTPShouldUsePipelining;

/===========储存的相关属性=============/

//存储cookie，清除存储，直接set为nil即可。
//对于默认和后台的session，使用sharedHTTPCookieStorage。
//对于短暂的session，cookie仅仅储存到内存，session失效时会自动清除。
@property(retain) NSHTTPCookieStorage  *HTTPCookieStorage;

//默认为yes,是否提供来自shareCookieStorge的cookie
//如果想要自己提供cookie，可以使用HTTPAdditionalHeaders来提供。
@property BOOL  HTTPShouldSetCookies;

//证书存储，如果不使用，可set为nil.
//默认和后台session，默认使用的sharedCredentialStorage.
//短暂的session使用一个私有存储在内存中。session失效会自动清除。
@property(retain) NSURLCredentialStorage *URLCredentialStorage;

//缓存NSURLRequest的response。
//默认的configuration，默认值的是sharedURLCache。
//后台的configuration，默认值是nil
//短暂的configuration，默认一个私有的cache于内存，session失效，cache自动清除。
@property(retain) NSURLCache  *URLCache;

//缓存策略，用于设置该会话中的Request的cachePolicy，如果Request有单独设置的话，以Request为准。
//默认值是NSURLRequestUseProtocolCachePolicy
@property NSURLRequestCachePolicy requestCachePolicy;

@end

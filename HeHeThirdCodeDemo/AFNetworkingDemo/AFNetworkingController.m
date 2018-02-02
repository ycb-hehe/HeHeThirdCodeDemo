//
//  LearnAFNetworkingController.m
//  HeHeThirdCodeDemo
//
//  Created by ycb on 2018/1/29.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import "AFNetworkingController.h"
#import "AFHTTPSessionManager.h"

@interface AFNetworkingController ()

@property (weak, nonatomic) IBOutlet UITextView *logTV;

@end

@implementation AFNetworkingController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 基础配置
- (AFHTTPSessionManager *)shareAFNManager
{
    //单例模式
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30.0f;
    
    // 设置请求头，每个项目不同，需要配合服务器环境配置
    //[manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    
    // 设置接收的Content-Type， @"text/plain"是没有的记得添加，否则有时会报错
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml",
                                                         @"text/xml",
                                                         @"text/html",
                                                         @"application/json",
                                                         @"text/plain",nil];
    return manager;
}

#pragma mark - GET请求
- (IBAction)doGetRequest:(id)sender {
    //创建请求地址
    NSString *url=@"http://120.76.205.241:8000/news/qihoo?";
    //构造参数
    NSDictionary *parameters=@{@"kw":@"白",
                               @"site":@"qq.com",
#warning 如果想使用示例中的API，需要自己注册 http://www.idataapi.cn/ 获得对应的key*/
                               @"apikey":@"这里输入你的KEY"};

    //AFN管理者调用get请求方法
    [[self shareAFNManager] GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //返回请求返回进度
        NSLog(@"downloadProgress-->%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        //请求成功返回数据 根据responseSerializer 返回不同的数据格式
        NSLog(@"responseObject-->%@",responseObject);
        
        //输出到界面//
        self.logTV.text = [NSString stringWithFormat:@"%@",responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"error-->%@",error);
        if (error.code == NSURLErrorTimedOut) {
            //请求超时
        }
        self.logTV.text = [NSString stringWithFormat:@"%@",[error.userInfo objectForKey:NSUnderlyingErrorKey]];
    }];

}

#pragma mark - POST请求
- (IBAction)doPostRequest:(id)sender {
    //创建请求地址
    NSString *url=@"http://120.76.205.241:8000/news/qihoo?";
    //构造参数
    NSDictionary *parameters=@{@"kw":@"白",
                               @"site":@"qq.com",
#warning 如果想使用示例中的API，需要自己注册 http://www.idataapi.cn/ 获得对应的key*/
                               @"apikey":@"这里输入你的KEY"};
    //如果想使用示例中的API，需要自己注册 http://www.idataapi.cn/ 获得对应的key
    
    [[self shareAFNManager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //返回请求返回进度
        NSLog(@"downloadProgress-->%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功返回数据 根据responseSerializer 返回不同的数据格式
        NSLog(@"responseObject-->%@",responseObject);
        
        //输出到界面//
        self.logTV.text = [NSString stringWithFormat:@"%@",responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"error-->%@",error);
        if (error.code == NSURLErrorTimedOut) {
            //请求超时
        }
        self.logTV.text = [NSString stringWithFormat:@"%@",[error.userInfo objectForKey:NSUnderlyingErrorKey]];
    }];
}


@end

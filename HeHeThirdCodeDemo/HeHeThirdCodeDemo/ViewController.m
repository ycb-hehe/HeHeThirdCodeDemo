//
//  ViewController.m
//  HeHeThirdCodeDemo
//
//  Created by ycb on 2018/1/29.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self doGetRequest];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doGetRequest
{
    //创建请求地址
    NSString *url=@"http://120.76.205.241:8000/news/qihoo?";
    //构造参数
    NSDictionary *parameters=@{@"kw":@"白",
                               @"site":@"qq.com",
                               @"apikey":@"Lqb464Wuh6TMNmndTy368bFrHRJPU6pcAhDmRwKziX9igI6g6YSfp7S12bBkIORa"};
    //AFN管理者调用get请求方法
    [[self shareAFNManager] GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //返回请求返回进度
        NSLog(@"downloadProgress-->%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        //请求成功返回数据 根据responseSerializer 返回不同的数据格式
        NSLog(@"responseObject-->%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"error-->%@",error);
    }];
}

- (void)doPostRequest
{
    //创建请求地址
    NSString *url=@"http://120.76.205.241:8000/news/qihoo?";
    //构造参数
    NSDictionary *parameters=@{@"kw":@"白",
                               @"site":@"qq.com",
                               @"apikey":@"Lqb464Wuh6TMNmndTy368bFrHRJPU6pcAhDmRwKziX9igI6g6YSfp7S12bBkIORa"};

    [[self shareAFNManager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //返回请求返回进度
        NSLog(@"downloadProgress-->%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功返回数据 根据responseSerializer 返回不同的数据格式
        NSLog(@"responseObject-->%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"error-->%@",error);
    }];
}

-(AFHTTPSessionManager *)shareAFNManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30.0f;
    // 请求格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    // 设置请求头
    //[manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    // 设置接收的Content-Type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    return manager;
}


- (void)sessionManager
{
    
}

@end

//
//  LearnListModel.m
//  HeHeThirdCodeDemo
//
//  Created by ycb on 2018/1/29.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import "LearnListModel.h"

@implementation LearnListModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.itmes = [[NSMutableArray alloc] initWithCapacity:LearlistSections];
        
        NSArray *netwokingItem = @[@"AFNetworking",@"ASIHttpRequest"];
        [self.itmes addObject:netwokingItem];
        
        NSArray *hud = @[@"SVProgressHUD",@"MBProgress"];
        [self.itmes addObject:hud];
        
    }
    return self;
}

@end

//
//  LearnListModel.h
//  HeHeThirdCodeDemo
//
//  Created by ycb on 2018/1/29.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LearlistSection) {
    LearlistSectionNetworking =0, //网络请求分类
//    LearlistSectionDataBase,
    LearlistSections,
};

@interface LearnListModel : NSObject

@property (nonatomic,strong) NSMutableArray *itmes;

@end

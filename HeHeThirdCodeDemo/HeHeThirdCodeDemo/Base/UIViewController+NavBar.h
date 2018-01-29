//
//  UIViewController+NavBar.h
//  CYOC
//
//  Created by hehe on 14-3-31.
//  Copyright (c) 2014年 changyou. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (NavBar)

- (UIImageView *)logoView;

/*! @brief 创建一个返回按钮（常用）
 */
- (UIBarButtonItem *)getNavigationItemBackBarButtonItem;

/*! @brief 导航标题样式扩展
 */
- (UILabel *)titleLabelWithText:(NSString *)theText;


/*! @brief 自定义导航的BarButtonItem(图片效果)
 */
- (UIBarButtonItem *)customBarButtonWithNorImage:(UIImage *)norImage
                                        selImage:(UIImage *)selImage
                                          Target:(id)target
                                          action:(SEL)acticon;

/*! @brief 创建一个返回按钮,自己实现回退的方法
 */
- (UIBarButtonItem *)getNavigationItemBackBarButtonItemWithTarget:(id)target action:(SEL)action;


@end



//
//  KRAlertView.h
//  kreditbro
//
//  Created by 戴培琼 on 2019/3/26.
//  Copyright © 2019 lai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KRAlertView : UIView
@property (nonatomic,strong) UIView *customeView;
/**
 弹窗 view
 */
@property(nonatomic,strong)UIView *mainView;

/**
 弹窗内容的View
 */
@property (nonatomic,strong)UIView *contentView;
/**
 销毁页面
 */
- (void)exit;

/**
 销毁页面 block
 */
@property (nonatomic, copy) void(^oneExit)();
/**
 点击背景是否可关闭弹窗
 */
@property (nonatomic,assign)BOOL isClickBackgroundCloseWindow;
- (instancetype)initWidth:(CGFloat)width customeView:(UIView *) customeView;

@end

NS_ASSUME_NONNULL_END

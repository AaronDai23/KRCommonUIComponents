//
//  KRDPQPopTipView.h
//  kreditbro
//
//  Created by 戴培琼 on 2019/4/5.
//  Copyright © 2019 lai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// 有左右按钮的提示框
@interface KRDPQPopTipView : UIView
@property (nonatomic,strong) UIView *rectView;
@property (nonatomic,strong) UIButton *topBtn;
@property (nonatomic,strong) UIButton *leftbottomBtn;
@property (nonatomic,strong) UIButton *rightbottomBtn;
@property (nonatomic,strong) UILabel  *titleLbl1;
@property (nonatomic,strong) UILabel  *titleLbl2;
/// 重新设置背景高度
- (void)reSetRectViewHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END

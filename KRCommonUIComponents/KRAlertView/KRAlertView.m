//
//  KRAlertView.m
//  kreditbro
//
//  Created by 戴培琼 on 2019/3/26.
//  Copyright © 2019 lai. All rights reserved.
//

#import "KRAlertView.h"
#import "Masonry.h"
@implementation KRAlertView
/**
 init
 
 @param width width description
 @return return value description
 */
- (instancetype)initWidth:(CGFloat)width customeView:(UIView *) customeView{
    self = [super init];
    if (self) {
        _customeView = customeView;
        [self viewInitUI];
        [self setAlertWidth:width];
        [self animateSenior];
    }
    return self;
}

/**
 设置弹框的宽度
 
 @param width width 宽度值
 */
-(void)setAlertWidth:(CGFloat)width{
    
    [self.mainView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (width > 1) {
            make.width.offset(width);
        }
        else if(width > 0 && width <= 1){
            make.width.offset([UIScreen mainScreen].bounds.size.width * width);
        }
        else{
            make.width.offset([UIScreen mainScreen].bounds.size.width * 0.7);
        }
    }];
}

/**
 单击 背景 是否关闭弹窗
 @param isClickBackgroundCloseWindow isClickBackgroundCloseWindow description
 */
-(void)setIsClickBackgroundCloseWindow:(BOOL)isClickBackgroundCloseWindow{
    if(isClickBackgroundCloseWindow){
        UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(exit)];
        [self addGestureRecognizer:tapGesture];
    }
}

/**
 view 初始化
 */
-(void)viewInitUI{
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window addSubview:self];
    [self addSubview:self.mainView];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [self.mainView insertSubview:self.contentView atIndex:0];
    if (_customeView) {
        [self.contentView addSubview:_customeView];
    }
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    self.mainView.translatesAutoresizingMaskIntoConstraints =NO;
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.mainView.superview);
        make.width.offset([UIScreen mainScreen].bounds.size.width * 0.7);
        if (_customeView) {
            make.height.offset(_customeView.frame.size.height);
        }
    }];
    
   
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mainView).offset(0);
            make.right.equalTo(self.mainView).offset(0);
            make.top.equalTo(self.mainView).offset(0);
            make.bottom.equalTo(self.mainView).offset(0);
    }];
}

/**
 弹窗飞入 渐变 动画
 */
-(void)animateSenior{
    
    self.mainView.transform = CGAffineTransformMakeTranslation(0, 600);
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.35 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.mainView.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
    }];
    
}

#pragma make 事件

/**
 销毁弹窗  方法
 */
-(void)exit{
    [self removeFromSuperview];
}

/**
 关闭按钮事件
 
 @param sender sender description
 */
-(void)closedButtonClick:(UIButton *)sender{
    [self exit];
    if (_oneExit){
        _oneExit();
    }
}

#pragma make 懒加载

-(UIView*)mainView{
    if (_mainView == nil) {
        _mainView = [[UIView alloc]init];
        [_mainView setBackgroundColor:[UIColor whiteColor]];
        [_mainView.layer setMasksToBounds:YES];
        [_mainView.layer setCornerRadius:4];
    }
    return _mainView;
}

-(UIView *)contentView{
    if(_contentView==nil){
        _contentView =[[UIView alloc]init];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
    }
    return _contentView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

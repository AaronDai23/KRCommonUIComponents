//
//  KRDPQPopTipView.m
//  kreditbro
//
//  Created by 戴培琼 on 2019/4/5.
//  Copyright © 2019 lai. All rights reserved.
//

#import "KRDPQPopTipView.h"
#import "Masonry.h"
#import <KRCommonComponents/Macros.h>
#import <KRCommonComponents/ColorTools.h>


@implementation KRDPQPopTipView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        
        _rectView = [[UIView alloc] init];
        _rectView.backgroundColor = [UIColor whiteColor];
        _rectView.frame = CGRectMake(MSWIDTH/2-125, (self.frame.size.height)/2-100, 250, 165);
        _rectView.layer.cornerRadius = 8.0;
        [self addSubview:_rectView];
        
        _topBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 250, 40)];
        _topBtn.backgroundColor = [UIColor whiteColor];
        _topBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _topBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_topBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rectView addSubview:_topBtn];
        
        _leftbottomBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_rectView addSubview:_leftbottomBtn];
        [_leftbottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rectView).offset(20);
            make.bottom.equalTo(self->_rectView).offset(-15);
            make.width.equalTo(@((230 - 40)/2));
            make.height.mas_equalTo(36);
        }];
        _leftbottomBtn.backgroundColor = [UIColor grayColor];
        _leftbottomBtn.layer.cornerRadius = 3.0;
        [_leftbottomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftbottomBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_leftbottomBtn setTitle:@"" forState:UIControlStateNormal];//返回登录
        
        _rightbottomBtn = [[UIButton alloc] init];
        _rightbottomBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_rectView addSubview:_rightbottomBtn];
        [_rightbottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_leftbottomBtn.mas_right).offset(20);
            make.right.equalTo(self->_rectView).offset(-20);
            make.bottom.equalTo(self->_rectView).offset(-15);
            make.width.mas_equalTo((230 - 40)/2);
            make.height.mas_equalTo(36);
        }];
        _rightbottomBtn.backgroundColor = KRedColor;
        _rightbottomBtn.layer.cornerRadius = 3.0;
        _rightbottomBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_rightbottomBtn setTitle:@"" forState:UIControlStateNormal];//返回登录
    }
    
    _titleLbl1 = [[UILabel alloc] init];
    [_rectView addSubview:_titleLbl1];
    [_titleLbl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rectView).offset(0);
        make.top.equalTo(self.rectView).offset(50);
        make.width.equalTo(@250);
        make.bottom.equalTo(self.leftbottomBtn.mas_top).offset(-15);
    }];
    _titleLbl1.textAlignment = NSTextAlignmentCenter;
    _titleLbl1.font = [UIFont systemFontOfSize:14];
    _titleLbl1.numberOfLines = 0;
    _titleLbl1.lineBreakMode = NSLineBreakByClipping;
    _titleLbl1.textColor = [UIColor blackColor];
    
    
    
    
    return self;
}

/// 重新设置背景高度
- (void)reSetRectViewHeight:(CGFloat)height {
    CGRect frame = _rectView.frame;
    frame.size.height = height;
    _rectView.frame = frame;
    [_leftbottomBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rectView).offset(20);
        make.bottom.equalTo(self->_rectView).offset(-15);
        make.width.equalTo(@((230 - 40)/2));
        make.height.mas_equalTo(36);
    }];
    
    [_rightbottomBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_leftbottomBtn.mas_right).offset(20);
        make.right.equalTo(self->_rectView).offset(-20);
        make.bottom.equalTo(self->_rectView).offset(-15);
        make.width.mas_equalTo((230 - 40)/2);
        make.height.mas_equalTo(36);
    }];
   
    [_rightbottomBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_leftbottomBtn.mas_right).offset(20);
        make.right.equalTo(self->_rectView).offset(-20);
        make.bottom.equalTo(self->_rectView).offset(-15);
        make.width.mas_equalTo((230 - 40)/2);
        make.height.mas_equalTo(36);
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

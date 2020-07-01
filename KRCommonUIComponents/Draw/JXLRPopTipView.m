//
//  JXLRPopTipView.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/20.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "JXLRPopTipView.h"
#import <KRCommonComponents/Macros.h>
#import <KRCommonComponents/ColorTools.h>

@implementation JXLRPopTipView

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        
        _rectView = [[UIView alloc] init];
        _rectView.backgroundColor = [UIColor whiteColor];
        _rectView.frame = CGRectMake(MSWIDTH/2-125, (self.frame.size.height)/2-100, 250, 156);
        _rectView.layer.cornerRadius = 8.0;
        [self addSubview:_rectView];
        
        _topBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 230, 40)];
        _topBtn.backgroundColor = [UIColor whiteColor];
        _topBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _topBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_topBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rectView addSubview:_topBtn];
        
        _titleLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 250, 40)];
        _titleLbl1.textAlignment = NSTextAlignmentCenter;
        _titleLbl1.font = [UIFont systemFontOfSize:14];
        _titleLbl1.numberOfLines = 0;
        _titleLbl1.lineBreakMode = NSLineBreakByClipping;
        _titleLbl1.textColor = [UIColor blackColor];
        [_rectView addSubview:_titleLbl1];

        
        
        _bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 210, 36)];
//        _bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 140, 210, 36)];
        _bottomBtn.backgroundColor = KRedColor;
        _bottomBtn.layer.cornerRadius = 3.0;
        _bottomBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
//        [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBtn setTitle:@"" forState:UIControlStateNormal];//返回登录
        [_rectView addSubview:_bottomBtn];
    }
    return self;
}



@end


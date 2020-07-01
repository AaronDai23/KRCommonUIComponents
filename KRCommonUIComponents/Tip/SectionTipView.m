//
//  SectionTipView.m
//  kreditbro
//
//  Created by 戴培琼 on 2019/9/23.
//  Copyright © 2019 lai. All rights reserved.
//

#import "SectionTipView.h"
#import "Masonry.h"
#import <KRCommonComponents/Macros.h>
#import <KRCommonComponents/ColorTools.h>
#import <KRCommonComponents/KRUtils.h>
#import <KRCommonComponents/FontTools.h>

@interface SectionTipView()
@property (nonatomic, strong) UILabel *tipLab;
@property (nonatomic, strong) UIView *bgView;
@end

@implementation SectionTipView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.backgroundColor = [UIColor systemGroupedBackgroundColor];
    [self addSubview:self.bgView];

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(10);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
    
    [self.bgView addSubview:self.tipLab];
    
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView);
        make.left.mas_equalTo(self).offset(16);
        make.right.mas_equalTo(self).offset(-16);
        make.bottom.mas_equalTo(self.bgView);
    }];
    
    //添加点击手势
    UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickInterestAction)];
    
    [self addGestureRecognizer:click];
}


- (void)clickInterestAction {
    if (self.cliclkBlock) {
        self.cliclkBlock();
    }
}

- (void)setTip:(NSString *)tip {
    self.tipLab.text = tip;
}




- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = KWhitekColor;
    }
    return _bgView;
}

- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [KRUtils creatLabelWithTitleColor:KBlackColor font:KRFont(16) textAlignment:NSTextAlignmentLeft];
        _tipLab.backgroundColor = KWhitekColor;
    }
    return _tipLab;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

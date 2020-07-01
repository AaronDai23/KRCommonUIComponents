//
//  SectionTipView.h
//  kreditbro
//
//  Created by 戴培琼 on 2019/9/23.
//  Copyright © 2019 lai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// section提示视图
@interface SectionTipView : UIView
@property (nonatomic, copy) void(^cliclkBlock)(void);
- (void)setTip:(NSString *)tip;
@end

NS_ASSUME_NONNULL_END

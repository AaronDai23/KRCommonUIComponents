//
//  KRProgressHud.m
//  kreditbro
//
//  Created by 戴培琼 on 2020/1/15.
//  Copyright © 2020 lai. All rights reserved.
//

#import "KRProgressHud.h"
#import "SVProgressHUD.h"

@implementation KRProgressHud
+ (void)showloding {
    [KRProgressHud show:@"Loading..."];
}

// 只显示文字
+ (void)showOnlyStr:(NSString *)info {
    [SVProgressHUD showImage:[UIImage imageNamed:@"11111"] status:info];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD dismissWithDelay:2];
}


+ (void)show:(nullable NSString*)message {;
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:message];
}


+ (void)showErrorWithStatus:(nullable NSString*)message {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showErrorWithStatus:message];
}

+ (void)showSuccessWithStatus:(nullable NSString*)message {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}

@end

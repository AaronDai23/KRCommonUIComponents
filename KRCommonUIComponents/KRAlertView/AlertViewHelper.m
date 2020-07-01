//
//  AlertViewHelper.m
//  kreditbro
//
//  Created by 戴培琼 on 2019/3/26.
//  Copyright © 2019 lai. All rights reserved.
//

#import "AlertViewHelper.h"
#import "KRAlertView.h"
#import <KRCommonComponents/Macros.h>
#import <KRCommonComponents/ColorTools.h>
#import <KRCommonComponents/UIView+KRPostion.h>
//#import "CountryCodeSelectView.h"
//#import "CountryCodeModel.h"
#import "AlertVC.h"
#define SPASE_TOP IOS9 ? 50.f : 20.f

static AlertViewHelper *staticAlertViewHelper;
static dispatch_once_t  onceAlertViewHelper;
@implementation AlertViewHelper
+ (instancetype) shareInstance{
    dispatch_once(&onceAlertViewHelper, ^{
        staticAlertViewHelper = [[AlertViewHelper alloc] init];
    });
    return staticAlertViewHelper;
}

//+ (void) alertCountryCodeSelectView:(NSArray *)datas confirm:(void (^ )(CountryCodeModel *model)) confirm {
//
//    CountryCodeSelectView *cview = [[CountryCodeSelectView alloc] initWithFrame:CGRectMake(0, 0, MSWIDTH - 40, datas.count * 44) datas:datas];
//    KRAlertView *alert = [[KRAlertView alloc] initWidth:MSWIDTH - 40 customeView:cview];
////    alert.isClickBackgroundCloseWindow = YES;
////    alert.onExit = ^{
////        if (cancel) {
////            cancel();
////        }
////    };
//    cview.selected = ^(CountryCodeModel * _Nonnull selectedItem) {
//        if (confirm) {
//            confirm(selectedItem);
//        }
//          [alert exit];
//    };
//
//}


/**
 *日期选择框
 */
+ (void) alertDatePickerByNav:(UINavigationController *) nav dateType:(UIDatePickerMode) dateType callback:(void(^)(NSDate *date)) callback{
    NSString *message = @"\n\n\n\n\n\n\n";
    NSString *title = KRLANGGECE(@"info_birsthday");
    AlertVC *alert = [AlertVC alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
    
    alert.automaticallyAdjustsScrollViewInsets =
NO;
    
    //线条
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, SPASE_TOP + .5f, alert.view.width - 70, .5f)];
    line.backgroundColor = KLineColor;
    [alert.view addSubview:line];
    
    
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    [picker setValue:KRedColor forKey:@"textColor"];
    picker.datePickerMode = dateType;
    
    if (iPhone_X) {
        picker.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        picker.frame = CGRectMake(-15, line.bottom, alert.view.width - ScreenWidth/320 * 50,100);
    }else if(ScreenWidth == 320) { // 处理5s
        picker.frame = CGRectMake(10, line.bottom, alert.view.width - ScreenWidth/320 * 50,100);
    }else { // 处理6s
        picker.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        picker.frame = CGRectMake(-15, line.bottom, alert.view.width - ScreenWidth/320 * 50,100);
    }
    [alert.view addSubview:picker];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:KRLANGGECE(@"dialog_cancle")
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                [alert dismissViewControllerAnimated:YES completion:nil];
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:KRLANGGECE(@"dialog_sure")
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                if (callback) {
                                                    callback(picker.date);
                                                }
                                            }]];
    
    [alert initActions];
    UIPopoverPresentationController *popoverController = alert.popoverPresentationController;
    popoverController.sourceView = nav.topViewController.view;
    popoverController.sourceRect = [nav.topViewController.view bounds];
    [nav presentViewController:alert animated:YES completion:nil];
    
}
@end

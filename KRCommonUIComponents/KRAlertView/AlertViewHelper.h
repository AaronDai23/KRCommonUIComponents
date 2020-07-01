//
//  AlertViewHelper.h
//  kreditbro
//
//  Created by 戴培琼 on 2019/3/26.
//  Copyright © 2019 lai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//@class CountryCodeModel;

NS_ASSUME_NONNULL_BEGIN

@interface AlertViewHelper : NSObject
+ (instancetype) shareInstance;
//+ (void) alertCountryCodeSelectView:(NSArray *)datas confirm:(void (^ )(CountryCodeModel *model)) confirm;
/**
 *日期选择框
 */
+ (void) alertDatePickerByNav:(UINavigationController *) nav dateType:(UIDatePickerMode) dateType callback:(void(^)(NSDate *date)) callback;

@end

NS_ASSUME_NONNULL_END

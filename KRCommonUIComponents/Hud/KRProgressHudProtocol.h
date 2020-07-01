//
//  KRProgressHudProtocol.h
//  KRCommonUIComponents
//
//  Created by 戴培琼 on 2020/7/1.
//  Copyright © 2020 戴培琼. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KRProgressHudProtocol <NSObject>
+ (void)showloding;
+ (void)show:(nullable NSString*)message;
+ (void)dismiss;
+ (void)showSuccessWithStatus:(nullable NSString*)message;
+ (void)showErrorWithStatus:(nullable NSString*)message;
+ (void)showOnlyStr:(NSString *)info;
@end

NS_ASSUME_NONNULL_END

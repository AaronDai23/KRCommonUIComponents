//
//  AlertBaseVC.m
//  NewGuardLife
//
//  Created by tz on 16/11/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AlertVC.h"
#import <KRCommonComponents/FontTools.h>
#import <KRCommonComponents/ColorTools.h>

@interface AlertVC ()

@end

@implementation AlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.title == nil) {
        self.title = @"";
    }
    //修改title
    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:self.title];
    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:KBlackColor range:NSMakeRange(0, self.title.length)];
    [alertControllerStr addAttribute:NSFontAttributeName value:KRFont(16) range:NSMakeRange(0, self.title.length)];
    [self setValue:alertControllerStr forKey:@"attributedTitle"];
    //修改message
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:self.message];
    
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:KRFont(14) range:NSMakeRange(0, self.message.length)];
    [self setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    
    
    
}

- (void) initActions {
    @try {
        for (int i = 0; i < self.actions.count; i++) {
            UIAlertAction *item = self.actions[i];
            if (i == self.actions.count - 1) {
                [item setValue:KRedColor forKey:@"titleTextColor"];
            }else{
                [item setValue:KBlackColor forKey:@"titleTextColor"];
            }
        }
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.reason);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

//
//  Macros.h
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#pragma mark - UI / 屏幕、控件尺寸

#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define isRetina                  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad                     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define BottomEdgeYOfView(view)   view.frame.origin.y + view.frame.size.height
// 屏幕高度
#define SCREEN_HEIGHT             [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH              [[UIScreen mainScreen] bounds].size.width
#define FULL_WIDTH                SCREEN_WIDTH
#define FULL_HEIGHT               (SCREEN_HEIGHT - ((SYSTEM_VERSION >= 7) ? 0 : STATUSBAR_HEIGHT))
#define CONTENT_HEIGHT            (FULL_HEIGHT - NAVBAR_HEIGHT)

#define Device_Is_iPhone5         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhone6         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhone6Plus     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define DEVICE_UUID               [[[UIDevice currentDevice] identifierForVendor] UUIDString]

#define KEYBOARD_HEIGHT           216

// 字体
#pragma mark - font
#define FontWithNameSize(name, size)    [UIFont fontWithName:name size:size]
#define FontWithSize(size)              [UIFont systemFontOfSize:size]
#define ScoreFontWithSize(fontSize)     [UIFont fontWithName:@"Bradley Hand" size:fontSize]
#define BoldFontWithSize(size)          [UIFont boldSystemFontOfSize:size]
#define BoldSystemFont(size)            [UIFont boldSystemFontOfSize:size]
#define systemFont(size)                [UIFont systemFontOfSize:size]

#pragma mark - GCD
// 单例
#define DISPATCH_ONCE_BLOCK(onceBlock); static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

// 是否为中文
#define IS_CH_SYMBOL(chr)               ((int)(chr)>127)
#define StringByTrimWhiteSpace(text)    [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
#define IsStringEmpty(string)           (!string || [@"" isEqualToString:string])
#define IsStringNotEmpty(string)        (string && ![@"" isEqualToString:string])

//详细的数据
//武器锻造－武器配方
#define RECIPT_SECTION1_1               @[@"单手剑", @"双手剑", @"短剑", @"矛", @"斧", @"爪", @"鞭", @"锤", @"回旋镖"]
#define RECIPT_SECTION1_1_SUB           @[@[@"武器配方", @"家具配方", @"庭具配方"],\
                                        @[@"防具锻造配方"],\
                                        @[@"道具配方", @"家具配方", @"庭具配方", @"素材配方"],\
                                        @[@"武器配方", @"家具配方", @"庭具配方", @"钓竿配方"],\
                                        @[@"防具配方", @"家具配方"],\
                                        @[@"肉料理配方", @"鱼料理配方", @"意面和米饭配方", @"甜点配方"],\
                                        @[@"防具锻造配方"],\
                                        @[@"防具锻造配方"],\
                                        @[@"防具锻造配方"]]
#define RECIPT_SECTION1_1_SUB_IMAGE     @[@[@"section1", @"section1", @"section1"],\
                                        @[@"section2"],\
                                        @[@"section3", @"section3", @"section3", @"section3"],\
                                        @[@"section4", @"section4", @"section4", @"section4"],\
                                        @[@"section5", @"section5"],\
                                        @[@"section6", @"section6", @"section6", @"section6"],\
                                        @[@"section2"],\
                                        @[@"section2"],\
                                        @[@"section2"]]
//武器锻造－家具配方
//武器锻造－庭具配方
//防具锻造－防具锻造配方
//道具锻造－道具配方
//道具锻造－家具配方
//道具锻造－庭具配方
//道具锻造－素材配方
//木工－武器配方
//木工－家具配方
//木工－庭具配方
//木工－钓竿配方
//裁缝－防具配方
//裁缝－家具配方
//烹饪－肉料理配方
//烹饪－鱼料理配方
//烹饪－意面和米饭配方
//烹饪－甜点配方

#endif /* Macros_h */

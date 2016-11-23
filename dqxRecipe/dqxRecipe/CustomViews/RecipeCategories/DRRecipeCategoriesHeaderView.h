//
//  DRRecipeCategoriesHeaderView.h
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#ifndef DRRecipeCategoriesHeaderView_h
#define DRRecipeCategoriesHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kDRRecipeCategoriesHeaderViewID;

@interface DRRecipeCategoriesHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* DRRecipeCategoriesHeaderView_h */

//
//  DRRecipeCategoriesCell.h
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#ifndef DRRecipeCategoriesCell_h
#define DRRecipeCategoriesCell_h

#import "DRBaseCell.h"

FOUNDATION_EXPORT NSString *const kRecipeCategoriesCellID;

@interface DRRecipeCategoriesCell : DRBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithTitle:(NSString *)title imageName:(NSString *)imageName atIndexPath:(NSIndexPath *)indexPath;

@end

#endif /* DRRecipeCategoriesCell_h */

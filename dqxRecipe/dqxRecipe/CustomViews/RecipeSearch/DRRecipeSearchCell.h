//
//  DRRecipeSearchCell.h
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/27.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#ifndef DRRecipeSearchCell_h
#define DRRecipeSearchCell_h

#import "DRBaseCell.h"
FOUNDATION_EXPORT NSString *const kDRRecipeSearchCellID;

@class DRRecipeSearchItem;

@interface DRRecipeSearchCell : DRBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSearchItem:(DRRecipeSearchItem *)item;

@end

#endif /* DRRecipeSearchCell_h */

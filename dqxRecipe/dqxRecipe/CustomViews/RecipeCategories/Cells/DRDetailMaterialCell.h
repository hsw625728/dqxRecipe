//
//  DRDetailMaterialCell.h
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/25.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#ifndef DRDetailMaterialCell_h
#define DRDetailMaterialCell_h
#import "DRBaseCell.h"

FOUNDATION_EXPORT NSString *const kDRDetailMaterialCellID;

@interface DRDetailMaterialCell : DRBaseCell

+ (CGFloat)cellHeight;

- (void)set:(NSString*)name iconName:(NSString*)icon neceNum:(NSString*)nec;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *neceNumLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;

@end

#endif /* DRDetailMaterialCell_h */


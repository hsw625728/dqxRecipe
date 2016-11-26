//
//  DRDetailMaterialCell.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/25.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRDetailMaterialCell.h"
#import "View+MASAdditions.h"

NSString *const kDRDetailMaterialCellID = @"DRDetailMaterialCellID";

@implementation DRDetailMaterialCell


+ (CGFloat)cellHeight {
    return DRTableViewHigh;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _iconView.image = nil;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews {
    if (_iconView) {
        return;
    }
    
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    _iconView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@DRTableViewHigh);
            make.top.left.equalTo(self.contentView);
        }];
        
        imageView;
    });
    
    _nameLabel = ({
        UILabel *label = [UILabel new];
        label.font = FontWithSize(14);
        label.textColor = [UIColor colorWithWhite:72 / 255.0 alpha:1];// #484848
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(_iconView.mas_right).offset(8);
        }];
        
        label;
    });
    
    
    _neceNumLabel = ({
        UILabel *label = [UILabel new];
        label.font = FontWithSize(14);
        label.textColor = [UIColor colorWithWhite:72 / 255.0 alpha:1];// #484848
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView.mas_right).offset(-60);
        }];
        
        label;
    });
    

}


- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (float)baseHeight
{
    return 62 - [DRDetailMaterialCell storageHeight];
}
+ (float)storageHeight
{
    return 18;
}

+ (float)calcHeight:(NSDictionary*)dic
{
    NSArray *storageList = [dic objectForKey:@"storageList"];
    int storageNum = 0;
    if( !ISNULL(storageList) ) storageNum = (int)[storageList count];
    return [DRDetailMaterialCell baseHeight] + [DRDetailMaterialCell storageHeight]*storageNum;
}

- (void)set:(NSString*)name iconName:(NSString*)icon neceNum:(NSString*)nec
{
    self.nameLabel.text     = name;
    self.neceNumLabel.text  = [NSString stringWithFormat:@"%@个", nec];
    
    self.iconView.image = [UIImage imageNamed:icon];
}

@end

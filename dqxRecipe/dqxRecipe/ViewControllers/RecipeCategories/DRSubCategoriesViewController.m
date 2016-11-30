//
//  DRSubCategoriesViewController.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/24.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DRSubCategoriesViewController.h"
#import "UIImage+Common.h"
#import "DRRecipeCategoriesCell.h"
#import "DRRecipeCategoriesHeaderView.h"
#import "View+MASAdditions.h"
#import "DRDetailMaterialViewController.h"

@interface DRSubCategoriesViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DRSubCategoriesViewController{
    NSArray *sectionTitles;
    NSArray *rowTitles;
    NSArray *rowImageNames;
}

#pragma mark - Lifecycle

- (void)dealloc {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.navigationItem.title = @"";
    
    //[self addNavigationBarLeftSearchItem];
    [self setupViews];
    
    //导航栏设置
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    self.navigationItem.title = _viewTitleStr;
}
#pragma mark - Private Method

- (void)initDatas {
    switch(self.index)
    {
        case 11:
            _viewTitleStr = @"武器配方";
            sectionTitles = RECIPT_SECTION1_1;
            rowTitles = RECIPT_SECTION1_1_SUB;
            rowImageNames = RECIPT_SECTION1_1_SUB_IMAGE;
            break;
        case 12:
            _viewTitleStr = @"家具配方";
            sectionTitles = RECIPT_SECTION1_2;
            rowTitles = RECIPT_SECTION1_2_SUB;
            rowImageNames = RECIPT_SECTION1_2_SUB_IMAGE;
            break;
        case 13:
            _viewTitleStr = @"庭具配方";
            sectionTitles = RECIPT_SECTION1_3;
            rowTitles = RECIPT_SECTION1_3_SUB;
            rowImageNames = RECIPT_SECTION1_3_SUB_IMAGE;
            break;
        case 21:
            _viewTitleStr = @"防具锻造配方";
            sectionTitles = RECIPT_SECTION2_1;
            rowTitles = RECIPT_SECTION2_1_SUB;
            rowImageNames = RECIPT_SECTION2_1_SUB_IMAGE;
            break;
        case 31:
            _viewTitleStr = @"道具配方";
            sectionTitles = RECIPT_SECTION3_1;
            rowTitles = RECIPT_SECTION3_1_SUB;
            rowImageNames = RECIPT_SECTION3_1_SUB_IMAGE;
            break;
        case 32:
            _viewTitleStr = @"家具配方";
            sectionTitles = RECIPT_SECTION3_2;
            rowTitles = RECIPT_SECTION3_2_SUB;
            rowImageNames = RECIPT_SECTION3_2_SUB_IMAGE;
            break;
        case 33:
            _viewTitleStr = @"庭具配方";
            sectionTitles = RECIPT_SECTION3_3;
            rowTitles = RECIPT_SECTION3_3_SUB;
            rowImageNames = RECIPT_SECTION3_3_SUB_IMAGE;
            break;
        case 34:
            _viewTitleStr = @"素材配方";
            sectionTitles = RECIPT_SECTION3_4;
            rowTitles = RECIPT_SECTION3_4_SUB;
            rowImageNames = RECIPT_SECTION3_4_SUB_IMAGE;
            break;
        case 41:
            _viewTitleStr = @"武器配方";
            sectionTitles = RECIPT_SECTION4_1;
            rowTitles = RECIPT_SECTION4_1_SUB;
            rowImageNames = RECIPT_SECTION4_1_SUB_IMAGE;
            break;
        case 42:
            _viewTitleStr = @"家具配方";
            sectionTitles = RECIPT_SECTION4_2;
            rowTitles = RECIPT_SECTION4_2_SUB;
            rowImageNames = RECIPT_SECTION4_2_SUB_IMAGE;
            break;
        case 43:
            _viewTitleStr = @"庭具配方";
            sectionTitles = RECIPT_SECTION4_3;
            rowTitles = RECIPT_SECTION4_3_SUB;
            rowImageNames = RECIPT_SECTION4_3_SUB_IMAGE;
            break;
        case 44:
            _viewTitleStr = @"钓竿配方";
            sectionTitles = RECIPT_SECTION4_4;
            rowTitles = RECIPT_SECTION4_4_SUB;
            rowImageNames = RECIPT_SECTION4_4_SUB_IMAGE;
            break;
        case 51:
            _viewTitleStr = @"防具配方";
            sectionTitles = RECIPT_SECTION5_1;
            rowTitles = RECIPT_SECTION5_1_SUB;
            rowImageNames = RECIPT_SECTION5_1_SUB_IMAGE;
            break;
        case 52:
            _viewTitleStr = @"家具配方";
            sectionTitles = RECIPT_SECTION5_2;
            rowTitles = RECIPT_SECTION5_2_SUB;
            rowImageNames = RECIPT_SECTION5_2_SUB_IMAGE;
            break;
        case 61:
            _viewTitleStr = @"肉料理配方";
            sectionTitles = RECIPT_SECTION6_1;
            rowTitles = RECIPT_SECTION6_1_SUB;
            rowImageNames = RECIPT_SECTION6_1_SUB_IMAGE;
            break;
        case 62:
            _viewTitleStr = @"鱼料理配方";
            sectionTitles = RECIPT_SECTION6_2;
            rowTitles = RECIPT_SECTION6_2_SUB;
            rowImageNames = RECIPT_SECTION6_2_SUB_IMAGE;
            break;
        case 63:
            _viewTitleStr = @"意面和米饭配方";
            sectionTitles = RECIPT_SECTION6_3;
            rowTitles = RECIPT_SECTION6_3_SUB;
            rowImageNames = RECIPT_SECTION6_3_SUB_IMAGE;
            break;
        case 64:
            _viewTitleStr = @"甜点配方";
            sectionTitles = RECIPT_SECTION6_4;
            rowTitles = RECIPT_SECTION6_4_SUB;
            rowImageNames = RECIPT_SECTION6_4_SUB_IMAGE;
            break;
        default:
            break;
    }
}

- (void)setupViews {
    //_headerView = [[MLBUserHomeHeaderView alloc] initWithUserType:MLBUserTypeMe];
    //[_headerView configureHeaderViewForTestMe];
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DRViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DRRecipeCategoriesCell class] forCellReuseIdentifier:kRecipeCategoriesCellID];
        [tableView registerClass:[DRRecipeCategoriesHeaderView class] forHeaderFooterViewReuseIdentifier:kDRRecipeCategoriesHeaderViewID];
        tableView.rowHeight = [DRRecipeCategoriesCell cellHeight];
        
        /*
         UIImageView *headerImageView = [[UIImageView alloc] initWithImage:[UIImage mlb_imageWithName:@"personalBackgroundImage" cached:NO]];
         headerImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 206);
         headerImageView.contentMode = UIViewContentModeScaleAspectFill;
         ParallaxHeaderView *parallaxHeaderView = [ParallaxHeaderView parallaxHeaderViewWithSubView:headerImageView];
         
         UIImageView *shadowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"movie_shadow"]];
         [parallaxHeaderView addSubview:shadowView];
         [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.height.equalTo(@50);
         make.left.bottom.right.equalTo(parallaxHeaderView);
         }];
         
         [parallaxHeaderView addSubview:_headerView];
         [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.height.equalTo(@([_headerView viewHeight]));
         make.left.bottom.right.equalTo(parallaxHeaderView);
         }];
         
         tableView.tableHeaderView = parallaxHeaderView;
         */
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[(ParallaxHeaderView *)_tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = rowTitles[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DRRecipeCategoriesCell *cell = [tableView dequeueReusableCellWithIdentifier:kRecipeCategoriesCellID forIndexPath:indexPath];
    [cell configureCellWithTitle:rowTitles[indexPath.section][indexPath.row] imageName:rowImageNames[indexPath.section][indexPath.row] atIndexPath:indexPath];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DRRecipeCategoriesHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DRRecipeCategoriesHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDRRecipeCategoriesHeaderViewID];
    view.titleLabel.text = sectionTitles[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DRDetailMaterialViewController *materialController = [[DRDetailMaterialViewController alloc] init];
    [materialController setItemName:rowTitles[indexPath.section][indexPath.row]];
    [self.navigationController pushViewController:materialController animated:YES];
    
    
    NSMutableArray *history;
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
    
    history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (ISNULL(history))
        history = [[NSMutableArray alloc] init];
    
    [history addObject:rowTitles[indexPath.section][indexPath.row]];
    if (history.count > 60)
        [history removeObjectAtIndex:0];
    
    [NSKeyedArchiver archiveRootObject:history toFile:path];
}




@end

//
//  DRCategoriesViewController.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRCategoriesViewController.h"
#import "UIImage+Common.h"
#import "DRRecipeCategoriesCell.h"
#import "DRRecipeCategoriesHeaderView.h"
#import "View+MASAdditions.h"

@interface DRCategoriesViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DRCategoriesViewController{
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
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_home_title"]];
    self.navigationItem.titleView = titleView;
    
    [self addNavigationBarLeftSearchItem];
    [self setupViews];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
}
#pragma mark - Private Method

- (void)initDatas {
    sectionTitles = @[@"收藏", @"设置"];
    rowTitles = @[@[@"图文", @"文章", @"电影", @"消息"], @[@"其他设置", @"登录"]];
    rowImageNames = @[@[@"tab_home_normal", @"tab_read_normal", @"tab_movie_normal", @"tab_music_normal"], @[@"center_setting", @"nav_me_normal"]];
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
    
    if (indexPath.section == 1 && indexPath.row == 1)
    {
        //[self presentLoginOptsViewController];
        return;
    }
    
    //[self.navigationController pushViewController:[[MLBSettingsViewController alloc] init] animated:YES];
}




@end

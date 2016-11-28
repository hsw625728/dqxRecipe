//
//  DRRecipeHistoryViewController.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/28.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRRecipeHistoryViewController.h"
#import "UIImage+Common.h"
#import "DRRecipeCategoriesCell.h"
#import "DRRecipeCategoriesHeaderView.h"
#import "View+MASAdditions.h"
#import "DRDetailMaterialViewController.h"

@interface DRRecipeHistoryViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DRRecipeHistoryViewController{
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
    
    self.navigationItem.title = DRRecipeHistory;
    
    //[self addNavigationBarLeftSearchItem];
    //[self addNavigationBarRightMeItem];
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initDatas];
    [_tableView reloadData];
}

#pragma mark - Private Method

- (void)initDatas {
    NSMutableArray *history;
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
    
    history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if (ISNULL(history))
        history = [[NSMutableArray alloc] initWithObjects:@"(｡◕ˇ∀ˇ◕）近期没有浏览任何数据╮(╯▽╰)╭", nil];
                   //addObject:@"(｡◕ˇ∀ˇ◕）近期没有浏览任何数据╮(╯▽╰)╭"];
    
    NSArray *list;
    list = [history copy];
    
    sectionTitles = @[@"近期浏览列表"];
    rowTitles = @[[[list reverseObjectEnumerator] allObjects]];
    rowImageNames = @[[[list reverseObjectEnumerator] allObjects]];
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DRViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DRRecipeCategoriesCell class] forCellReuseIdentifier:kRecipeCategoriesCellID];
        [tableView registerClass:[DRRecipeCategoriesHeaderView class] forHeaderFooterViewReuseIdentifier:kDRRecipeCategoriesHeaderViewID];
        tableView.rowHeight = [DRRecipeCategoriesCell cellHeight];
        
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
    [cell configureCellWithTitle:rowTitles[indexPath.section][indexPath.row] imageName:[NSString stringWithFormat:@"Icon-%@", rowImageNames[indexPath.section][indexPath.row]] atIndexPath:indexPath];
    
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
}




@end

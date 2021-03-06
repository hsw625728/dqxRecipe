//
//  DRDetailMaterialViewController.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/25.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRDetailMaterialViewController.h"
#import "DRRecipeCategoriesHeaderView.h"
#import "DRDetailMaterialCell.h"
#import "UIImage+Common.h"
#import "View+MASAdditions.h"
#import "GoogleMobileAds/GoogleMobileAds.h"

@interface DRDetailMaterialViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) GADNativeExpressAdView  *expressView;

@end

@implementation DRDetailMaterialViewController{
    NSArray *sectionTitles;
    NSArray *names;
    NSArray *nums;
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
 
    /*
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_search"]];
    self.navigationItem.titleView = titleView;
    
    [self addNavigationBarLeftSearchItem];
    [self addNavigationBarRightMeItem];
    [self setupViews];
    */
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
    [self initDatas];
    
    [self setupViews];
    [_tableView registerNib:[UINib nibWithNibName:@"DRDetailMaterialHeaderCell" bundle:nil] forCellReuseIdentifier:@"DRDetailMaterialHeaderCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"DRDetailMaterialCell" bundle:nil] forCellReuseIdentifier:@"DRDetailMaterialCell"];
    //首页最下方常驻的Google广告
    /*
    NSMutableArray *history;
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
    
    history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (ISNULL(history))
    history = [[NSMutableArray alloc] init];
    //if (history.count >= 0)
    //{
    _expressView = [[GADNativeExpressAdView alloc] initWithFrame:CGRectMake(0.0,
                                                                  self.view.frame.size.height -
                                                                  150,
                                                                  self.view.frame.size.width,
                                                                  150)];
    //NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    //中等高度原生广告位
    _expressView.adUnitID = @"ca-app-pub-9308902363520222/8538756195";
    //Google AdMob提供的测试广告ID
    //_expressView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    
    _expressView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    //request.testDevices = @[ @"66fc40441247f9df253bbcaa32f528bb" ];
    [_expressView loadRequest:request];
    
    [self.view addSubview:_expressView];
    [_expressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@150);
        make.bottom.left.equalTo(self.view);
    }];
    //}
     */
}
#pragma mark - Private Method

- (void)initDatas {
    /*
    sectionTitles = @[@"史莱姆大剑"];
    names = @[@[@"铜矿石", @"铁矿石", @"秘银矿石", @"瑟银矿石"]];
    nums = @[@[@"11", @"22", @"33", @"9999"]];
    rowImageNames = @[@[@"11", @"22", @"33", @"9999"]];
    */
    //计算材料的数量
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:RECIPT_DETAIL, nil];
    NSString *detail = [dic objectForKey:[[NSString alloc] initWithString:_itemName]];
    NSArray *itemsAndNum = [detail componentsSeparatedByString:@","];
    int itemNum = 0;
    for (NSString* str in itemsAndNum)
    {
        if (![str isEqualToString:@"0"])
        {
            itemNum++;
        }
        else
        {
            break;
        }
    }

    //设置武器名称
    sectionTitles = @[_itemName];
    
    //设置每一种材料的名称和数量和图标
    switch (itemNum)
    {
        case 2:
            names = @[@[itemsAndNum[0]]];
            nums = @[@[itemsAndNum[1]]];
            rowImageNames = @[@[[NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[0]]]];
            break;
        case 4:
            names = @[@[itemsAndNum[0], itemsAndNum[2]]];
            nums = @[@[itemsAndNum[1], itemsAndNum[3]]];
            rowImageNames = @[@[[NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[0]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[2]]]];
            break;
        case 6:
            names = @[@[itemsAndNum[0], itemsAndNum[2], itemsAndNum[4]]];
            nums = @[@[itemsAndNum[1], itemsAndNum[3], itemsAndNum[5]]];
            rowImageNames = @[@[[NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[0]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[2]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[4]]]];
            break;
        case 8:
            names = @[@[itemsAndNum[0], itemsAndNum[2], itemsAndNum[4], itemsAndNum[6]]];
            nums = @[@[itemsAndNum[1], itemsAndNum[3], itemsAndNum[5], itemsAndNum[7]]];
            rowImageNames = @[@[[NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[0]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[2]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[4]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[6]]]];
            break;
        case 10:
            names = @[@[itemsAndNum[0], itemsAndNum[2], itemsAndNum[4], itemsAndNum[6], itemsAndNum[8]]];
            nums = @[@[itemsAndNum[1], itemsAndNum[3], itemsAndNum[5], itemsAndNum[7], itemsAndNum[9]]];
            rowImageNames = @[@[[NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[0]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[2]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[4]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[6]], [NSString stringWithFormat:@"Icon-%@.png", itemsAndNum[8]]]];
            break;
        default:
            break;
    }
}

- (void)setupViews {
    //_headerView = [[MLBUserHomeHeaderView alloc] initWithUserType:MLBUserTypeMe];
    //[_headerView configureHeaderViewForTestMe];
    
    _tableView.dataSource = self;
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DRViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DRDetailMaterialCell class] forCellReuseIdentifier:kDRDetailMaterialCellID];
        [tableView registerClass:[DRRecipeCategoriesHeaderView class] forHeaderFooterViewReuseIdentifier:kDRRecipeCategoriesHeaderViewID];
        tableView.rowHeight = [DRDetailMaterialCell cellHeight];
        
 
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
//Table的section数目
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//制定section中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = names[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DRDetailMaterialCell *cell = [tableView dequeueReusableCellWithIdentifier:kDRDetailMaterialCellID forIndexPath:indexPath];
    [cell set:names[indexPath.section][indexPath.row] iconName:rowImageNames[indexPath.section][indexPath.row] neceNum:nums[indexPath.section][indexPath.row]];
    
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
    
    return;
}

@end

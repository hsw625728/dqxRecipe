//
//  DRSearchViewController.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/27.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRSearchViewController.h"
#import "DRRecipeSearchCell.h"
#import "DRRecipeSearchItem.h"
#import "View+MASAdditions.h"
#import "DRDetailMaterialViewController.h"

@interface DRSearchViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UIImageView *hintView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation DRSearchViewController{
    NSMutableArray *dataSource;
}

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initDatas];
    [self setupViews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_searchBar becomeFirstResponder];
}

#pragma mark - Private Method

- (void)initDatas {
    dataSource = [NSMutableArray arrayWithCapacity:4];
}

- (void)setupViews {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.placeholder = @"输入道具名称关键字";
    _searchBar.tintColor = DRLightGrayTextColor;
    _searchBar.returnKeyType = UIReturnKeySearch;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DRRecipeSearchCell class] forCellReuseIdentifier:kDRRecipeSearchCellID];
        tableView.tableFooterView = [UIView new];
        //tableView.emptyDataSetSource = self;
        [self.view addSubview:tableView];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.bottom.right.equalTo(self.view);
        }];
        
        tableView;
    });
    _tableView.hidden = YES;
    
    _hintView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_all"]];
        imageView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(165, 110));
            make.top.equalTo(self.view).offset(114);
            make.centerX.equalTo(self.view);
        }];
        
        imageView;
    });
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = YES;
    [self.view addSubview:_activityIndicatorView];
    [_activityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

#pragma mark - Public Method



#pragma mark - Action

- (void)cancel {
    [_searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Network Request

- (void)searching {
    [_activityIndicatorView startAnimating];
    [dataSource removeAllObjects];
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:RECIPT_DETAIL, nil];
    for (NSString *key in dic)
    {
        if ([key containsString:_searchBar.text])
        {
            [dataSource addObject:key];
        }
    }
    
    //_segmentedControl.hidden = NO;
    _tableView.hidden = NO;
    _hintView.hidden = YES;
    
    [_tableView reloadData];
    [_activityIndicatorView stopAnimating];
    
}


#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
    [self searching];
}

#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"search_null_image"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    
    return [tableView dequeueReusableCellWithIdentifier:kDRRecipeSearchCellID forIndexPath:indexPath];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return [DRRecipeSearchCell cellHeight];
    //return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //DRRecipeSearchItem *model = [self dataByCurrentSearchType][indexPath.row];
    DRRecipeSearchItem *model = [[DRRecipeSearchItem alloc] init];
    model.itemName = dataSource[indexPath.row];
    model.iconName = [NSString stringWithFormat:@"Icon-%@.png", model.itemName];
    [(DRRecipeSearchCell *)cell configureCellWithSearchItem:(DRRecipeSearchItem *)model];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DRDetailMaterialViewController *materialController = [[DRDetailMaterialViewController alloc] init];
    [materialController setItemName:dataSource[indexPath.row]];
    [self.navigationController pushViewController:materialController animated:YES];
    
    NSMutableArray *history;
    NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
    
    history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (ISNULL(history))
        history = [[NSMutableArray alloc] init];
    
    [history addObject:dataSource[indexPath.row]];
    if (history.count > 60)
        [history removeObjectAtIndex:0];
    
    [NSKeyedArchiver archiveRootObject:history toFile:path];
    
}

@end

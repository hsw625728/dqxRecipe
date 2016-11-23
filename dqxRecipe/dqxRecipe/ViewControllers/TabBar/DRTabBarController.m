//
//  DRTabBarControllers.m
//  dqxRecipe
//
//  Created by SHAOWENn HAN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRTabBarController.h"
#import "DRCategoriesViewController.h"

@interface DRTabBarController ()

@end


@implementation DRTabBarController

-(instancetype) init{
    self = [super init];
    if (self)
    {
        DRCategoriesViewController *cateViewController = [[DRCategoriesViewController alloc] init];
        UINavigationController *cateNavigationController = [[UINavigationController alloc] initWithRootViewController:cateViewController];
        cateNavigationController.title = DRCategories;
        
        [self setViewControllers:@[cateViewController]];
        [self setupTabBar];
    }
    return self;
}


- (void)setupTabBar {
    NSArray *tabBarItemImageNames = @[@"tab_home", @"tab_read", @"tab_music", @"tab_movie"];
    NSInteger index = 0;
    
    for (UIViewController *vc in self.viewControllers) {
        NSString *normalImageName =  [NSString stringWithFormat:@"%@_normal", [tabBarItemImageNames objectAtIndex:index]];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected", [tabBarItemImageNames objectAtIndex:index]];
        UIImage *normalImage = [UIImage imageNamed:normalImageName];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        
        vc.tabBarItem.image = normalImage;
        vc.tabBarItem.selectedImage = selectedImage;
        
        index++;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)createCacheFilesFolder {
    NSString *cacheFilesFolderPath = [NSString stringWithFormat:@"%@/%@", DocumentsDirectory, MLBCacheFilesFolderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isDirExist = [fileManager fileExistsAtPath:cacheFilesFolderPath isDirectory:&isDir];
    
    if(!(isDirExist && isDir)) {
        [fileManager createDirectoryAtPath:cacheFilesFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
*/

@end

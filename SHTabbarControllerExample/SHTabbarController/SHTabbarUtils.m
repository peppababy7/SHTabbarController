//
//  SHTabbarUtils.m
//  SHTabbarController
//
//  Created by shuu on 6/11/16.
//  Copyright © 2016 @harushuu. All rights reserved.
//

#import "SHTabbarUtils.h"
#import "SHTabBarController.h"
#import "SHViewController.h"

#define CUSTOM_COLOR [UIColor colorWithRed:98.f/255.f green:211.f/255.f blue:224.f/255.f alpha:1.f]

@interface SHTabbarUtils () <SHTabbarControllerDelegate>
@property (nonatomic, strong) UINavigationController *selectedViewController;

@end

@implementation SHTabbarUtils

#pragma mark - initialization

+ (void)configureTabbarController {
    SHTabbarUtils *tabbarUtils = [[SHTabbarUtils alloc] init];
    [tabbarUtils setupTabbarController];
}

- (void)setupTabbarController {
    SHTabbarDatasourceModel *tabbarDataSource = [[SHTabbarDatasourceModel alloc] init];
    tabbarDataSource.itemsTitle = @[@"contact",  @"message"];
    tabbarDataSource.itemsImageName = @[@"contact_nor",  @"news_nor"];
    tabbarDataSource.itemsSelectedImageName = @[@"contact_selected",  @"news_selected"];
    tabbarDataSource.subControllers = @[
                                        [[SHViewController alloc] init],
                                        [[SHViewController alloc] init],
                                        ];
    tabbarDataSource.centerButtonImageName = @"centerButton";
    SHTabBarController *tabBarViewController = [SHTabBarController configureTabbarControllerWithDataSource:tabbarDataSource withDelegate:self];
    tabBarViewController.tabBar.tintColor = CUSTOM_COLOR;
    [UIView transitionWithView:[[[UIApplication sharedApplication] delegate] window] duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState=[UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:tabBarViewController];
        [UIView setAnimationsEnabled:oldState];
    } completion:nil];
}



#pragma mark - SHTabbarControllerDelegate

- (void)tabbarControllerCustomNavigationController:(NSArray *)navigationControllers {
    for (UINavigationController *navigationController in navigationControllers) {
        NSDictionary *attributes = @{NSForegroundColorAttributeName:CUSTOM_COLOR};
        navigationController.navigationBar.titleTextAttributes = attributes;
        navigationController.navigationBar.tintColor = CUSTOM_COLOR;
    }
    if (!self.selectedViewController) {
        self.selectedViewController = navigationControllers.firstObject;
    }
}


- (void)tabbarControllerDidSelectCenterButton:(UIButton *)button {
    [self pushNewViewController];
}

- (void)tabbarControllerDidSelectedViewController:(UINavigationController *)selectedViewController {
    self.selectedViewController = selectedViewController;
}

- (void)tabbarControllerCustomBarButtonItem:(UIViewController *)viewController {
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemPressed:)];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemPressed:)];
}

#pragma mark - button action

- (void)barButtonItemPressed:(UIBarButtonItem *)button {
    [self pushNewViewController];
}

- (void)pushNewViewController {
    SHViewController *newViewControll = [[SHViewController alloc] init];
    newViewControll.title = @"SubViewController";
    newViewControll.hidesBottomBarWhenPushed = YES;
    [self.selectedViewController pushViewController:newViewControll animated:YES];
}

@end

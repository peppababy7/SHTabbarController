//
//  SHTabBarController.h
//  Pods
//
//  Created by shuu on 6/11/16.
//
//

#import <UIKit/UIKit.h>
#import "SHTabbarDatasourceModel.h"

@protocol SHTabbarControllerDelegate <NSObject>

- (void)tabbarControllerCustomNavigationController:(NSArray *)navigationControllers;
- (void)tabbarControllerDidSelectCenterButton:(UIButton *)button;
- (void)tabbarControllerDidSelectedViewController:(UINavigationController *)selectedViewController;
- (void)tabbarControllerCustomBarButtonItem:(UIViewController *)viewController;

@end

@interface SHTabBarController : UITabBarController
@property (nonatomic, strong) id <SHTabbarControllerDelegate> customDelegate;

+ (SHTabBarController *)configureTabbarControllerWithDataSource:(SHTabbarDatasourceModel *)dataSource withDelegate:(id <SHTabbarControllerDelegate>)delegate;

@end

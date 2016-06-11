//
//  SHTabBarController.m
//  Pods
//
//  Created by shuu on 6/11/16.
//
//

#import "SHTabBarController.h"
#import <BFPaperButton/BFPaperButton.h>

@interface SHTabBarController () <UITabBarControllerDelegate>
@property (nonatomic, strong) UIButton *centerButton;

@end

@implementation SHTabBarController

#pragma mark - initialization

+ (SHTabBarController *)configureTabbarControllerWithDataSource:(SHTabbarDatasourceModel *)dataSource withDelegate:(id <SHTabbarControllerDelegate>)delegate {
    SHTabBarController *tabbarController = [[SHTabBarController alloc] initWithWithDataSource:dataSource withDelegate:delegate];
    return tabbarController;
}

- (instancetype)initWithWithDataSource:(SHTabbarDatasourceModel *)dataSource withDelegate:(id <SHTabbarControllerDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = self;
        self.customDelegate = delegate;
        [self setupControllersWithDataSource:dataSource];
        [self setupTabBar];
        [self addCenterButtonWithImageName:dataSource.centerButtonImageName];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setupControllersWithDataSource:(SHTabbarDatasourceModel *)dataSource {
    NSMutableArray *navigationContollers = [NSMutableArray array];
    [dataSource.subControllers enumerateObjectsUsingBlock:^(UIViewController *controller, NSUInteger index, BOOL *stop) {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        NSString *title = dataSource.itemsTitle[index];
        NSString *normalImage = dataSource.itemsImageName[index];
        NSString *selectedImage = dataSource.itemsSelectedImageName[index];
        UITabBarItem *item = [self createTabBarItemWithTitle:title normalImage:normalImage selectedImage:selectedImage];
        [navigationController setTabBarItem:item];
        [navigationContollers addObject:navigationController];
        controller.navigationItem.title = title;
        if (self.customDelegate && [self.customDelegate respondsToSelector:@selector(tabbarControllerCustomBarButtonItem:)]) {
            [self.customDelegate tabbarControllerCustomBarButtonItem:controller];
        }
    }];
    self.viewControllers = [navigationContollers copy];
    if (self.customDelegate && [self.customDelegate respondsToSelector:@selector(tabbarControllerCustomNavigationController:)]) {
        [self.customDelegate tabbarControllerCustomNavigationController:self.viewControllers];
    }
}

- (void)setupTabBar {
    self.tabBar.translucent = NO;
    self.tabBar.itemWidth = 50;
    self.tabBar.itemSpacing = [UIScreen mainScreen].bounds.size.width * 0.5;
    self.tabBar.itemPositioning = UITabBarItemPositioningCentered;
}

- (UITabBarItem *)createTabBarItemWithTitle:(NSString *)title
                                normalImage:(NSString *)normalImage
                              selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [UITabBarItem new];
    item.title = title;
    item.image = [UIImage imageNamed:normalImage];
    item.selectedImage = [UIImage imageNamed:selectedImage];
    return item;
}

#pragma mark - Prevent crash

- (void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [self.selectedViewController beginAppearanceTransition:YES animated:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.selectedViewController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.selectedViewController beginAppearanceTransition:NO animated:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.selectedViewController endAppearanceTransition];
}

#pragma mark - customCenterButton

- (void)addCenterButtonWithImageName:(NSString *)name {
    self.centerButton = [self setRoundBFPaperButtonWithImageName:name radius:35.f];
    [self.centerButton addTarget:self action:@selector(centerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.centerButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    self.centerButton.frame = CGRectMake(0.0, 0.0, 70, 70);
    self.centerButton.adjustsImageWhenHighlighted = NO;
    self.centerButton.center = CGPointMake(self.view.center.x, 15.f);
    [self.tabBar addSubview:self.centerButton];
    self.tabBar.layer.zPosition = 1;
    self.centerButton.layer.zPosition = 2;
}

- (BFPaperButton *)setRoundBFPaperButtonWithImageName:(NSString *)imageName radius:(CGFloat)radius {
    BFPaperButton *button = [[BFPaperButton alloc] initWithRaised:NO];
    button.usesSmartColor = YES;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.contentMode = UIViewContentModeCenter;
    button.cornerRadius = radius;
    button.rippleFromTapLocation = NO;
    button.rippleBeyondBounds = YES;
    button.tapCircleDiameter = radius * 2 * 1.3;
    button.tapCircleBurstAmount = radius * 2 * 1.3;
    return button;
}

- (void)centerButtonPressed {
    if (self.customDelegate && [self.customDelegate respondsToSelector:@selector(tabbarControllerDidSelectCenterButton:)]) {
        [self.customDelegate tabbarControllerDidSelectCenterButton:self.centerButton];
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (self.customDelegate && [self.customDelegate respondsToSelector:@selector(tabbarControllerDidSelectedViewController:)]) {
        [self.customDelegate tabbarControllerDidSelectedViewController:(UINavigationController *)viewController];
    }
}

@end

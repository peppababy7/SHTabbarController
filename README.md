# SHTabbarController
====================

[![CI Status](http://img.shields.io/travis/@harushuu/SHTabbarController.svg?style=flat)](https://travis-ci.org/@harushuu/SHTabbarController)
[![Version](https://img.shields.io/cocoapods/v/SHTabbarController.svg?style=flat)](http://cocoapods.org/pods/SHTabbarController)
[![License](https://img.shields.io/cocoapods/l/SHTabbarController.svg?style=flat)](http://cocoapods.org/pods/SHTabbarController)
[![Platform](https://img.shields.io/cocoapods/p/SHTabbarController.svg?style=flat)](http://cocoapods.org/pods/SHTabbarController)


## Screenshots
![image](https://github.com/harushuu/SHTabbarController/raw/master/Screenshots.gif)

## Installation

With [CocoaPods](http://cocoapods.org/), add this line to your `Podfile`.

```
pod 'SHTabbarController'
```

and run `pod install`, then you're all done!

## How to use

```objc
    SHTabbarDatasourceModel *tabbarDataSource = [[SHTabbarDatasourceModel alloc] init];

    tabbarDataSource.itemsTitle = @[@"contact",  @"message"];
    tabbarDataSource.itemsImageName = @[@"contact_nor",  @"news_nor"];
    tabbarDataSource.itemsSelectedImageName = @[@"contact_selected",  @"news_selected"];
    tabbarDataSource.subControllers = @[
                                    [[yourViewController alloc] init],
                                    [[yourViewController alloc] init],
                                    ];
    tabbarDataSource.centerButtonImageName = @"centerButton";

    SHTabBarController *tabBarViewController = [SHTabBarController configureTabbarControllerWithDataSource:tabbarDataSource withDelegate:self];
    tabBarViewController.tabBar.tintColor = 'YOUR_COLOR';
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:tabBarViewController];



```

## Requirements

* iOS 8.0+ 
* ARC

## Author

@harushuu, hunter4n@gmail.com

## License

English: SHTabbarController is available under the MIT license, see the LICENSE file for more information.     

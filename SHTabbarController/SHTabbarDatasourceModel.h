//
//  SHTabbarDatasourceModel.h
//  Pods
//
//  Created by shuu on 6/11/16.
//
//

#import <Foundation/Foundation.h>

@interface SHTabbarDatasourceModel : NSObject
@property (nonatomic, strong) NSArray *itemsTitle;
@property (nonatomic, strong) NSArray *itemsImageName;
@property (nonatomic, strong) NSArray *itemsSelectedImageName;
@property (nonatomic, strong) NSArray *subControllers;
@property (nonatomic, strong) NSString *centerButtonImageName;

@end

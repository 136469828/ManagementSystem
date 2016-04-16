//
//  ProjectModel.h
//  ManagementSystem
//
//  Created by admin on 16/4/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectModel : NSObject
@property (nonatomic, copy) NSString *applyManName;// 申请人
@property (nonatomic, copy) NSString *telephone; // 电话
@property (nonatomic, copy) NSString *createTime; // 时间
@property (nonatomic, copy) NSString *natureType; // 项目性质
@property (nonatomic, copy) NSString *test3; // 投资总额
@property (nonatomic, copy) NSString *projectName; // 项目名称
@property (nonatomic, copy) NSString *companyType; // 行业
@property (nonatomic, copy) NSString *categoryType; // 投资种类
@property (nonatomic, copy) NSString *processStatus; // 项目进度标识
@property (nonatomic, copy) NSString *questions; // 存在问题
@property (nonatomic, copy) NSString *classTypeName; // 项目分类
@property (nonatomic, copy) NSString *status; // 项目状态标识

@property (nonatomic, copy) NSString *projectIDofModel;

@end

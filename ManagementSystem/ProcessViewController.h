//
//  ProcessViewController.h
//  ManagementSystem
//
//  Created by JCong on 16/3/10.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProcessViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIView *hearView;
}
@property UITableView *tableView;
@property (nonatomic, assign) int statet;
+(UIViewController *)viewController:(UIView *)view;
@end

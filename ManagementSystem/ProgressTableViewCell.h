
//
//  ProgressTableViewCell.h
//  ManagementSystem
//
//  Created by JCong on 16/3/10.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressTableViewCell : UITableViewCell
@property (nonatomic, assign) int stateSy;
- (void)setState:(int)state;

@end

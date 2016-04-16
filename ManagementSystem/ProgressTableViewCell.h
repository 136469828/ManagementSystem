
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
@property (nonatomic, copy) NSString *stateTitle;
- (void)setState:(int)state;

@end

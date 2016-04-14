//
//  ProgressTableViewCell.m
//  ManagementSystem
//
//  Created by JCong on 16/3/10.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "ProgressTableViewCell.h"
//#import "JHChainableAnimations.h"
@implementation ProgressTableViewCell

- (void)setState:(int)state{
    self.stateSy = state;
    NSString *stetaStr;
    NSString *phoneNum;
    NSString *nameStr;
//    CGFloat widht;
//    int r,g,b;
    NSLog(@"%d",self.stateSy);
    switch (self.stateSy) {
        case 0:
        {
//            widht = ScreenWidth*0.3;
//            r = 197;  g = 0; b = 35;
            nameStr = @"梁健聪";
            stetaStr = @"审批未通过";
            phoneNum = @"18575523716";
        }
            break;
        case 1:
        {
//            widht = ScreenWidth*0.9;
//            r = 72; g = 157; b = 32;
            nameStr = @"梁健明";
            stetaStr = @"审批通过";
            phoneNum = @"13202601163";
        }
            break;
        case 2:
        {
//            widht = ScreenWidth*0.6;
//            r = 249; g = 220; b = 0;
            nameStr = @"梁健康";
            stetaStr = @"审批中";
            phoneNum = @"136469828";
        }
            break;
            
        default:
            break;
    }
    
//    UIView *prgess = [[UIView alloc] initWithFrame:CGRectMake(10,1.2*self.bounds.size.height, 0, 10)];
//    prgess.layer.cornerRadius = 5;
//    prgess.backgroundColor = [UIColor redColor];
////    prgess.moveWidth(widht*1.8).spring.makeBackground(RGB(r, g, b)).animate(3);
//    [self addSubview:prgess];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(8, 0 , ScreenWidth-16, 100)];
    titleL.text = [NSString stringWithFormat:@"姓        名: %@\n电话号码: %@\n审核状态: %@\n所处部门: iOS开发部",nameStr,phoneNum,stetaStr];
    titleL.numberOfLines = 0;
    titleL.font = [UIFont systemFontOfSize:15];
//    titleL.backgroundColor = RGB(r, g,b);
    [self addSubview:titleL];
}

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

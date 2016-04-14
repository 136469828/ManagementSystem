//
//  DetailsViewController.m
//  ManagementSystem
//
//  Created by JCong on 16/3/11.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
{
    NSArray *dataArr;
}
@property NSArray *titleArr;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleArr = @[
                       @"申请人:"
                      ,@"电话:"
                      ,@"时间:"
                      ,@"项目性质:"
                      ,@"投资总额:"
                      ,@"项目名称:"
                      ,@"行业:"
                      ,@"投资种类:"
                      ,@"工程进度:"
                      ,@"存在问题:"
                      ,@"项目分类:"
                      ,@"当前状态:"
                      ];
    dataArr = @[ @"梁健聪"
                 ,@"18575523716"
                 ,@"2016-03-12"
                 ,@"省重点"
                 ,@"10万"
                 ,@"iOS开发"
                 ,@"科技"
                 ,@"省重点"
                 ,@"正常"
                 ,@"正常"
                 ,@"私企"
                 ,@"审核未通过"];
    [self setTableView];
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 69) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self _initTableViewFootView];
    [self.view addSubview:_tableView];

}
- (void)_initTableViewFootView{
#pragma mark - 设置尾视图
    UIView *footTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, ScreenWidth-40, 64)];
    footTopView.backgroundColor = RGB(239, 239, 244);
    self.tableView.tableFooterView = footTopView;
    
    UIButton *cencelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cencelBtn setTitle:@"撤 销 申 请" forState:UIControlStateNormal];
    cencelBtn.frame = CGRectMake(80, 0, ScreenWidth - 160, 30);
    cencelBtn.layer.cornerRadius = 10;
    [cencelBtn setTintColor:[UIColor whiteColor]];
    cencelBtn.backgroundColor = [UIColor orangeColor];
    [cencelBtn addTarget:self action:@selector(cencelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [footTopView addSubview:cencelBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.text = self.titleArr[indexPath.row];
        UILabel *contentL = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3, 2, ScreenWidth - ScreenWidth/3 - 10, 40)];
        contentL.text = dataArr[indexPath.row];
        contentL.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:contentL];
        if (indexPath.row == 11) {
            contentL.textColor = [UIColor redColor];
        }

    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma cancelAction
- (void)cencelBtnAction{
    NSLog(@"click");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

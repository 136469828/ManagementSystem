//
//  DeclareViewController.m
//  ManagementSystem
//
//  Created by JCong on 16/2/29.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "ProjectSrachViewController.h"
#import "ProjectSeachTableViewCell.h"
#import "ProcessViewController.h"
#import "NetManger.h"
#import "ProjectModel.h"
#import "LCProgressHUD.h"
@interface ProjectSrachViewController ()
{
    NSString *stateStr;
    NetManger *manger;
}
@end

@implementation ProjectSrachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTableView]; // 创建TableView
    [self registerNib]; //注册Cell
    manger= [NetManger shareInstance];
    manger.isKeyword = NO;
    [manger loadData:RequestOfGetprojectlist];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"GetprojectlistWithKeyword" object:nil];
}
#pragma mark - Btn逻辑
- (void)seachOn{
    NSLog(@"clickOn");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView头视图
- (void)hearView{
    
    hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    //    hearView.backgroundColor = [UIColor redColor];
    [self.view addSubview:hearView];
    UITextField *seachTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 80, 30)];
    seachTextField.delegate = self;
    seachTextField.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
    seachTextField.layer.borderWidth = 1.0; // set borderWidth as you want.
    seachTextField.layer.cornerRadius=8.0f;
    seachTextField.layer.masksToBounds=YES;
    
    [hearView addSubview:seachTextField];
    
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [seachBtn setImage:[UIImage imageNamed:@"seachBtn"] forState:UIControlStateNormal];
    seachBtn.frame = CGRectMake(SCREEN_WIDTH - 55, 0, 30, 30);
    //    [seachBtn addTarget:seachTextField action:@selector(seachOnSeach) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:seachBtn];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(8, hearView.bounds.size.height - 1, ScreenWidth - 16, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [hearView addSubview:line];
    
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT - 69) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self hearView];
    _tableView.tableHeaderView = hearView;
    [self.view addSubview:_tableView];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    
    [_tableView addGestureRecognizer:gestureRecognizer];
    
//    self.tableView.estimatedRowHeight = 100;
    
}
#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"ProjectSeachTableViewCell"];
    for (int i = 0 ; i < registerNibs.count; i++) {
        [_tableView registerNib:[UINib nibWithNibName:registerNibs[i] bundle:nil] forCellReuseIdentifier:registerNibs[i]];
    }
    
}
- (void)reloadData
{
    [LCProgressHUD showLoading:@"正在加载"];
    [self.tableView reloadData];
    [self hideHUD];

}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return manger.m_projectInfoArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectSeachTableViewCell *proSeachCell = [_tableView dequeueReusableCellWithIdentifier:@"ProjectSeachTableViewCell"];
    if (manger.m_projectInfoArr.count == 0) {
        if (indexPath.row % 2) {
            statetype = 0;
        }
        else if (indexPath.row % 3)
        {
            statetype = 1;
        }
        else
        {
            statetype = 2;
        }
        switch (statetype) {
            case 0:
            {
                stateStr = @"审批未能获得通过";
                proSeachCell.stateLabel.text = stateStr;
                proSeachCell.stateLabel.textColor = [UIColor redColor];
            }
                break;
            case 1:
            {
                stateStr = @"审批通过";
                proSeachCell.stateLabel.text = stateStr;
                proSeachCell.stateLabel.textColor = [UIColor blackColor];
            }
                break;
            case 2:
            {
                stateStr = @"审批中";
                proSeachCell.stateLabel.text = stateStr;
                proSeachCell.stateLabel.textColor = [UIColor blackColor];
            }
                break;
    
            default:
                break;
        }
        proSeachCell.titleLab.text = @"iOS开发";
        proSeachCell.nameLab.text = @"梁健聪";
        proSeachCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else
    {
        ProjectModel *model = manger.m_projectInfoArr[indexPath.row];
        if ([model.status isEqualToString:@"2"])
        {
            model.status = @"审批未通过";
            proSeachCell.stateLabel.textColor = [UIColor redColor];
        }
        else if ([model.status isEqualToString:@"14"])
        {
            model.status = @"审批中";
        }
        self.ID = model.projectIDofModel;
        NSLog(@"NetManger *manger %@",self.ID);
        proSeachCell.titleLab.text = model.projectName;
        proSeachCell.nameLab.text = model.applyManName;
        proSeachCell.timeLab.text = model.createTime;
        proSeachCell.stateLabel.text = [NSString stringWithFormat:@"当前状态:%@",model.status] ;
        proSeachCell.classTypeLab.text = model.classTypeName;
        proSeachCell.tag = [self.ID integerValue];
        proSeachCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }

    
    return proSeachCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectSeachTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    ProcessViewController *proVC = [[ProcessViewController alloc] init];
    
    NSLog(@"%@",cell.stateLabel.text);

    proVC.statet = (int)cell.tag;
    
    NSLog(@"cellTag%ld",cell.tag);
    proVC.title = @"项目进度";
    [self.navigationController pushViewController:proVC animated:YES];
}
-(void)hideKeyboard
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];//关闭键盘
    
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //    [UIView setAnimationDelay:0.35];
    //
    //    [UIView setAnimationDelegate:self];
    //
    //    _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //    
    //    [UIView commitAnimations];
}
- (void)seachOnSeach{
    NSLog(@"seachOnSeach");
}
- (void)hideHUD {
    
    [LCProgressHUD hide];
}

@end

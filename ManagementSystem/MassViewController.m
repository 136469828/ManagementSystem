//
//  MassViewController.m
//  ManagementSystem
//
//  Created by JCong on 16/3/10.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MassViewController.h"
#import "MassSubViewController.h"
#import "MassTableViewCell.h"
@interface MassViewController ()

@end

@implementation MassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTableView];
    [self registerNib];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView头视图
- (void)hearView{
    
    hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
//        hearView.backgroundColor = [UIColor redColor];
    [self.view addSubview:hearView];
    UITextField *seachTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 120, 30)];
    seachTextField.delegate = self;
    seachTextField.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
    seachTextField.layer.borderWidth = 1.0; // set borderWidth as you want.
    seachTextField.layer.cornerRadius=8.0f;
    seachTextField.layer.masksToBounds=YES;
    
    [hearView addSubview:seachTextField];
    
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [seachBtn setImage:[UIImage imageNamed:@"seachBtn"] forState:UIControlStateNormal];
    seachBtn.frame = CGRectMake(SCREEN_WIDTH - 100, 0, 35, 35);
    //    [seachBtn addTarget:seachTextField action:@selector(seachOnSeach) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:seachBtn];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"contact_add"] forState:UIControlStateNormal];
    addBtn.frame = CGRectMake(SCREEN_WIDTH - 50, -5, 45, 45);
    [addBtn addTarget:self action:@selector(addMassAction) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:addBtn];
    
    
    
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
    
    self.tableView.estimatedRowHeight = 100;
    
}
#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"MassTableViewCell"];
    for (int i = 0 ; i < registerNibs.count; i++) {
        [_tableView registerNib:[UINib nibWithNibName:registerNibs[i] bundle:nil] forCellReuseIdentifier:registerNibs[i]];
    }
    
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     MassTableViewCell*massCell = [_tableView dequeueReusableCellWithIdentifier:@"MassTableViewCell"];
    NSString *contentStrData = @"这个方法的命名和编程行为也是可以学习的。它告诉我们，单例的创建并不都是一成不变的使用sharedXXX方法，也可以使用一个setSharedXXX:传递一个自定义的本类对象，虽然单例对象是外部创建而不是预设的，但是这样创建之后sharedXXX方法依然是获取单例的方法。";
    NSString *contentStr = [NSString stringWithFormat:@"内容：%@",contentStrData];
    massCell.contentLabel.text = contentStr;
    massCell.nameLab.text = @"梁健聪";
    massCell.titleLab.text = @"iOS开发项目";
    massCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return massCell;
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
#pragma mark - Btn逻辑
- (void)seachOn{
    NSLog(@"clickOn");
}
- (void)addMassAction{
//    NSLog(@"clickOn");
    MassSubViewController *massSubVC = [[MassSubViewController alloc] init];
    massSubVC.title = @"新建群发";
    [self.navigationController pushViewController:massSubVC animated:YES];
    
}

@end

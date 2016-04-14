//
//  NormalViewController.m
//  MangerSystem
//
//  Created by JCong on 16/2/25.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "NormalViewController.h"
#import "NormalTableViewCell.h"
@interface NormalViewController ()<UITableViewDataSource,UITableViewDelegate>

@property UITableView *normalTableView;

@end

@implementation NormalViewController

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
- (void)setTableView{
    _normalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    _normalTableView.delegate = self;
    _normalTableView.dataSource = self;
    self.normalTableView.estimatedRowHeight = 100;
    [self.view addSubview:_normalTableView];
    
}
#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"NormalTableViewCell"];
    for (int i = 0 ; i < registerNibs.count; i++) {
        [_normalTableView registerNib:[UINib nibWithNibName:registerNibs[i] bundle:nil] forCellReuseIdentifier:registerNibs[i]];
    }
    
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *normalCell = [_normalTableView dequeueReusableCellWithIdentifier:@"NormalTableViewCell"];
    NSString *contentStrData = @"这个方法的命名和编程行为也是可以学习的。它告诉我们，单例的创建并不都是一成不变的使用sharedXXX方法，也可以使用一个setSharedXXX:传递一个自定义的本类对象，虽然单例对象是外部创建而不是预设的，但是这样创建之后sharedXXX方法依然是获取单例的方法。";
    NSString *contentStr = [NSString stringWithFormat:@"内容：%@",contentStrData];
    normalCell.contentLabel.text = contentStr;
    normalCell.titleLab.text = @"iOS项目";
    normalCell.nameLab.text = @"梁健聪";
    normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return normalCell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 禁用 iOS7 返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 开启
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
@end

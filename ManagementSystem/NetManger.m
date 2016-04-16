//
//  NetManger.m
//  ManagementSystem
//
//  Created by admin on 16/4/12.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "NetManger.h"
#import "AFNetworking.h"
#import "ProjectModel.h"
NSString *NetManagerRefreshNotify = @"NetManagerRefreshNotify";
static NetManger *manger = nil;
@implementation NetManger
// 单例
+ (instancetype)shareInstance{
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        if (!manger) {
            manger = [[[self class] alloc] init];
            
        }
    });
    return manger;
}
- (instancetype)initWith:(RequestState)requet
{
    self = [super init];
    if (self) {
        [self loadData:requet];
    }
    return self;
}
- (void)loadData:(RequestState)requet
{
    switch (requet) {
        case RequestOfGetarticlelist:
        {
            [self articleGetarticlelist];
        }
            break;
        case RequestOfUpload:
        {
            [self fileUpload];
        }
            break;
        case RequestOfGetlist:
        {
            [self advertiseGetlist];
        }
            break;
        case RequestOfLogin:
        {
            [self userLoginName:self.name AndPassword:self.password];
        }
            break;
        case RequestOfUpdate:
        {
            [self userUpdate];
        }
            break;
        case RequestOfGetprojectlist:
        {
            [self homeGetprojectlistWithKeyword:self.isKeyword];
        }
            break;
        case RequestOfGetprojectt:
        {
            [self homeGetprojectWithProjectID:self.projectID];
        }
            break;
        case RequestOfProjectsave:
        {
            [self homeProjectsave];
        }
            break;
        case RequestOfUpdatepassword:
        {
            [self accountUpdatepasswordWithOldPassword:self.oldPword AndNewPassword:self.passwordOfnew];
        }
            break;
        case RequestOfResetpassword:
        {
            [self accountResetpassword];
        }
            break;
        case RequestOfGetlatestversoin:
        {
            [self systemsetGetlatestversoin];
        }
            break;
        case RequestOfAddfeedback:
        {
            [self systemsetAddfeedback];
        }
            break;
        
            
        default:
            break;
    }
}
/*
 ---- 公共接口 ----
 方式	地址	说明
 POST	common/article/getarticlelist
 No documentation available.
 
 POST	common/file/upload
 上传 ResourceType值说明： 1 头像 201 项目图片
 
 POST	common/advertise/getlist
 广告列表
 
 POST	common/user/login
 登录
 
 POST	common/user/update
 修改个人信息
 
 
 ---- 项目管理 ----
 方式	地址	说明
 
 POST	project/home/getprojectlist
 项目列表
 
 POST	project/home/getproject
 项目详情
 
 POST	project/home/projectsave
 保存上报项目
 
 
 ---- 系统设置 ----
 方式	地址	说明
 
 POST	systemset/account/updatepassword
 修改密码
 
 POST	systemset/account/resetpassword
 重置用户密码
 
 POST	systemset/getlatestversoin
 获取最新版本
 
 POST	systemset/addfeedback
 添加系统反馈
 
 POST	systemset/addfeedbacktest
 添加系统反馈测试
 */

// No documentation available.
- (void)articleGetarticlelist
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 @"Keyword": @"sample string 1",
                                 @"PageIndex": @"2",
                                 @"PageSize": @"3"
                                 };
    //@"http://192.168.1.4:88/common/user/login"
    NSString *url = [NSString stringWithFormat:@"%@common/article/getarticlelist",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         NSLog(@"No documentation available：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
    
}
// 上传 ResourceType值说明： 1 头像 201 项目图片
- (void)fileUpload
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 };
    NSString *url = [NSString stringWithFormat:@"%@common/file/upload",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         NSLog(@"上传：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
    
}
// 广告列表
- (void)advertiseGetlist
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 };
    NSString *url = [NSString stringWithFormat:@"%@common/advertise/getlist",ServerAddressURL ];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         NSLog(@"广告列表：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}

// 登录
- (void)userLoginName:(NSString *)name AndPassword:(NSString *)password
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
//                                 @"_code":self.userID_Code,
//                                 @"content":@"application/json",
                                 @"UserName": name,
                                 @"Password": password,
                                 };
    NSString *url = [NSString stringWithFormat:@"%@common/user/login",ServerAddressURL ];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         NSLog(@"登录：%@",responseObject[@"data"]);
         self.code = responseObject[@"code"];
         self.title = responseObject[@"msg"];
         if ([responseObject[@"msg"] isEqualToString:@"success"]) {
             self.userID_Code = responseObject[@"data"][@"Code"];
             NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
             NSMutableArray *m_datas = [[NSMutableArray alloc] initWithCapacity:0];
             for (NSString *str in dic)
             {
                 [m_datas addObject:str];
             }
             for (int i = 0; i<m_datas.count; i++)
             {
//                 NSLog(@"%@",[dic objectForKey:m_datas[i]]);
             }

         }

         [[NSNotificationCenter defaultCenter] postNotificationName:NetManagerRefreshNotify object:responseObject];
         
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
   
}

// 修改个人信息
- (void)userUpdate
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                 @"Code": @"sample string 1",
                                 @"AreaName": @"sample string 2",
                                 @"UserId": @"3",
                                 @"AreaId": @"1",
                                 @"UserType": @"4",
                                 @"UserName": @"sample string 5",
                                 @"PasswordSalt": @"sample string 6",
                                 @"UserPassword": @"sample string 7",
                                 @"CnName": @"sample string 8",
                                 @"EnName": @"sample string 9",
                                 @"Gender": @"1",
                                 @"Mobile": @"sample string 10",
                                 @"RoleName": @"sample string 11",
                                 @"Photo": @"sample string 12",
                                 @"QQ": @"sample string 13",
                                 @"MicroMessage": @"sample string 14",
                                 @"Email": @"sample string 15",
                                 @"Address": @"sample string 16",
                                 @"Remark": @"sample string 17",
                                 @"Status": @"1",
                                 @"CreateUserId": @"1",
                                 @"CreateUserCnName": @"sample string 18",
                                 @"CreateTime": @"2016-04-14 09:48:54",
                                 @"UpdateUserId": @"1",
                                 @"UpdateUserCnName": @"sample string 19",
                                 @"UpdateTime": @"2016-04-14 09:48:54",
                                 @"WorkType": @"1",
                                 @"UserGrade": @"1",
                                 @"Profession": @"1",
                                 @"Age": @"1",
                                 @"C_PersonId": @"1"

                                 };
    NSString *url = [NSString stringWithFormat:@"%@common/user/update",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         NSLog(@"修改个人信息：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}

// 项目列表
- (void)homeGetprojectlistWithKeyword:(BOOL) iskeyword
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = [[NSDictionary alloc] init];
    if (iskeyword == YES) {
        parameters = @{
                       
                       @"_appid":@"101",
                       @"_code":self.userID_Code,
                       @"content":@"application/json",
                       
                       @"Keyword": @"sample string 1",
                       @"Status": @"2",
                       @"PageIndex": @"3",
                       @"PageSize": @"4"
                       
                       };
    }
    else
    {
        parameters = @{
                       @"_appid":@"101",
                       @"_code":self.userID_Code,
                       @"content":@"application/json",
                       @"Status": @"2",
                       };
    }
    NSString *url = [NSString stringWithFormat:@"%@project/home/getprojectlist",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         // Status 14 未通过 2通过
         NSLog(@"项目列表：%@",responseObject[@"data"][@"DataList"]);
         NSArray *dataLists = responseObject[@"data"][@"DataList"];
         NSLog(@"%ld",dataLists.count);
//         for (int i = 0; i< dataLists.count; i++)
//         {
//
//         }
         [self.m_projectInfoArr removeAllObjects];
         for (NSDictionary *dic in dataLists) {
             ProjectModel *model = [[ProjectModel alloc] init];
             //                 NSLog(@"%@",dic[@"ProjectName"]);
             model.applyManName     = [NSString stringWithFormat:@"%@",dic[@"ApplyManName"]];
             model.telephone        = [NSString stringWithFormat:@"%@",dic[@"Telephone"]];
             model.createTime       = [NSString stringWithFormat:@"%@",dic[@"CreateTime"]];
             model.natureType       = [NSString stringWithFormat:@"%@",dic[@"NatureTypeName"]];
             model.test3            = @"暂无";
             model.projectName      = [NSString stringWithFormat:@"%@",dic[@"ProjectName"]];
             model.categoryType     = [NSString stringWithFormat:@"%@",dic[@"CategoryTypeName"]];
             model.companyType      = [NSString stringWithFormat:@"%@",dic[@"CompanyTypeName"]];
             model.processStatus    = [NSString stringWithFormat:@"%@",dic[@"ProcessStatus"]];
             model.questions        = [NSString stringWithFormat:@"%@",dic[@"Questions"]];
             model.classTypeName      = [NSString stringWithFormat:@"%@",dic[@"ClassTypeName"]];
             model.status           = [NSString stringWithFormat:@"%@",dic[@"Status"]];
             model.projectIDofModel = [NSString stringWithFormat:@"%@",dic[@"ProjectId"]];
             if (self.m_projectInfoArr.count == 0)
             {
                 self.m_projectInfoArr = [[NSMutableArray alloc] initWithCapacity:0];
             }
             [self.m_projectInfoArr addObject:model];
             
         }

        [[NSNotificationCenter defaultCenter] postNotificationName:@"GetprojectlistWithKeyword" object:nil];

         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}

// 项目详情
- (void)homeGetprojectWithProjectID :(NSString *)ID
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                 @"Id":ID
                                 };
    NSString *url = [NSString stringWithFormat:@"%@project/home/getproject",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         /*
          @property (nonatomic, copy) NSString *applyManName;// 申请人
          @property (nonatomic, copy) NSString *telephone; // 电话
          @property (nonatomic, copy) NSString *createTime; // 时间
          @property (nonatomic, copy) NSString *natureType; // 项目性质
          @property (nonatomic, copy) NSString *test3; // 投资总额
          @property (nonatomic, copy) NSString *projectName; // 项目名称
          @property (nonatomic, copy) NSString *companyType; // 投资种类
          @property (nonatomic, copy) NSString *categoryType; // 行业
          @property (nonatomic, copy) NSString *processStatus; // 项目进度标识
          @property (nonatomic, copy) NSString *questions; // 存在问题
          @property (nonatomic, copy) NSString *processName; // 项目分类
          @property (nonatomic, copy) NSString *status; // 项目状态标识
          */
         NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
//          NSMutableArray *m_datas = [[NSMutableArray alloc] initWithCapacity:0];
//          for (NSString *str in dic)
//          {
//              [m_datas addObject:str];
//          }
         [self.m_details removeAllObjects];
         for (int i = 0; i<13; i++)
         {
             ProjectModel *model = [[ProjectModel alloc] init];
             model.applyManName     = [NSString stringWithFormat:@"%@",dic[@"ApplyManName"]];
             model.telephone        = [NSString stringWithFormat:@"%@",dic[@"Telephone"]];
             model.createTime       = [NSString stringWithFormat:@"%@",dic[@"CreateTime"]];
             model.natureType       = [NSString stringWithFormat:@"%@",dic[@"NatureTypeName"]];
             model.test3            = @"暂无";
             model.projectName      = [NSString stringWithFormat:@"%@",dic[@"ProjectName"]];
             model.categoryType     = [NSString stringWithFormat:@"%@",dic[@"CategoryTypeName"]];
             model.companyType      = [NSString stringWithFormat:@"%@",dic[@"CompanyTypeName"]];
             model.processStatus    = [NSString stringWithFormat:@"%@",dic[@"ProcessStatus"]];
             model.questions        = [NSString stringWithFormat:@"%@",dic[@"Questions"]];
             model.classTypeName      = [NSString stringWithFormat:@"%@",dic[@"ClassTypeName"]];
             model.status           = [NSString stringWithFormat:@"%@",dic[@"Status"]];

             if (self.m_details.count == 0)
             {
                 self.m_details = [[NSMutableArray alloc] initWithCapacity:0];
             }
             [self.m_details addObject:model];
         }
//         NSMutableArray *m_datas = [[NSMutableArray alloc] initWithCapacity:0];
//         for (NSString *str in dic)
//         {
//             [m_datas addObject:str];
//         }
//         for (int i = 0; i<m_datas.count; i++)
//         {
//            NSLog(@"%@",[dic objectForKey:m_datas[i]]);
//             if (self.m_details.count == 0)
//             {
//                  self.m_details = [[NSMutableArray alloc] initWithCapacity:0];
//             }
//             [self.m_details addObject:[dic objectForKey:m_datas[i]]];
//
//         }
        
         NSLog(@"项目详情：%@",responseObject[@"data"]);
         
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Getproject" object:nil];
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}
// 保存上报项目
- (void)homeProjectsave
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                 @"ProjectId": @"1",
                                 @"ProjectName": @"sample string 2",// 项目名
                                 @"ApplyMan": @"3",
                                 @"ApplyManName": @"sample string 4",
                                 @"Telephone": @"sample string 5", // 电话
                                 @"NatureType": @"6", // 投资种类
                                 @"ClassType": @"7",  // 项目性质
                                 @"CategoryType": @"8", // 项目分类
                                 @"CompanyType": @"9", // 行业
                                 @"Questions": @"sample string 10", // 存在问题
                                 @"ApprovalMan": @"1",
                                 @"ApprovalManName": @"sample string 11", // 同意
                                 @"CreateTime": @"2016-04-14 10:02:11",
                                 @"CreateUserId": @"13",
                                 @"Status": @"14",
                                 @"ProcessId": @"15"
                                 };
    NSString *url = [NSString stringWithFormat:@"%@project/home/projectsave",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         NSLog(@"保存上报项目：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}
// 修改密码
- (void)accountUpdatepasswordWithOldPassword:(NSString *)oldPw AndNewPassword:(NSString *)newPw
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                 @"OldPassword": oldPw,
                                 @"NewPassword": newPw
                                 };
    NSString *url = [NSString stringWithFormat:@"%@systemset/account/updatepassword",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
//         NSLog(@"%@ %@ %@",oldPw,newPw,self.userID_Code);
        NSLog(@"修改密码：%@ %@ %@",responseObject[@"code"],responseObject[@"data"],responseObject[@"msg"]);
         [[NSNotificationCenter defaultCenter] postNotificationName:@"updatepassword" object:responseObject];
         
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}
// 重置用户密码
- (void)accountResetpassword
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                 @"Mobile": @"sample string 1",
                                 @"Code": @"sample string 2",
                                 @"NewPassword": @"sample string 3"
                                 };
    NSString *url = [NSString stringWithFormat:@"%@systemset/account/resetpassword",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
        NSLog(@"重置用户密码：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}

// 获取最新版本

- (void)systemsetGetlatestversoin
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                @"AppId": @"103"
                                 };
    NSString *url = [NSString stringWithFormat:@"%@systemset/getlatestversoin",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
        NSLog(@"获取最新版本：%@",responseObject[@"data"]);
         self.code = responseObject[@"code"];
         self.title = responseObject[@"msg"];
         if ([responseObject[@"msg"] isEqualToString:@"success"]) {
             
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
             NSMutableArray *m_datas = [[NSMutableArray alloc] initWithCapacity:0];
             for (NSString *str in dic)
             {
                 [m_datas addObject:str];
             }
             for (int i = 0; i<m_datas.count; i++)
             {
//                 NSLog(@"%@",[dic objectForKey:m_datas[i]]);
                self.versionName =dic[@"FileDesc"];
             }
             
         }
         
         [[NSNotificationCenter defaultCenter] postNotificationName:@"VersionName" object:self.versionName];
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}
// 添加系统反馈
- (void)systemsetAddfeedback
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"_appid":@"101",
                                 @"_code":self.userID_Code,
                                 @"content":@"application/json",
                                 
                                 @"ClientAppId": @"103",
                                 @"ClientAppVersion": @"sample string 2",
                                 @"Content": @"sample string 3"
                                 };
    NSString *url = [NSString stringWithFormat:@"%@systemset/addfeedback",ServerAddressURL];
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
        NSLog(@"添加系统反馈：%@",responseObject[@"data"]);
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"error : %@",error);
     }];
}

@end

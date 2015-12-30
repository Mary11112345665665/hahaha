//
//  JokesViewController.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "JokesViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import "performanceModel.h"
#import "FrameModel.h"
#import "JokeCell.h"

#define JOKEURL [NSString stringWithFormat:@"http://api.3g.ifeng.com/clientShortNews?type=joke&page=%ld",page]

@interface JokesViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation JokesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    _dataArray = [[NSMutableArray alloc]init];
}
- (void)createTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview: _tableView];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDateFromNet:NO];
    }];
    _tableView.mj_header = header;
    
    
    MJRefreshBackFooter *footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self loadDateFromNet:YES];

    }];
    _tableView.mj_footer = footer;
    
    
    [_tableView.mj_header beginRefreshing];
    
}

- (void)loadDateFromNet:(BOOL)isMore{
    
    NSInteger page = 0;//page从几开始看拼进去网址是否对，%20是看model有多少个元素
    if (isMore) {
        
        if (_dataArray.count%20 == 0) {
            page = _dataArray.count/20 ;
        }
        else{
            [_tableView.mj_footer endRefreshing];
            return;
        }
    }
    NSString *url = JOKEURL;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    
     [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
        if (!isMore) {
            [_dataArray removeAllObjects];
            [_tableView reloadData];
        }
        performanceModel *model = [[performanceModel alloc]initWithData:responseObject error:nil];
         NSArray *bodyArray = model.body;
         

         for (BodyModel *bodymodel in bodyArray) {
            FrameModel *frameModel = [FrameModel new];
            frameModel.bodyModel = bodymodel;
            [_dataArray addObject:frameModel];
            
        
        }
        [_tableView reloadData];

         isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    }];
   
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FrameModel *frameModel = _dataArray[indexPath.row];
    return frameModel.cellHeight;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cellIdentifier";
    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JokeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.cellFrame = _dataArray[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

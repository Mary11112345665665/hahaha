//
//  TopLineViewController.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "TopLineViewController.h"
#import "TopLineModel.h"
#import "TopLineModel1.h"
#import <UIImageView+WebCache.h>
#import "TopLineCell.h"
#import "PituresCell.h"
#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/AFNetworking.h>


#define Headurl  [NSString stringWithFormat:@"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10,SYRECOMMEND&page=%ld",page];
@interface TopLineViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_headerArray;
    NSMutableArray *_dataArray;
    NSMutableArray *_cellPicsArray;
    UIScrollView *_scrollView;
    NSMutableArray *_imageViews;
    
}

@end

@implementation TopLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor cyanColor];
    _cellPicsArray = [NSMutableArray new];
    _headerArray = [NSMutableArray new];
    _dataArray = [NSMutableArray new];
    [self createScrollView];//先创建滚动视图，才能在tableView创建的时候放到TableView的头视图上
    [self createTableView];
    
    
    
}
- (void)createTableView{
    
    //只有将_tableView风格设为UITableViewStyleGrouped，才能贴在头视图上
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) ];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _scrollView;

   
    
    [self.view addSubview:_tableView];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataFromNet:NO];
    }];
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadDataFromNet:YES];
    }];
    _tableView.mj_footer = footer;
    [_tableView.mj_header beginRefreshing];
}

- (void)loadDataFromNet:(BOOL)isMore{
    
    NSInteger page = 1;
    NSString *url = Headurl;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
       
        NSDictionary *dic1 = array[1];
        NSDictionary *dic = array[0];
        
        TopLineModel *content = [[TopLineModel alloc]initWithDictionary:dic error:nil];
        
        
        TopLineModel1 *news = [[TopLineModel1 alloc]initWithDictionary:dic1 error:nil];
        
        for (ItemModel1 *item in news.item) {
           
            [_headerArray addObject:item];
            
        }
  
        // 必须在下载数据调用，如果在头视图才调用，_headerArray就不是过这个之后了，会是空的

        [self createScrollImageView];
        
        for (ItemModel *itemModel in content.item) {
           // NSLog(@"%@",itemModel);
            [_dataArray addObject:itemModel];
        }
       // NSLog(@"%@",_dataArray);
        [_tableView reloadData];
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    }];



}

- (void)createScrollView{
    
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, 0, VIEW_WIDTH, 200);
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled  =YES;
    _scrollView.delegate = self;

}
- (void)createScrollImageView{
    
    
    
    CGSize size = _scrollView.frame.size;
    for (NSInteger i = 0; i < 3; i++) {
        
        UIImageView *view = [[UIImageView alloc]init];
        
        view.frame = CGRectMake(i*size.width, 0, size.width, size.height);
        UILabel *titleLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, size.height-30, size.width, 30)];
        titleLabel1.textAlignment = NSTextAlignmentCenter;
        titleLabel1.textColor = [UIColor whiteColor];
        
        NSURL *url = [NSURL URLWithString:[_headerArray[i] thumbnail]];//
        //ItemModel1 *model = _headerArray[i]; 用数组点不出来，用model才能点
        //NSURL *url = [NSURL URLWithString:model.thumbnail];
        
        [view sd_setImageWithURL:url];
        titleLabel1.text = [_headerArray[i] title];
        //设置填充模式
        view.contentMode = UIViewContentModeScaleAspectFit;
        
        [_scrollView addSubview:view];
        [view addSubview:titleLabel1];
        
    }
    _scrollView.contentSize = CGSizeMake(3*_scrollView.frame.size.width,_scrollView.frame.size.height);
    _scrollView.contentOffset = CGPointZero;//设置从第0页开始
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    ItemModel *itemModel = _dataArray[indexPath.row];
   
       //如果风格itemModel.style存在的话，创建图片cell，itemModel.style.images会崩，因为有style才能有images
    if (itemModel.style) {
       
       PituresCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier2"];
        
        if (imageCell == nil) {
            imageCell = [[PituresCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier2"];
            
        }

        imageCell.model = _dataArray[indexPath.row];
        return imageCell;
    } else {
        TopLineCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier1"];
        if (newsCell == nil) {
            newsCell = [[TopLineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier1"];
            
        }
        
        newsCell.model = _dataArray[indexPath.row];
        
        return newsCell;
    }

    
}
//如果这个高度设置之后会叠加，滚动视图的高
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    return 0;
//}


// tabViewCell设置头视图    tableView创建的同时就会调用，所以数据源开始为nil
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return _scrollView;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
    
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

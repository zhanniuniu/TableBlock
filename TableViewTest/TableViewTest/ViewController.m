//
//  ViewController.m
//  TableViewTest
//
//  Created by zhanlijun on 2017/1/4.
//  Copyright © 2017年 zhanlijun. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "TestCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray arrayWithCapacity:20];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 400) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
    
    
    for (int i= 0; i<100; i++) {
        DataModel *model = [[DataModel alloc] init];
        if (i%40==0) {
            model.isyes = @"1";
        }
        else
        {
            model.isyes = @"0";
        }
        [_dataArray addObject:model];
        [_tableView reloadData];
    }

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    DataModel *model = _dataArray[indexPath.row];
    [cell setContetnView:model.isyes];
    
    cell.block = ^(UIButton *btn,TestCell *mycell)
    {
        NSLog(@"####");
        NSIndexPath *myindexPath = [_tableView indexPathForCell:mycell];
        DataModel *mydataModel = _dataArray[myindexPath.row];
        if ([mydataModel.isyes isEqualToString:@"1"]) {
            mydataModel.isyes = @"0";
        }
        else
        {
            mydataModel.isyes = @"1";
        }
        [_tableView reloadData];
    };
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}



@end

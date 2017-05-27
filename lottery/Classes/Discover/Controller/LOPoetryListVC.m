//
//  LOPoetryListVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOPoetryListVC.h"
#import "LOPoetry.h"
#import "LOPoetryDetailVC.h"

@interface LOPoetryListVC ()

@property (nonatomic, copy) NSArray *poetryArray;
@end

@implementation LOPoetryListVC


- (NSArray *)poetryArray {
    if (!_poetryArray) {
        _poetryArray = [LOPoetry poetryListWithKind:self.kind];
    }
    return _poetryArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.kind;
//    self.navigationItem.leftBarButtonItem.title = @"";
    self.meTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //设置背景图片
    self.meTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
    [self.view addSubview:self.meTableView];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.poetryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    LOPoetry *poetry = self.poetryArray[indexPath.row];
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.textLabel.text = poetry.title;
    cell.detailTextLabel.text = poetry.author;
    
    cell.textLabel.textColor = LOColor(127, 109, 84, 1);
    cell.detailTextLabel.textColor = LOColor(144, 123, 94, 1);
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.001*autoSizeScaleY;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     LOPoetry *poetry = self.poetryArray[indexPath.row];

    LOPoetryDetailVC *PoetryDetailVC = [[LOPoetryDetailVC alloc] init];
    
    PoetryDetailVC.poetry = poetry;
    [self.navigationController pushViewController:PoetryDetailVC animated:YES];

}

@end

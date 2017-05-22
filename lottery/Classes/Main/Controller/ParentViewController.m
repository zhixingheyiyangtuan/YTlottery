//
//  ViewController.m
//  QHealthForDoctor
//
//  Created by 李 志良 on 16/8/10.
//  Copyright © 2016年 李 志良. All rights reserved.
//

#import "ParentViewController.h"
#import "UIButton+touch.h"
#import "SVProgressHUD.h"
@interface ParentViewController ()



@end

@implementation ParentViewController


-(UITableView *)meTableView
{
    if (!_meTableView)
    {
        _meTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _meTableView.delegate = self;
        _meTableView.dataSource = self;
        _meTableView.showsVerticalScrollIndicator = NO;
        _meTableView.backgroundColor = [UIColor whiteColor];
        
        // _meTableView.backgroundColor = [UIColor greenColor];
    }
    return _meTableView;
}


#pragma mark - 设置TableView Separatorinset 分割线从边框顶端开始


//设置section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
     return 10;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
        
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
  
    cell.detailTextLabel.text = @"textContent";
    cell.textLabel.text = @"name";
    return cell;
    
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)viewDidLayoutSubviews
{
    if ([self.meTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.meTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.meTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.meTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}






-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:LOColor(237, 237, 239, 1)];

}

-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName rightBarIteImage:(NSString*)rightImageName{
    if (leftImageName) {
        UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0, 44.0)];
        [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [leftButton addTarget:self action:@selector(leftButtonItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    if (rightImageName) {
        UIButton * rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0, 44.0)];
        if ([rightImageName hasPrefix:@"nav_pho_sao"]) {//扫码图标
            [rightButton setFrame:CGRectMake(0.0, 0.0, 50.0, 71.0)];
            rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        }else{
            rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        }
        [rightButton setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonItemTapped:) forControlEvents:UIControlEventTouchUpInside];
        rightButton.timeInterVal = 1.0;
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    
    [self changeStatusBarBgColor];
}


-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName rightBarFirstItemImage:(NSString*)firstRightImageName rightBarSecondItemImage:(NSString*)secondRightImageName{
    if (leftImageName) {
        UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0, 44.0)];
        [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [leftButton addTarget:self action:@selector(leftButtonItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    if (firstRightImageName) {
        
        UIView *rightView = [[UIView alloc]init];
        rightView.frame = CGRectMake(0, 0, 60.0, 44.0);
       // rightView.backgroundColor = [UIColor greenColor];
        
        UIButton * rightSecondButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 30.0, 44.0)];
        //rightSecondButton.backgroundColor = [UIColor redColor];
       // rightSecondButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        
        [rightSecondButton setImage:[UIImage imageNamed:secondRightImageName] forState:UIControlStateNormal];
        [rightSecondButton addTarget:self action:@selector(rightSecondButtonItemTapped:) forControlEvents:UIControlEventTouchUpInside];
        [rightView addSubview:rightSecondButton];
        
        
        UIButton * rightFirstButton = [[UIButton alloc]initWithFrame:CGRectMake(30.0, 0.0, 30.0, 44.0)];
       // rightFirstButton.backgroundColor = [UIColor redColor];
       // rightFirstButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        
        [rightFirstButton setImage:[UIImage imageNamed:firstRightImageName] forState:UIControlStateNormal];
        [rightFirstButton addTarget:self action:@selector(rightButtonItemTapped:) forControlEvents:UIControlEventTouchUpInside];
        [rightView addSubview:rightFirstButton];
        

        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    
    [self changeStatusBarBgColor];
}




-(void)setCustomNaviViewWithTitle:(NSString*)naviTitle LeftItemImage:(NSString*)leftItemImage RightItemImage:(NSString*)rightItemImage showButton:(BOOL)showButton{
    //设置statusbar颜色
    self.navigationController.navigationBar.hidden = YES;
    UIView * statusBgView = [[UIView alloc]initWithFrame:CGRectMake(0.0,0.0, SCREEN_WIDTH, 20)];
    [statusBgView setBackgroundColor:STATUS_BAR_COLOR];
    [self.view addSubview:statusBgView];
    
    UIView * customNaviView = [[UIView alloc]initWithFrame:CGRectMake(0.0,20.0, SCREEN_WIDTH, 44)];
    [customNaviView setBackgroundColor:NAVI_BAR_COLOR];
    [self.view addSubview:customNaviView];
    
    if (leftItemImage) {
        UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0, 44.0)];
        [leftButton setImage:[UIImage imageNamed:leftItemImage] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(leftButtonItemTapped) forControlEvents:UIControlEventTouchUpInside];
        [customNaviView addSubview:leftButton];
    }
    
    if (naviTitle) {
        UILabel * _naviTitleLabel= [[UILabel alloc]initWithFrame:CGRectMake(70.0, 0.0, SCREEN_WIDTH-140, 44.0)];
        [_naviTitleLabel setText:naviTitle];
        _naviTitleLabel.textColor = [UIColor whiteColor];
        _naviTitleLabel.font = [UIFont boldSystemFontOfSize:18];
        [_naviTitleLabel setTextAlignment:NSTextAlignmentCenter];
        [customNaviView addSubview:_naviTitleLabel];
    }
    
    if (showButton) {
        UIButton * centerButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70-50, 0.0, 50.0, 44.0)];
        [centerButton setImage:[UIImage imageNamed:@"nav_down"] forState:UIControlStateNormal];
        [centerButton addTarget:self action:@selector(centerButtonItemTapped) forControlEvents:UIControlEventTouchUpInside];
        [customNaviView addSubview:centerButton];
    }
    
    if (rightItemImage) {
        UIButton * rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 5.0, 34.0, 34.0)];
        [rightButton setImage:[UIImage imageNamed:rightItemImage] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonItemTapped:) forControlEvents:UIControlEventTouchUpInside];
        [customNaviView addSubview:rightButton];
    }
    
}


-(void)setNavigationBarWithLeftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle{
    if (leftTitle) {
        UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 60.0, 44.0)];
        [leftButton setTitle:leftTitle forState:UIControlStateNormal];
        [leftButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        [leftButton addTarget:self action:@selector(leftButtonItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    if (rightTitle) {
        UIButton * rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 60.0, 44.0)];
        [rightButton setTitle:rightTitle forState:UIControlStateNormal];
        rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
        [rightButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [rightButton addTarget:self action:@selector(rightButtonItemTapped:) forControlEvents:UIControlEventTouchUpInside];
        rightButton.timeInterVal = 1.0;
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}


-(void)leftButtonItemTapped{
    
}

-(void)rightButtonItemTapped{
    
}

-(void)rightButtonItemTapped:(id)sender{
    
}


-(void)rightSecondButtonItemTapped:(id)sender{
    
}

-(void)changeStatusBarBgColor{
    //设置statusbar颜色
    UIView * statusBgView = [[UIView alloc]initWithFrame:CGRectMake(0.0, -20.0, SCREEN_WIDTH, 20)];
    [statusBgView setBackgroundColor:LOColor(66, 98, 126, 1)];
    [self.navigationController.navigationBar addSubview:statusBgView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)setNavigationBarTittle:(NSString*)barTitle{
    UILabel * naviTitle = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 20*barTitle.length, 44.0)];
    [naviTitle setText:barTitle];
    naviTitle.textColor = [UIColor whiteColor];
    naviTitle.font = [UIFont boldSystemFontOfSize:18];
    [naviTitle setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = naviTitle;
}

-(void)showLoadingViewWithMessage:(NSString*)loadingMessage{
    [SVProgressHUD showWithStatus:loadingMessage];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

-(void)showLoadingViewWithOutNaviMessage:(NSString*)loadingMessage{//不包括导航栏
    [SVProgressHUD showWithStatus:loadingMessage];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setBackgroundColor:LOColor(246, 246, 246, 1)];
}

-(void)showWithSuccessMessage:(NSString*)successMessage{
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showSuccessWithStatus:successMessage];
}

-(void)showErrorMessage:(NSString*)errorMessage{
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showErrorWithStatus:errorMessage];
}
-(void)hideLoadingView{
    [SVProgressHUD dismiss];
}

-(void)showAlertViewWithMessage:(NSString*)alertMessage{
    [self.parentAlertLabel setText:alertMessage];
    [self.view addSubview:self.parentAlertLabel];
}

-(void)hideAlertView{
    [self.parentAlertLabel removeFromSuperview];
}

-(UILabel*)parentAlertLabel{
    if (!_parentAlertLabel) {
        _parentAlertLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0.0,SCREEN_WIDTH/4, SCREEN_WIDTH, 20.0)];
        [_parentAlertLabel setTextAlignment:NSTextAlignmentCenter];
        [_parentAlertLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [_parentAlertLabel setTextColor:LOColor(106, 137, 165, 1)];
    }
    return _parentAlertLabel;
}


-(void)hideSubViews{
    for (UIView * tempSubView in self.view.subviews) {
        [tempSubView setHidden:YES];
    }
}

-(void)showSubViews{
    for (UIView * tempSubView in self.view.subviews) {
        [tempSubView setHidden:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

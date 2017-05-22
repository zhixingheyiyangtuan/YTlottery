//
//  ViewController.h
//  QHealthForDoctor
//
//  Created by 李 志良 on 16/8/10.
//  Copyright © 2016年 李 志良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParentViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,retain)UILabel * parentAlertLabel;

-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName rightBarIteImage:(NSString*)rightImageName;
-(void)setNavigationBarWithLeftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle;
-(void)setCustomNaviViewWithTitle:(NSString*)naviTitle LeftItemImage:(NSString*)leftItemImage RightItemImage:(NSString*)rightItemImage showButton:(BOOL)showButton;


-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName rightBarFirstItemImage:(NSString*)firstRightImageName rightBarSecondItemImage:(NSString*)secondRightImageName;

-(void)setNavigationBarTittle:(NSString*)barTitle;
-(void)changeStatusBarBgColor;
-(void)leftButtonItemTapped;
-(void)rightButtonItemTapped:(id)sender;
-(void)rightSecondButtonItemTapped:(id)sender;

-(void)showLoadingViewWithMessage:(NSString*)loadingMessage;
-(void)showLoadingViewWithOutNaviMessage:(NSString*)loadingMessage;
-(void)showWithSuccessMessage:(NSString*)successMessage;
-(void)showErrorMessage:(NSString*)errorMessage;
-(void)hideLoadingView;

-(void)showAlertViewWithMessage:(NSString*)alertMessage;
-(void)hideAlertView;

-(void)showSubViews;
-(void)hideSubViews;

@property(nonatomic ,strong)UITableView *meTableView;
@end


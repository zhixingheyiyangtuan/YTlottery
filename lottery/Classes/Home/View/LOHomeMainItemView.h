//
//  LOHomeMainItemView.h
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//


#import <UIKit/UIKit.h>
#define  MainItemHeight  SCREEN_WIDTH/4
@class LOHomeMainModel;
@protocol LOHomeMainItemViewDelegate <NSObject>

@optional
-(void)LOHomeMainItemViewDidSelectWith:(LOHomeMainModel *)model;

@end

@interface LOHomeMainItemView : UIView
@property (nonatomic,strong)NSArray * collectionArr;

@property (nonatomic,weak) id<LOHomeMainItemViewDelegate> delegate;

@end

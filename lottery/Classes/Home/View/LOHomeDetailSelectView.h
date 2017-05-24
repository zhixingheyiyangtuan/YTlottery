//
//  LOHomeDetailSelectView.h
//  lottery
//
//  Created by 杨湍 on 2017/5/24.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  BUTTONHEIGHT 40*autoSizeScaleY

typedef NS_ENUM(NSInteger, ButtonTag)
{
    PreviousTag = 101,
    NextTag
};

@protocol LOHomeDetailSelectViewDelegate <NSObject>

-(void)LOHomeDetailSelectViewButtonCilckWithButton:(UIButton *)button;

@end

@interface LOHomeDetailSelectView : UIView

@property(nonatomic,weak) id <LOHomeDetailSelectViewDelegate> delegate;

@end

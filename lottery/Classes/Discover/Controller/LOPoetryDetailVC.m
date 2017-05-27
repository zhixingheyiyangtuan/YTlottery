//
//  LOPoetryDetailVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOPoetryDetailVC.h"
#import <AVFoundation/AVFoundation.h>
@interface LOPoetryDetailVC ()<AVSpeechSynthesizerDelegate>

//语音功能
@property(nonatomic,strong) AVSpeechSynthesizer *spe;

//右上角朗读按钮
@property(nonatomic,strong) UIBarButtonItem *readItem;
@end

@implementation LOPoetryDetailVC


- (AVSpeechSynthesizer *)spe{
    if (!_spe) {
        _spe = [AVSpeechSynthesizer new];
        _spe.delegate = self;
    }
    return _spe;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.poetry.title;
    self.navigationItem.leftBarButtonItem.title = @"";
    //创建右边朗读的item
    self.readItem = [[UIBarButtonItem alloc] initWithTitle:@"朗读" style:UIBarButtonItemStyleDone target:self action:@selector(startReadingPoetry)];
    //添加
    self.navigationItem.rightBarButtonItem = self.readItem;
    self.meTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //设置背景图片
    self.meTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
    [self.view addSubview:self.meTableView];
}


- (void)startReadingPoetry {
    
    if (self.spe.speaking) {
        [self.spe stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        return;
    }
    
    //设置读取的文本
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:[self.poetry.shi stringByAppendingString:self.poetry.introShi]];
    //设置使用什么语言
    utt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
    
    [self.spe speakUtterance:utt];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.spe stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    self.readItem.title = @"停止";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    self.readItem.title = @"朗读";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    self.readItem.title = @"朗读";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"诗词鉴赏", @"注解"][section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
        
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    
//    label.font = FontWithSize(14);
    [cell.contentView addSubview:label];
    label.text = @[self.poetry.shi, self.poetry.introShi][indexPath.section];
;
    
    label.numberOfLines = 0;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        //(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    }];

    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    return bgView;
}

/*
 面试问题:如何提高tableView的加载速度?
 协议：HeightForRow和cellForRow 执行顺序？
 在执行cellForRow之前，table中如果有100行，那么会执行100次HeightForRow，计算出table的内容总高度，为了让右侧滑动条显示准确
 当实现estimatedHeightForRow协议以后，HeightForRow方法只会当cell加载时，才运行。
 */
//下方协议，也是通过autoLayout实现cell高度自动匹配的关键点
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40 *autoSizeScaleY;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   return 0.001 *autoSizeScaleY;
}
@end

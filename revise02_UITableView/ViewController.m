//
//  ViewController.m
//  revise02_UITableView
//
//  Created by 何万牡 on 17/1/6.
//  Copyright © 2017年 何万牡. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * myTableView;

@property (nonatomic,strong)NSMutableArray * dataSource;//数据源

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc] init];
    [self initDataSource];
    
    /*
     * UITableViewStyleGrouped  :分组
     * UITableViewStylePlain    :不分组
     */
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置代理
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
}

#pragma mark - UITableViewDataSource
// 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
// 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray * arr = self.dataSource[section];
    return arr.count;
}
// 返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //对cell进行复用
    static NSString * identifier = @"cellIdentifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        /*
         typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
         UITableViewCellStyleDefault,    // 左侧显示textLabel（不显示detailTextLabel），imageView可选（显示在最左边）
         UITableViewCellStyleValue1,     // 左侧显示textLabel、右侧显示detailTextLabel（默认蓝色），imageView可选（显示在最左边）
         UITableViewCellStyleValue2,     // 左侧依次显示textLabel(默认蓝色)和detailTextLabel，imageView可选（显示在最左边）
         UITableViewCellStyleSubtitle    // 左上方显示textLabel，左下方显示detailTextLabel（默认灰色）,imageView可选（显示在最左边）
         };
         */
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSMutableArray * arr = self.dataSource[indexPath.section];
    cell.textLabel.text = [NSString stringWithFormat:@"第%@个",arr[indexPath.row]];
    return cell;
    
}
// 返回每组头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}
// 返回每组尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"";
}
// 返回 Cell 是否在滑动时是否可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 返回 Cell 是否可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// TableView 右侧建立一个索引表需要的数组内容
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *arr = @[@"1",@"2",@"3",@"4"];
    return arr;
}
// 对 Cell 编辑结束后的回调
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
// 对 Cell 移动结束后的回调
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}
#pragma mark - UITableViewDelegate
// Cell 即将显示，可用于自定义 Cell 显示的动画效果
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
// UITableView 的 HeaderView 即将显示，可用于自定义 HeaderView 显示的动画效果
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
}
// UITableView 的 FooterView 即将显示，可用于自定义 FooterView 显示的动画效果
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    
}
// Cell 完成显示
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPat
{
    
}
// HeaderView 完成显示
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
    
}
// FooterView 完成显示
-(void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    
}
// 返回每个 Cell 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}
// 返回每个 Section 的 HeaderView 高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}
// 返回每个 Section FooterView 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}
/*
// 自动计算 Cell 高度（iOS7.0 以后增加的，返回一个粗略值，系统会自动计算）
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}
// 自动计算 Section 的 HeaderView 高度（iOS7.0 以后增加的）
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}
// 自动计算 Section 的 FooterView 高度（iOS7.0 以后增加的）
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}
 */
// 返回 Section 自定义的 HeaderView
-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44.0f)];
    label.backgroundColor = [UIColor magentaColor];
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"第%ld组",section];
    return label;
}
// 返回 Section 自定义的 FooterView
-(nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1f)];
}
// 返回当前选中的 Row 是否高亮，一般在选择的时候才高亮
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
// Cell 被选中的回调
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.myTableView.editing  = YES;
}
// 返回 Cell 编辑类型
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     typedef NS_ENUM(NSInteger, UITableViewCellEditingStyle) {
     UITableViewCellEditingStyleNone,
     UITableViewCellEditingStyleDelete, //删除
     UITableViewCellEditingStyleInsert  //添加
     };
     */
    //UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert  选择
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}

// 怎样编辑 Cell (iOS8.0 使用)
//右滑弹出的按钮
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"1111");
    }];
    topRowAction.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"2222");
    }];
    deleteRowAction.backgroundColor =[UIColor redColor];
    return @[topRowAction, deleteRowAction];
}

// 设置进入编辑状态时，Cell不会缩进
-(BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
// 开始编辑
-(void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED
{
    
}
//结束编辑
-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}
#pragma mark - Helper
/**
 *  初始化数据源
 */
-(void)initDataSource
{
    
    for (int i=0; i<4; i++) {
        NSMutableArray * array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
        [self.dataSource addObject:array];
    }
}
@end

//
//  CategoryViewController.m
//  Shunyi
//
//  Created by macremote on 2021/4/12.
//

#import "CategoryViewController.h"
#import "TitleHeaderView.h"

@interface CategoryViewController ()<CGXVerticalMenuCategoryViewDelegate,CGXVerticalMenuCategoryViewDataSouce>


@property (nonatomic , strong) CGXVerticalMenuCategoryView *menuView;

@property (nonatomic , assign) BOOL sectionClick;

@property (nonatomic, assign) BOOL selectBO;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.sectionClick = NO;
    self.selectBO = NO;
    self.menuView = [[CGXVerticalMenuCategoryView alloc] initWithFrame:CGRectMake(0, 0, CGG_SCREEN_WIDTH, kSafeVCHeight)];
    self.menuView.backgroundColor = [UIColor whiteColor];
    self.menuView.delegate = self;
    self.menuView.dataSouce = self;
    [self.view addSubview:self.menuView];
    self.menuView.titleWidth = 100;
    self.menuView.leftBgColor = [UIColor colorWithWhite:0.93 alpha:1];;
    self.menuView.rightBgColor = [UIColor whiteColor];
    
    CGXVerticalMenuIndicatorBackgroundView *backgroundView = [[CGXVerticalMenuIndicatorBackgroundView alloc] init];
    backgroundView.backgroundViewColor = [UIColor orangeColor];
    backgroundView.backgroundViewCornerRadius = 0;
    CGXVerticalMenuIndicatorLineView *lineView = [[CGXVerticalMenuIndicatorLineView alloc] init];
    lineView.backgroundColor = [UIColor redColor];
    lineView.positionType = CGXVerticalMenuIndicatorLinePosition_Left;
    self.menuView.indicators = @[lineView,backgroundView];
    
    // 左侧边栏标题
    NSMutableArray *titleArr = [NSMutableArray arrayWithObjects:@"沙发", @"桌类", @"床类", @"几类", @"椅类" ,@"柜类", @"架类", @"凳类", @"床垫", @"儿童家具", nil];
    // 右侧内容
    NSArray *valueArr = @[
    @[@"皮质沙发", @"布艺沙发", @"实木沙发", @"皮布沙发", @"休闲椅", @"懒人沙发", @"贵妃椅", @"罗汉床"],
    @[@"餐桌", @"书桌", @"梳妆台", @"吧台", @"学习桌", @"茶桌", @"玄关"],
    @[@"实木床", @"皮质床", @"布艺床", @"板式床", @"儿童床", @"高低床"],
    @[@"茶几", @"角几/边几"],
    @[@"休闲椅", @"餐椅", @"书椅", @"儿童椅", @"办公椅", @"茶椅", @"功能椅", @"摇椅", @"吧椅"],
    @[@"电视柜", @"床头柜", @"餐边柜", @"斗柜", @"衣柜", @"书柜", @"储物柜", @"茶柜", @"酒柜", @"鞋柜", @"门厅柜", @"儿童柜"],
    @[@"书架/展架", @"衣帽架", @"茶架", @"花架"],
    @[@"沙发凳", @"换鞋凳", @"矮凳", @"长条凳", @"床尾凳", @"梳妆凳"],
    @[@"乳胶床垫", @"弹簧床垫", @"儿童床垫"],
    @[@"儿童床", @"高低床", @"床垫", @"学习桌", @"儿童椅", @"衣柜", @"床头柜"],];
    
    NSMutableArray *dataArr = [NSMutableArray array];
    for (int i = 0; i<titleArr.count; i++) {
        CGXVerticalMenuCategoryListModel *listModel = [[CGXVerticalMenuCategoryListModel alloc] init];
        CGXVerticalMenuTitleModel *itemModel = [[CGXVerticalMenuTitleModel alloc] init];
        itemModel.title = titleArr[i];
        itemModel.titleNormalColor = [UIColor blackColor];
        itemModel.titleSelectedColor = [UIColor redColor];
        itemModel.titleFont = [UIFont systemFontOfSize:16];
        itemModel.titleSelectedFont = [UIFont systemFontOfSize:18];
        listModel.leftModel = itemModel;
        
        NSMutableArray *dataRightArr = [NSMutableArray array];
        
        CGXVerticalMenuCollectionSectionModel *sectionModel = [[CGXVerticalMenuCollectionSectionModel alloc] init];
        sectionModel.headerHeight = 30;
        sectionModel.footerHeight = 0;
        sectionModel.headerBgColor = [[UIColor orangeColor] colorWithAlphaComponent:0];;
        sectionModel.footerBgColor = [[UIColor redColor] colorWithAlphaComponent:0];;
        sectionModel.rowCount = 3;
        sectionModel.borderInsets = UIEdgeInsetsMake(10, 10, 0, 10);
        sectionModel.insets = UIEdgeInsetsMake(5, 5, 5, 5);;

        NSMutableArray *rowArr = [NSMutableArray array];
        NSArray *value = valueArr[i];
        for (int k = 0; k < value.count; k++) {
            CGXVerticalMenuCollectionItemModel *itemModel = [[CGXVerticalMenuCollectionItemModel alloc] init];
            itemModel.itemCornerRadius = 10;
            itemModel.itemText = [NSString stringWithFormat:@"%@",value[k]];
            itemModel.itemUrlStr = @"HotIcon0";
            itemModel.menu_ImageCallback = ^(UIImageView * _Nonnull hotImageView, NSURL * _Nonnull hotImageURL) {
                [hotImageView sd_setImageWithURL:hotImageURL];
                hotImageView.image = [UIImage imageNamed:@"HotIcon0"];
            };
            [rowArr addObject:itemModel];
        }
        sectionModel.rowArray = [NSMutableArray arrayWithArray:rowArr];
        [dataRightArr addObject:sectionModel];
        
        listModel.rightArray = dataRightArr;
        [dataArr addObject:listModel];
    }
    [self.menuView updateListWithDataArray:dataArr];
}


- (UICollectionReusableView *)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView ListView:(CGXVerticalMenuCollectionView *)listView KindFootAtIndexPath:(NSIndexPath *)indexPath listViewInRow:(NSInteger)row
{
    if (self.selectBO) {
        return [[UICollectionReusableView alloc] init];
    }
    return nil;
}

#pragma mark - 每个分区背景颜色  默认背景色
- (UIColor *)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView BackgroundColorForSection:(NSInteger)section
{
    if (self.sectionClick) {
        NSArray *colorArr = @[[UIColor redColor], [UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor], [UIColor blueColor],[UIColor blackColor]];
        NSInteger inter = arc4random() % 6;
        return [colorArr objectAtIndex:inter];
    }
    return categoryView.rightBgColor;
}

#pragma mark - 每个分区的高度 不实现  默认宽高相等
- (CGFloat)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView sizeForItemAtSection:(NSInteger)section ItemWidth:(CGFloat)itemWidth {
    return itemWidth+30;
}

#pragma mark - 左侧点击
- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"左侧点击 %ld",(long)index);
}

#pragma mark - 右侧点击
- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView didSelectedItemDetailsAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"右侧点击 %ld--%ld",(long)indexPath.section,(long)indexPath.row);
}

- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView didSelectDecorationViewAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"右侧空白点击 %ld--%ld",(long)indexPath.section,(long)indexPath.row);
}
/**  将要显示
 @param categoryView categoryView description
 @param row 选中的row
 */
- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView willDisplayCellAtRow:(NSInteger)row
{
    NSLog(@"将要显示 %ld",(long)row);
}
/**  将要消失
 @param categoryView categoryView description
 @param row 选中的row
 */
- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView didEndDisplayingCellAtRow:(NSInteger)row
{
    NSLog(@"将要消失 %ld",(long)row);
}

#pragma mark - 将要显示的右侧分区
- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView willDisplaViewElementKind:(NSString *)elementKind
             atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"将要显示的右侧分区--%ld" , indexPath.section);
}

#pragma mark - 将要消失的右侧分区
- (void)verticalMenuView:(CGXVerticalMenuCategoryView *)categoryView didEndDisplayingElementKind:(NSString *)elementKind
             atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"将要消失的右侧分区--%ld" , indexPath.section);
}


@end


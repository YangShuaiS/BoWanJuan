//
//  LeiDaTu.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "LeiDaTu.h"
#import <Charts/Charts-Swift.h>
@interface LeiDaTu()<ChartViewDelegate>
@property (nonatomic, strong) RadarChartView *radarChartView;//填空
@property (nonatomic, strong) RadarChartData *radarCData;//填空

@end
@implementation LeiDaTu

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    //    self.radarChartView = [[RadarChartView alloc] initWithFrame:CGRectMake(20, 80, WIDTH, 200)];
    self.radarChartView = [RadarChartView new];
    [self addSubview:self.radarChartView];
    [_radarChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    self.radarChartView.delegate = self;
    self.radarChartView.descriptionText = @"";//描述
    self.radarChartView.rotationEnabled = NO;//是否允许转动
    self.radarChartView.highlightPerTapEnabled = NO;//是否能被选中
    //雷达图线条样式
    
    self.radarChartView.webLineWidth = 0.5;//主干线线宽
    self.radarChartView.webColor = RGB(0xc2, 0xcc, 0xd0);//主干线线宽
    self.radarChartView.innerWebLineWidth = 0.375;//边线宽度
    self.radarChartView.innerWebColor = RGB(0xc2, 0xcc, 0xd0);;//边线颜色
    self.radarChartView.webAlpha = 1;//透明度
    
    //设置 xAxi
    ChartXAxis *xAxis = self.radarChartView.xAxis;
    xAxis.labelFont = [UIFont systemFontOfSize:9];//字体
    xAxis.labelTextColor =RGB(0x33, 0x33, 0x33);//颜色
    
    //设置 yAxis
    ChartYAxis *yAxis = self.radarChartView.yAxis;
    yAxis.axisMinValue = 0.0;//最小值
    yAxis.axisMaxValue = 100.0;//最大值
    yAxis.drawLabelsEnabled = NO;//是否显示 label
    yAxis.labelCount = 5;// label 个数
    yAxis.labelFont = [UIFont systemFontOfSize:4];// label 字体
    yAxis.labelTextColor = [UIColor lightGrayColor];// label 颜色
    
    //为雷达图提供数据
    self.radarCData = [self setData];
    self.radarChartView.data = self.radarCData;
    self.radarChartView.delegate = self;
    [self.radarChartView renderer];
    
    //设置动画
    [self.radarChartView animateWithYAxisDuration:0.1f];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (UIView * view  in self.radarChartView.subviews) {
        if ([[view class] isEqual:[UILabel class]]) {
            UILabel * label = (UILabel *)view;
            NSLog(@"%@",label.text);
        }
    }
}

//创建数据
- (RadarChartData *)setData{
    
    double mult = 100;
    int count = 5;//维度的个数
    
    //每个维度的名称或描述
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {
        [xVals addObject:[NSString stringWithFormat:@"月"]];
    }
    
    //每个维度的数据
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {
        double randomVal = arc4random_uniform(mult);         //产生 50~150 的随机数
        NSLog(@"%f",randomVal);
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:randomVal];
        [yVals1 addObject:entry];
    }
    RadarChartDataSet *set1 = [[RadarChartDataSet alloc] initWithValues:yVals1 label:@""];
    set1.lineWidth = 0.5;               //数据折线线宽
    [set1 setColor:[UIColor blueColor]];//数据折线颜色
    set1.drawFilledEnabled = YES;       //是否填充颜色
    set1.fillColor = [UIColor yellowColor];//填充颜色
    set1.fillAlpha = 0.25;              //填充透明度
    set1.drawValuesEnabled = NO;        //是否绘制显示数据
//    set1.valueFont = [UIFont systemFontOfSize:9];//字体
//    set1.valueTextColor = [UIColor grayColor];   //颜色
    
        NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
        for (int i = 0; i < count; i++) {
            double randomVal = arc4random_uniform(mult);//产生 50~150 的随机数
            ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:randomVal];
            [yVals2 addObject:entry];
        }
    RadarChartDataSet *set2 = [[RadarChartDataSet alloc] initWithValues:yVals2 label:@""];
        set2.lineWidth = 0.5;//数据折线线宽
        set2.drawFilledEnabled = YES;//是否填充颜色
    [set1 setColor:[UIColor orangeColor]];//数据折线颜色
    set1.fillColor = [UIColor redColor];//填充颜色
    
        set2.fillAlpha = 0.25;//填充透明度
        set2.drawValuesEnabled = NO;//是否绘制显示数据
//        set2.valueFont = [UIFont systemFontOfSize:9];//字体
//        set2.valueTextColor = [UIColor grayColor];//颜色
    RadarChartData * data = [[RadarChartData alloc] initWithDataSets:@[set1,set2]];
    
    data.labels = (NSArray *)xVals;
    [data setLabels:xVals];
    return data;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGPoint point1 = CGPointMake(WIDTH/2, 200);
//    CGPoint point2 = CGPointMake(WIDTH/2+100, 300);
//    CGPoint point3 = CGPointMake(WIDTH/2+90, 400);
//    CGPoint point4 = CGPointMake(WIDTH/2, 500);
//    CGPoint point5 = CGPointMake(WIDTH/2-90, 400);
//    CGPoint point6 = CGPointMake(WIDTH/2-120, 300);
//    CGPoint point7 = CGPointMake(WIDTH/2, 200);
//
//
//    [path moveToPoint:point1];
//    [path addLineToPoint:point2];
//    [path addLineToPoint:point3];
//    [path addLineToPoint:point4];
//    [path addLineToPoint:point5];
//    [path addLineToPoint:point6];
//    [path addLineToPoint:point7];
//
//    CAShapeLayer * animLayer = [CAShapeLayer layer];
//    animLayer.path = path.CGPath;
//    //            animLayer.fillColor = [UIColor clearColor].CGColor;
//    animLayer.lineWidth = 1.f;
//    animLayer.strokeColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//    animLayer.fillColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//
//    [self.layer addSublayer:animLayer];
//
//
//    UIBezierPath *path1 = [UIBezierPath bezierPath];
//    CGPoint point11 = CGPointMake(WIDTH/2-20, 200);
//    CGPoint point22 = CGPointMake(WIDTH/2+80, 250);
//    CGPoint point33 = CGPointMake(WIDTH/2+100, 450);
//    CGPoint point44 = CGPointMake(WIDTH/2-20, 450);
//    CGPoint point55 = CGPointMake(WIDTH/2-120, 350);
//    CGPoint point66 = CGPointMake(WIDTH/2-100, 250);
//    CGPoint point77 = CGPointMake(WIDTH/2-20, 200);
//
//
//    [path1 moveToPoint:point11];
//    [path1 addLineToPoint:point22];
//    [path1 addLineToPoint:point33];
//    [path1 addLineToPoint:point44];
//    [path1 addLineToPoint:point55];
//    [path1 addLineToPoint:point66];
//    [path1 addLineToPoint:point77];
//
//    CAShapeLayer * animLayer1 = [CAShapeLayer layer];
//    animLayer1.path = path1.CGPath;
//    //            animLayer.fillColor = [UIColor clearColor].CGColor;
//    animLayer1.lineWidth = 1.f;
//    animLayer1.strokeColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//    animLayer1.fillColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//
//    [self.layer addSublayer:animLayer1];
//
////    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    NSMutableArray * pointarr = [NSMutableArray array];
//    if ([self checkLineIntersection:point1 p2:point2 p3:point11 p4:point22]) {
//        CGPoint point111 = [self intersectionU1:point1 u2:point2 v1:point11 v2:point22];
//        [pointarr addObject:NSStringFromCGPoint(point111)];
//    }

    
//    [[UIColor blueColor] setStroke];
//    [[UIColor redColor] setFill];
//    [path setLineWidth:3.0];
//    [path setLineJoinStyle:kCGLineJoinRound];
//    [path setLineCapStyle:kCGLineCapRound];
//    [path stroke];
}

#pragma mark ------------ 判断两条直线是否相交

- (BOOL)checkLineIntersection:(CGPoint)p1 p2:(CGPoint)p2 p3:(CGPoint)p3 p4:(CGPoint)p4
{
    CGFloat denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);
    
    if (denominator == 0.0f) {
        
        return NO;
    }
    
    CGFloat ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x))/denominator;
    CGFloat ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x))/denominator;
    
    if (ua >= 0.0f && ua <= 1.0f && ub >= 0.0f && ub <= 1.0f) {
        
        return YES;
    }
    
    return NO;
}

#pragma mark ------------ 两条直线要是相交 求出相交点

- (CGPoint)intersectionU1:(CGPoint)u1 u2:(CGPoint)u2 v1:(CGPoint)v1 v2:(CGPoint)v2
{
    CGPoint ret = u1;
    
    double t = ((u1.x - v1.x) * (v1.y - v2.y) - (u1.y - v1.y) * (v1.x - v2.x))/((u1.x-u2.x) * (v1.y - v2.y) - (u1.y - u2.y) * (v1.x - v2.x));
    
    ret.x += (u2.x - u1.x) * t;
    ret.y += (u2.y - u1.y) * t;
    
    return ret;
}

@end

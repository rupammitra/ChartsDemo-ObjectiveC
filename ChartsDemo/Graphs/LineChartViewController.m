//
//  LineChartViewController.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

#import "LineChartViewController.h"

@interface LineChartViewController ()

@end

@implementation LineChartViewController

- (void)viewDidLoad {
    self.chartView = [[LineChartView alloc] initWithFrame:self.view.bounds];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self formChartData];
    
    [self.chartView setVisibleXRangeMaximum:2.0];
    [self.chartView animateWithXAxisDuration:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)formChartData
{
    NSMutableArray *xVals = [NSMutableArray new];
    
    [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [xVals addObject:obj[@"x"]];
    }];
    
    __block NSMutableArray *dataSets = [NSMutableArray new];
    __block NSMutableArray *yVals;
    __block LineChartDataSet *dataSet;
    
    NSArray *keys = [[self.dataArray firstObject] allKeys];
    keys = [[keys mutableCopy] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger keyIndex, BOOL * _Nonnull stop) {
        if (![key isEqualToString:@"x"]) {
            yVals = [NSMutableArray new];
            UIColor *color = [UIColor randomColor];
            [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull data, NSUInteger dataIndex, BOOL * _Nonnull stop) {
                NSString *markerString = [NSString stringWithFormat:@" %@: %@", [key uppercaseString], data[key]];
                [yVals addObject:[[ChartDataEntry alloc] initWithValue:[data[key] doubleValue] xIndex:dataIndex data:markerString]];
                dataSet = [[LineChartDataSet alloc] initWithYVals:yVals label:[key uppercaseString]];
                [dataSet setColor:color];
                [dataSet setLineWidth:2.0];
                if (self.lineFillEnabled) {
                    [dataSet setDrawFilledEnabled:YES];
                    [dataSet setFillAlpha:0.2];
                    [dataSet setFillColor:color];
                }
                [dataSet setCircleRadius:5.0];
                [dataSet setCircleColor:color];
            }];
            [dataSets addObject:dataSet];
        }
    }];
    
    LineChartData *data = [[LineChartData alloc] initWithXVals:xVals dataSets:dataSets];
    [data setDrawValues:NO];
    
    self.chartView.data = data;
    [self.view addSubview:self.chartView];
}

@end
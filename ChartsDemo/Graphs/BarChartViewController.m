//
//  BarChartViewController.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

#import "BarChartViewController.h"

@interface BarChartViewController ()

@end

@implementation BarChartViewController

- (void)viewDidLoad {
    self.chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self formChartData];
    
    [self.chartView setVisibleXRangeMaximum:15.0];
    [self.chartView animateWithYAxisDuration:1.0];
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
    __block BarChartDataSet *dataSet;
    
    NSArray *keys = [[self.dataArray firstObject] allKeys];
    keys = [[keys mutableCopy] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger keyIndex, BOOL * _Nonnull stop) {
        if (![key isEqualToString:@"x"]) {
            yVals = [NSMutableArray new];
            [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull data, NSUInteger dataIndex, BOOL * _Nonnull stop) {
                NSString *markerString = [NSString stringWithFormat:@" %@: %@", [key uppercaseString], data[key]];
                [yVals addObject:[[BarChartDataEntry alloc] initWithValue:[data[key] doubleValue] xIndex:dataIndex data:markerString]];
                dataSet = [[BarChartDataSet alloc] initWithYVals:yVals label:[key uppercaseString]];
                [dataSet setColor:[UIColor randomColor]];
            }];
            [dataSets addObject:dataSet];
        }
    }];
    
    BarChartData *data = [[BarChartData alloc] initWithXVals:xVals dataSets:dataSets];
    [data setDrawValues:NO];
    [data setGroupSpace:1.0];
    [data setHighlightEnabled:NO];
    
    self.chartView.data = data;
    [self.view addSubview:self.chartView];
}

@end
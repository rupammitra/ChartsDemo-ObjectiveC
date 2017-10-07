//
//  BaseGraphViewController.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

#import "BaseGraphViewController.h"
#import "LeftAxisFormatter.h"

@interface BaseGraphViewController ()

@end

@implementation BaseGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.chartView setBackgroundColor:[UIColor clearColor]];
    [self configureChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureChart
{
    [_chartView setNoDataText:@""];
    
    [_chartView setBackgroundColor:[UIColor clearColor]];
    [_chartView setGridBackgroundColor:[UIColor clearColor]];
    
    [_chartView setDescriptionText:@""];
    [_chartView setDescriptionTextColor:[UIColor clearColor]];
    
    [_chartView setPinchZoomEnabled:NO];
    [_chartView setDoubleTapToZoomEnabled:NO];
    
    ChartYAxis *leftAxis =[_chartView leftAxis];
    [leftAxis setLabelFont:[UIFont systemFontOfSize:15.0]];
    [leftAxis setLabelTextColor:[UIColor randomColor]];
    [leftAxis setValueFormatter:[[ChartDefaultAxisValueFormatter alloc] initWithFormatter:[LeftAxisFormatter new]]];
    [leftAxis setDrawGridLinesEnabled:YES];
    [leftAxis setAxisMinimum:0.0];
    
    ChartYAxis *rightAxis = [_chartView rightAxis];
    [rightAxis setEnabled:NO];
    
    ChartXAxis *xAxis = [_chartView xAxis];
    [xAxis setLabelFont:[UIFont systemFontOfSize:15.0]];
    [xAxis setLabelTextColor:[UIColor randomColor]];
    [xAxis setLabelPosition:XAxisLabelPositionBottom];
    [xAxis setDrawGridLinesEnabled:YES];
    [xAxis setGranularity:1.0];
    
    ChartLegend *legend = [_chartView legend];
    [legend setEnabled:YES];
    [legend setPosition:ChartLegendPositionBelowChartCenter];
    
    //this is to show the pop up on chart selection
    Marker *marker = [[Marker alloc] initWithColor:[UIColor randomColor] font:[UIFont systemFontOfSize:15.0] insets: UIEdgeInsetsMake(5.0, 0.0, 0.0, 5.0)];
    [marker setMinimumSize:CGSizeMake(65.0, 44.0)];
    [_chartView setMarker:marker];
}

@end

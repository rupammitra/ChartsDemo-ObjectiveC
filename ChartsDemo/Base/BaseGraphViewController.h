//
//  BaseGraphViewController.h
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseGraphViewController : UIViewController

@property (strong, nonatomic) BarLineChartViewBase *chartView;

@property (strong, nonatomic) NSArray *dataArray;
@property (nonatomic) BOOL lineFillEnabled;

-(void)configureChart;

@end

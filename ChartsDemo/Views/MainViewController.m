//
//  ViewController.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

#import "MainViewController.h"
#import "BaseGraphViewController.h"
#import "BarChartViewController.h"
#import "LineChartViewController.h"

@interface MainViewController ()
{
    __weak IBOutlet UIView *graphContainerView;
    __weak IBOutlet UISegmentedControl *segmentControl;
    
    NSArray *responseArray;
    BaseGraphViewController *graphViewController;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionLoadData:(UIButton *)sender {
    
    [self loadJSON];
    [self actionSegmentControl:segmentControl];
}

- (IBAction)actionSegmentControl:(UISegmentedControl *)sender {
    
    graphContainerView.subviews.count > 0 ? [graphContainerView.subviews[0] removeFromSuperview] : NSNotFound;
    if (responseArray.count == 0)
        return;
    switch (sender.selectedSegmentIndex) {
        case 0:
            graphViewController = [BarChartViewController new];
            break;
        case 1:
            graphViewController = [LineChartViewController new];
            break;
        case 2:
            graphViewController = [LineChartViewController new];
            [graphViewController setLineFillEnabled:YES];
            break;
        default:
            break;
    }
    [graphViewController setDataArray:responseArray];
    [self addGraphAsSubview];
}

-(void)loadJSON
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"SampleData" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if(error)
        NSLog(@"Error reading file: %@",error.localizedDescription);
    
    id JSONObject = [NSJSONSerialization
                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                options:0 error:NULL];
    responseArray = [NSArray arrayWithArray:JSONObject[@"response"]];
}

-(void)addGraphAsSubview
{
    graphViewController.view.frame = graphContainerView.bounds;
    graphViewController.chartView.frame = graphContainerView.bounds;
    [graphContainerView addSubview:graphViewController.view];
}

@end

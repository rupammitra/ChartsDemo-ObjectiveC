//
//  XAxisFormatter.h
//  ChartsDemo
//
//  Created by Rupam Mitra on 07/10/17.
//  Copyright © 2017 Rupam Mitra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XAxisFormatter : NSObject <IChartAxisValueFormatter>

-(instancetype)initWithXVals:(NSArray*)xVals;
@property NSArray *xVals;

@end

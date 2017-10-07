//
//  XAxisFormatter.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 07/10/17.
//  Copyright © 2017 Rupam Mitra. All rights reserved.
//

#import "XAxisFormatter.h"

@implementation XAxisFormatter

-(instancetype)initWithXVals:(NSArray*)xVals
{
    if (self == [super init]) {
        self.xVals = xVals;
    }
    return self;
}

- (NSString * _Nonnull)stringForValue:(double)value axis:(ChartAxisBase * _Nullable)axis{
    
    if (value >= 0 && value < self.xVals.count) {
        NSInteger index = (NSInteger)value;
        return self.xVals[index];
    }
    return @"";
}
@end

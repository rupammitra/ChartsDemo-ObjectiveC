//
//  LeftAxisFormatter.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 07/10/17.
//  Copyright © 2017 Rupam Mitra. All rights reserved.
//

#import "LeftAxisFormatter.h"

@implementation LeftAxisFormatter

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setPositiveFormat:@"0K"];
        [self setMultiplier:[NSNumber numberWithDouble:0.001]];
    }
    return self;
}

@end

//
//  ChnemaCell.m
//  影讯
//
//  Created by 罗 何 on 13-12-23.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "ChnemaCell.h"


@interface ChnemaCell (){
    UIButton *first;
    UILabel * second;
    UILabel *third;
}

@end

@implementation ChnemaCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        first=[UIButton buttonWithType:UIButtonTypeCustom   ];
        first.frame=CGRectMake(0, 0, 0, 0);
        [self addSubview:first];
        [first addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSLog(@"-------fasdlkfjasdklf");
        
        second=[[UILabel alloc]initWithFrame:CGRectZero];
        second.backgroundColor=[UIColor clearColor];
        second.textAlignment=NSTextAlignmentLeft;
        [self addSubview:second];
        [second release];
        
        third=[[UILabel alloc]initWithFrame:CGRectZero];
        third.backgroundColor=[UIColor clearColor];
        third.textAlignment=NSTextAlignmentLeft;
        [self addSubview:third];
        [third release];
    }
    return self;
}

- (void)reloadData:(NSDictionary *)dic{

}

- (void)buttonPress:(UIButton *)sender{
    

}

@end

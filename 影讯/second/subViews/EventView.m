//
//  EventView.m
//  影讯
//
//  Created by 罗 何 on 13-12-23.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "EventView.h"

@interface EventView (){
    NSDictionary *_data;
    
    UIButton *_leftButton;
    UIButton *_rightButton;
    UILabel * _timeLable;
    
}

@end

@implementation EventView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.tag=1;
        [_leftButton setFrame:CGRectZero];
        [_leftButton  addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        
        
        _rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.tag=2;
        [_rightButton setFrame:CGRectZero];
        [_rightButton  addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
        
        _leftButton.enabled=_rightButton.enabled=NO;
        
        _timeLable=[[UILabel alloc]initWithFrame:CGRectZero];
        _timeLable.backgroundColor=[UIColor clearColor];
        [self addSubview:_timeLable];
        _timeLable.textAlignment=NSTextAlignmentCenter;
        [_timeLable release];
    }
    return self;
}

- (void)reloadData:(NSDictionary *)dic{
    [_data release];
    _data = [dic retain];
    
}

- (void)buttonPress:(UIButton *)sender{
    

}

@end

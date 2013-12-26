//
//  IntroductionView.m
//  影讯
//
//  Created by 罗 何 on 13-12-23.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "IntroductionView.h"
#import "AsyLayer.h"

@interface IntroductionView (){
    CALayer *imageLayer;
    UILabel *director;
    UILabel *actor;
    UILabel *type;
    UILabel *time;
    UILabel *when;
    
    UILabel *des;
    
    
}

@end



@implementation IntroductionView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        imageLayer=[CALayer layer];
        imageLayer.frame=CGRectMake(0, 0, 100, 120);
        [self.layer addSublayer:imageLayer];
        
        director=[[UILabel alloc]initWithFrame:CGRectZero];
        director.backgroundColor=[UIColor clearColor];
        director.textAlignment=NSTextAlignmentLeft;
        [self addSubview:director];
        [director release];
        
        
        actor=[[UILabel alloc]initWithFrame:CGRectZero];
        actor.backgroundColor=[UIColor clearColor];
        actor.textAlignment=NSTextAlignmentLeft;
        [self addSubview:actor];
        [actor release];
        
        type=[[UILabel alloc]initWithFrame:CGRectZero];
        type.backgroundColor=[UIColor clearColor];
        type.textAlignment=NSTextAlignmentLeft;
        [self addSubview:type];
        [type release];
        
        time=[[UILabel alloc]initWithFrame:CGRectZero];
        time.backgroundColor=[UIColor clearColor];
        time.textAlignment=NSTextAlignmentLeft;
        [self addSubview:time];
        [time release];
        
        when=[[UILabel alloc]initWithFrame:CGRectZero];
        when.backgroundColor=[UIColor clearColor];
        when.textAlignment=NSTextAlignmentLeft;
        [self addSubview:when];
        [when release];
        
        
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectZero];
        lable.textAlignment=NSTextAlignmentLeft;
        lable.backgroundColor=[UIColor clearColor];
        lable.text=@"剧情介绍";
        [self addSubview:lable];
        [lable release];
        
        
        des=[[UILabel alloc]initWithFrame:CGRectZero];
        des.backgroundColor=[UIColor clearColor];
        des.numberOfLines=0;
        des.lineBreakMode=NSLineBreakByWordWrapping;
        des.textAlignment=NSTextAlignmentLeft;
        [self addSubview:des];
        [des release];
        
    }
    return self;
}



- (void)reloadData:(NSDictionary *)dic{

}


@end

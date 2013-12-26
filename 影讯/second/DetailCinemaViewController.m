//
//  DetailCinemaViewController.m
//  影讯
//
//  Created by 罗 何 on 13-12-23.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "DetailCinemaViewController.h"
#import "iCarousel.h"

@interface DetailCinemaViewController (){
    UILabel *_address;
    UILabel *_phoneNum;
}

@end

@implementation DetailCinemaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
	[self loadHeadView];
}

- (void)loadHeadView{
    
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, IOS7?20:0, 320, 88)];
    [self.view addSubview:headView];
    [headView release];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    lable.backgroundColor=[UIColor clearColor];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.textColor=[UIColor blackColor];
    lable.text=@"影院名称";
    [headView addSubview:lable];
    [lable release];
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame=CGRectMake(0, 0, 60, 30);
    button.tag=1;
    [button setTitle:@"back" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame=CGRectMake(260, 0, 60, 30);
    button.tag=2;
    [button setTitle:@"收藏" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Actions

- (void)buttonPress:(UIButton *)sender{
    if(sender.tag==1){
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end

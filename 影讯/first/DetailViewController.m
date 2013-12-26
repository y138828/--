//
//  DetailViewController.m
//  影讯
//
//  Created by 罗 何 on 13-12-23.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "DetailViewController.h"
#import "IntroductionView.h"


@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>{
    CALayer *_indexLayer;
    
    UIScrollView *_mainView;
    IntroductionView *_first;
}

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor whiteColor];
}

- (void)loadHeadView{
    
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 88)];
    [self.view addSubview:headView];
    [headView release];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    lable.backgroundColor=[UIColor clearColor];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.textColor=[UIColor blackColor];
    lable.text=@"无人区";
    [headView addSubview:lable];
    [lable release];
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame=CGRectMake(0, 0, 60, 30);
    button.tag=1;
    [button setTitle:@"back" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *array=[NSArray arrayWithObjects:@"介绍",@"微评",@"影评",@"剧照", nil];
    for(short i=2;i<array.count+2;i++){
        UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
        button.frame=CGRectMake(0, 0, 60, 30);
        button.tag=i;
        [button setTitle:[array objectAtIndex:i-2] forState:UIControlStateNormal];
        button.backgroundColor=[UIColor redColor];
        [headView addSubview:button];
        [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    
}

- (void)loadMainView{
    _mainView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 88, 320, self.view.frame.size.height-88)];
    [self.view addSubview:_mainView];
    [_mainView release];
    [_mainView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld ) context:_indexLayer];
    
    _first=[[IntroductionView alloc]initWithFrame:_mainView.bounds];
    _first.tag=1;
    [_mainView addSubview:_first];
    [_first release];
    
    for(short i=2;i<5;i++){
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake((i-1)*320, 0, 320, _mainView.frame.size.height) style:UITableViewStylePlain];
        tableView.tag=i;
        tableView.dataSource=(id)self;
        tableView.delegate=(id)self;
        [_mainView addSubview:tableView];
        [tableView release];
    }
    
}

#pragma mark - 



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    }else{
    
    
    }
    
    return cell;
}

#pragma mark - Ob

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    CALayer *layer=(CALayer *)context;
    
    NSString *str=[[change objectForKey:NSKeyValueChangeNewKey] description];
    NSRange range=[str rangeOfString:@"{"];
    str=[str substringFromIndex:range.location+1];
    range=[str rangeOfString:@","];
    str=[str substringToIndex:range.location];
    
    NSLog(@"---layer  %@-----%@",layer,str);
}


#pragma mark - Actions

- (void)buttonPress:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        default:
            break;
    }
    
    
}


@end

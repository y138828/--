//
//  CinemaViewController.m
//  影讯
//
//  Created by 罗 何 on 13-12-23.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "CinemaViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationViewController.h"
#import "DetailCinemaViewController.h"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIButton *_backButton;
}

@end

@implementation CinemaViewController

- (void)dealloc{
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadHeadView];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44+(IOS7?20:0), 320, self.view.frame.size.height-44-49-(IOS7?20:0)) style:UITableViewStylePlain];
    
    tableView.dataSource=(id)self;
    tableView.delegate=(id)self;
    [self.view addSubview:tableView];
    
    
    
}

- (void)loadHeadView{
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, IOS7?20:0, 320, 44)];
    lable.text=@"选择影院";
    lable.textAlignment=NSTextAlignmentCenter;
    lable.userInteractionEnabled=YES;
    [self.view addSubview:lable];
    [lable release];
    
    _backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.backgroundColor=[UIColor orangeColor];
    _backButton.frame=CGRectMake(0, 0, 60, 20);
    [_backButton setTitle:@"地点" forState:UIControlStateNormal];
    _backButton .tag=1;
    [_backButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [lable addSubview:_backButton];
    [_backButton  release];
    
}


#pragma mark 
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailCinemaViewController *v=[[DetailCinemaViewController alloc]init];
    [self.navigationController pushViewController:v animated:YES];
    [v release];
}

#pragma mark - Actions

- (void)buttonPress:(UIButton *)sender{
    if(sender.tag==1){
        LocationViewController *v=[[LocationViewController alloc]init];
        [self.navigationController    pushViewController:v animated:YES];
        [v release];
        
    }else if(sender.tag==2){
        
    }
}



@end

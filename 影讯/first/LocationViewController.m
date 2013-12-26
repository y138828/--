//
//  LocationViewController.m
//  影讯
//
//  Created by 罗 何 on 13-12-20.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface LocationViewController ()<CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    CLLocationManager *_locationM;
    UITextField *_inputField;
    UIView *    _errorView;
    
}

@end

@implementation LocationViewController

- (void)dealloc{
    [_locationM release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _locationM=[[CLLocationManager alloc]init];
        _locationM.delegate=self;
        _locationM.desiredAccuracy = kCLLocationAccuracyBest;
        [_locationM startUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
	[self loadHeadView];
    
    _inputField=[[UITextField alloc]initWithFrame:CGRectMake(0, 50+(IOS7?20:0), 320, 20)];
    _inputField.textAlignment=NSTextAlignmentCenter;
    _inputField.borderStyle=UITextBorderStyleNone;
    _inputField.clearButtonMode=UITextFieldViewModeWhileEditing;
    _inputField.returnKeyType=UIReturnKeySearch;
    _inputField.placeholder=@"输入城市的名称";
    [self.view addSubview:_inputField];
    [_inputField release];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 75+(IOS7?20:0), 320, self.view.frame.size.height-49-75) style:UITableViewStylePlain];
    _tableView.dataSource=(id)self;
    _tableView.delegate=(id)self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
    
}


- (void)loadHeadView{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, IOS7?20:0, 320, 44)];
    headView.backgroundColor    =[UIColor orangeColor];
    [self.view addSubview:headView];
    [headView release];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.tag=1;
    button.frame=CGRectMake(0, 0, 60, 30);
    button.backgroundColor=[UIColor redColor];
    [headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(80, 0, 100, 20)];
    lable.backgroundColor=[UIColor clearColor];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.textColor=[UIColor blackColor];
    lable.text=@"选择城市";
    [headView addSubview:lable];
    [lable release];

}

- (void)loadErrorView{
    _errorView=[[UIView     alloc]initWithFrame:CGRectMake(0, 40, 320, 120)];
    _errorView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_errorView];
    [_errorView release];
    
    
    CALayer *layer=[CALayer layer];
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer.frame=CGRectMake(100, 0, 100, 60);
    [_errorView.layer addSublayer:layer];


    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 65, 200, 20)];
    lable.layer.borderWidth=0.5f;
    lable.layer.borderColor=[UIColor grayColor].CGColor;
    lable.backgroundColor=[UIColor clearColor];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.text=@"定位失败";
    lable.textColor=[UIColor darkTextColor];
    [_errorView addSubview:lable];
    [lable release];
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.tag=2;
    button.frame=CGRectMake(20, 85, 200, 20);
    [button setTitle:@"好的，我知道了" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_errorView addSubview:button];
    
}

#pragma mark - Actions

- (void)buttonPress:(UIButton *)sender{
    
    if(sender.tag==1)[self.navigationController popViewControllerAnimated:YES];
    else if(sender.tag==2){
        [_errorView removeFromSuperview];
        _errorView=nil;
    }
}


#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell0"];
        if(!cell){
            cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell0"] autorelease];
            cell.backgroundColor=[UIColor redColor];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            if(indexPath.section==0){
                cell.textLabel.text=@"当前城市";
            }else if(indexPath.section==1){
                cell.textLabel.text=@"热门城市";
            }else{
                cell.textLabel.text=@"其他";
            }
        }else{
            if(indexPath.section==0){
                cell.textLabel.text=@"当前城市";
            }else if(indexPath.section==1){
                cell.textLabel.text=@"热门城市";
            }else{
                cell.textLabel.text=@"其他";
            }
            
        }
        
        return cell;

    }
    
    
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(!cell){
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"] autorelease];
        cell.backgroundColor=[UIColor redColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        
    }else{
        
    
    }
    
    return cell;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"-----经度---%g",newLocation.coordinate.longitude);
    NSLog(@"-----纬度---%g",newLocation.coordinate.latitude);


}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{

    if(!_errorView)[self  loadErrorView];
    

}

@end

//
//  FirstViewController.m
//  影讯
//
//  Created by 罗 何 on 13-12-20.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "FirstViewController.h"
#import "LocationViewController.h"
#import "iCarousel.h"
#import "DetailViewController.h"



@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDataSource>{
    UITableView *_leftTalbleView,*_rightTalbleView;
    iCarousel *_leftCarouselView,*_rightCarouselView;
    UIView *_headView;

}

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _leftCarouselView=[[iCarousel    alloc]initWithFrame:CGRectMake(0, 44+(IOS7?20:0), 320, self.view.frame.size.height-44-49-(IOS7?20:0)-40)];
    _leftCarouselView.clipsToBounds=YES;
    _leftCarouselView.type=iCarouselTypeRotary;
    _leftCarouselView.scrollSpeed=0.3f;
    _leftCarouselView.dataSource=(id)self;
    _leftCarouselView.delegate=(id)self;
    [self.view addSubview:_leftCarouselView];
    [_leftCarouselView release];
    
    
    _rightCarouselView=[[iCarousel    alloc]initWithFrame:CGRectMake(320, 44+(IOS7?20:0), 320, self.view.frame.size.height-44-49-(IOS7?20:0)-40)];
    _rightCarouselView.clipsToBounds=YES;
    _rightCarouselView.type=iCarouselTypeRotary;
    _rightCarouselView.dataSource=(id)self;
    _rightCarouselView.delegate=(id)self;
    [self.view addSubview:_rightCarouselView];
    [_rightCarouselView release];
    
    _leftTalbleView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, self.view.frame.size.height-44-49-(IOS7?20:0)) style:UITableViewStylePlain];
    _leftTalbleView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    _leftTalbleView.dataSource=(id)self;
    _leftTalbleView.delegate=(id)self;
    [self.view addSubview:_leftTalbleView];
    [_leftTalbleView release];
    
    
    _rightTalbleView=[[UITableView alloc]initWithFrame:CGRectMake(320, self.view.frame.size.height, 320, self.view.frame.size.height-44-49-(IOS7?20:0)) style:UITableViewStylePlain];
    _rightTalbleView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    _rightTalbleView.dataSource=(id)self;
    _rightTalbleView.delegate=(id)self;
    [self.view addSubview:_rightTalbleView];
    [_rightTalbleView release];
    
    [self loadHeadView];
}

- (void)loadHeadView{
    
    if(IOS7){
        CALayer *layer=[CALayer layer];
        layer.frame=CGRectMake(0, 0, 320, 20);
        layer.backgroundColor=[UIColor whiteColor].CGColor;
        [self.view.layer addSublayer:layer];
    }
    
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0, IOS7?20:0, 320, 44)];
    _headView.backgroundColor    =[UIColor orangeColor];
    [self.view addSubview:_headView];
    [_headView release];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.tag=1;
    button.frame=CGRectMake(0, 0, 60, 30);
    [button setTitle:@"北京" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [_headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"正在上映" forState:UIControlStateNormal];
    button.tag=2;
    button.frame=CGRectMake(70, 0, 80, 34);
    button.backgroundColor=[UIColor redColor];
    [_headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"即将上映" forState:UIControlStateNormal];
    button.tag=3;
    button.frame=CGRectMake(160, 0, 80, 30);
    button.backgroundColor=[UIColor redColor];
    [_headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.tag=4;
    button.frame=CGRectMake(250, 0, 60, 30);
    button.backgroundColor=[UIColor redColor];
    [_headView addSubview:button];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - miCarouselDelegate

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 10;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view{
    
    if(!view){
        view=[[[UIView alloc]initWithFrame:CGRectMake(10, 0, 260, carousel.frame.size.height)] autorelease];
//        view.backgroundColor=[UIColor redColor];

        CALayer *layer=[CALayer layer];
        layer.backgroundColor=[UIColor orangeColor].CGColor;
        layer.frame=CGRectMake(10, 20, view.frame.size.width-20, view.frame.size.height-70);
//        [layer setContents:(id)[UIImage imageNamed:@"test.png"].CGImage];
        [view.layer addSublayer:layer];
        
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, layer.frame.size.height+layer.frame.origin.y+5, 100, 20)];
        lable .backgroundColor=[UIColor clearColor];
        lable.textAlignment=NSTextAlignmentCenter;
        lable.textColor=[UIColor darkTextColor];
        lable.text=@"一夜惊喜";
        [view addSubview:lable];
        [lable release];
        
    }else{
        
    
    }
    return view ;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    DetailViewController *v=[[DetailViewController    alloc]init];
    [self.navigationController pushViewController:v animated:YES];
    [v release];
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if(option==iCarouselOptionSpacing){
        value=1.2;
    }else if(option==iCarouselOptionVisibleItems){
        value=3;
    }else if(option==iCarouselOptionWrap){
        value=NO;
    }
    return value;
}

//<-------------



#pragma mark - TalbleViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(tableView==_leftTalbleView){
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
        if(!cell){
            cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"] autorelease];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.textLabel.text=@"左边";
            
            
        }else{
            
            
        }
        
        return cell;
    }
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(!cell){
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"] autorelease];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        cell.textLabel.text=@"右边";
    }else{
        
        
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *v=[[DetailViewController    alloc]init];
    [self.navigationController pushViewController:v animated:YES];
    [v release];
    
}
#pragma mark - Actions

- (void)buttonPress:(UIButton *)sender{
    if(sender.tag==1){
        LocationViewController *location=[[LocationViewController alloc]init];
        [self.navigationController pushViewController:location animated:YES];
        [location release];
    }
    
    else if(sender.tag==2){
        
        sender.frame=CGRectMake(sender.frame.origin.x, sender.frame.origin.y, sender.frame.size.width, 34);
        UIView *anotherView=[_headView viewWithTag:3];
        anotherView.frame=CGRectMake(anotherView.frame.origin.x, anotherView.frame.origin.y, anotherView.frame.size.width, 30);
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame=_leftTalbleView.frame;
            frame.origin.x=0;
            _leftTalbleView.frame=frame;
            frame.origin.x=320;
            _rightTalbleView.frame=frame;
            
            
            frame=_leftCarouselView.frame;
            frame.origin.x=0;
            _leftCarouselView.frame=frame;
            frame.origin.x=320;
            _rightCarouselView.frame=frame;
            
            
        } completion:^(BOOL finish){
            
        }];
    }
    else if(sender.tag==3){
        sender.frame=CGRectMake(sender.frame.origin.x, sender.frame.origin.y, sender.frame.size.width, 34);
        UIView *anotherView=[_headView viewWithTag:2];
        anotherView.frame=CGRectMake(anotherView.frame.origin.x, anotherView.frame.origin.y, anotherView.frame.size.width, 30);

        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame=_leftCarouselView.frame;
            frame.origin.x=0-320;
            _leftCarouselView.frame=frame;
            
            frame=_rightCarouselView.frame;
            frame.origin.x=0;
            _rightCarouselView.frame=frame;
            
            
            frame=_leftTalbleView.frame;
            frame.origin.x=0-320;
            _leftTalbleView.frame=frame;
            
            frame=_rightTalbleView.frame;
            frame.origin.x=0;
            _rightTalbleView.frame=frame;
            
        } completion:^(BOOL finish){
          
        }];
        
    }
    
    else if(sender.tag==4){
        sender.enabled=NO;
        sender.tag=5;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame=_leftTalbleView.frame;
            frame.origin.y=44+(IOS7?20:0);
            _leftTalbleView.frame=frame;
            
            frame=_rightTalbleView.frame;
            frame.origin.y=44+(IOS7?20:0);
            _rightTalbleView.frame=frame;
            
            
            frame=_leftCarouselView.frame;
            frame.origin.y=0-frame.size.height;
            _leftCarouselView.frame=frame;
            
            frame=_rightCarouselView.frame;
            frame.origin.y=0-frame.size.height;
            _rightCarouselView.frame=frame;
            
            
        } completion:^(BOOL finish){
            sender.enabled=YES;
        }];
    }
    else if(sender.tag==5){
        sender.enabled=NO;
        sender.tag=4;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame=_leftCarouselView.frame;
            frame.origin.y=44+(IOS7?20:0);
            _leftCarouselView.frame=frame;
            
            frame=_rightCarouselView.frame;
            frame.origin.y=44+(IOS7?20:0);
            _rightCarouselView.frame=frame;
            
            
            frame=_leftTalbleView.frame;
            frame.origin.y=self.view.frame.size.height;
            _leftTalbleView.frame=frame;
            
            frame=_rightTalbleView.frame;
            frame.origin.y=self.view.frame.size.height;
            _rightTalbleView.frame=frame;
            
        } completion:^(BOOL finish){
            sender.enabled=YES;
        }];
        
    }
}

@end

//
//  AppDelegate.m
//  影讯
//
//  Created by 罗 何 on 13-12-20.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "CinemaViewController.h"



@interface AppDelegate ()<UITabBarControllerDelegate>{
    UITabBarController *        _root;
}

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.window=[[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    self.window.backgroundColor=[UIColor whiteColor];
    
    
    [self initRootViewController];
    self.window.rootViewController=_root;
    [_root release];
    [self.window makeKeyAndVisible];
    return YES;
    
}



- (void)initRootViewController{
    NSMutableArray *Controllers=[NSMutableArray array];
    UINavigationController *nav=nil;
    
    //first
    FirstViewController *first=[[FirstViewController alloc]init];
    nav=[[UINavigationController alloc]initWithRootViewController:first];
    nav.title=@"电影";
    [first release];
    [Controllers addObject:nav];
    [nav release];
    nav.navigationBarHidden=YES;
    
    
    //second
    CinemaViewController *second=[[CinemaViewController alloc]init];
    nav=[[UINavigationController alloc]initWithRootViewController:second];
    nav.title=@"影院";
    [second release];
    [Controllers addObject:nav];
    [nav release];
    nav.navigationBarHidden=YES;
    

    UIViewController *third=[[UIViewController alloc]init];
    nav=[[UINavigationController alloc]initWithRootViewController:third];
    nav.title=@"我的";
    [third release];
    [Controllers addObject:nav];
    [nav release];
    nav.navigationBarHidden=YES;
    
    //forth
    UIViewController *forth=[[UIViewController alloc]init];
    nav=[[UINavigationController alloc]initWithRootViewController:forth];
    nav.title=@"更多";
    [forth release];
    [Controllers addObject:nav];
    [nav release];
    nav.navigationBarHidden=YES;
    
    
    _root=[[UITabBarController alloc]init];
    _root.delegate=(id)self;
    _root.viewControllers=Controllers;
}


@end

//
//  GloabDef.h
//  m1905_iPad_2
//
//  Created by hehc on 12-11-22.
//  Copyright (c) 2012年 m1905. All rights reserved.
//

#import <Foundation/Foundation.h>
   

//#define NSLog(...) {}
#define IOS7 ([[UIDevice currentDevice].systemVersion integerValue]>=7.0f)
#define BUNDLE_FILEPATH                     [[NSBundle mainBundle] resourcePath]

#define RELEASE_SAFELY(__POINTER)           {[__POINTER release]; __POINTER = nil;}
 
#define UICOLOR_FROM_RGB(r,g,b)             [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]

#define UICOLOR_FROM_RGB_OxFF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                         blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//
//  AsyLayer.m
//  影讯
//
//  Created by 罗 何 on 13-12-20.
//  Copyright (c) 2013年 罗 何. All rights reserved.
//

#import "AsyLayer.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"


@interface AsyLayer ()<ASIHTTPRequestDelegate>{
    ASIHTTPRequest *_request;
}
@end


@implementation AsyLayer

- (void)dealloc{
    [_request clearDelegatesAndCancel];
    [_request release];
    [super dealloc];
}

- (void)setImageUrl:(NSString *)url{
    [_request clearDelegatesAndCancel];
    
    _request=[[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]] retain];
    
    [_request setDownloadCache:[ASIDownloadCache sharedCache]];
    [_request setCacheStoragePolicy:ASICacheForSessionDurationCacheStoragePolicy];
    [_request setCachePolicy:(ASIAskServerIfModifiedWhenStaleCachePolicy | ASIFallbackToCacheIfLoadFailsCachePolicy)];
    [_request setDelegate:self];
    [_request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    UIImage *image=[UIImage imageWithData:[request responseData]];
    [self setContents:(id)image.CGImage];
    
    [_request clearDelegatesAndCancel];
    [_request release];
    _request=NULL;
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    
    [_request clearDelegatesAndCancel];
    [_request release];
    _request=NULL;
}

@end

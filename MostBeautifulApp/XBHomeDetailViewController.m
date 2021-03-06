//
//  HomeDetailViewController.m
//  MostBeautifulApp
//
//  Created by coder on 16/5/26.
//  Copyright © 2016年 coder. All rights reserved.
//
#import "XBHomeDetailViewController.h"
#import "XBMenuView.h"
#import "AppFavorite.h"
#import "XBContentView.h"
#import "XBHomeToolBar.h"
#import "XBShareWeChatView.h"
#import "SMProgressHUD.h"
#import "XBUserDefaultsUtil.h"
#import "XBLoginViewController.h"
@interface XBHomeDetailViewController () <XBContentViewDelegate,XBMenuViewDelegate,XBHomeToolBarDelegate,XBShareWeChatViewDelegate>

@end

@implementation XBHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.menuView.delegate = self;
    
    self.contentView.delegate = self;
 
    self.toolBar.toolBarDelegate = self;
    
    self.shareWeChatView.delegate = self;
}

#pragma mark -- XBMenuViewDelegate
- (void)menuView:(XBMenuView *)menuView didSelectedWithType:(XBMenuViewDidSelectedType)type atIndex:(NSInteger)index
{
    if (type == XBMenuViewDidSelectedTypeFavorite && ![XBUserDefaultsUtil userInfo]) {
        [self presentViewController:[[XBLoginViewController alloc] init] animated:YES completion:nil];
        return;
    }
    
    [super menuView:menuView didSelectedWithType:type atIndex:index];
}

#pragma mark -- XBContentViewDelegate
- (void)contentAttributedLabel:(TTTAttributedLabel *)label
          didSelectLinkWithURL:(NSURL *)url
{
    [super contentAttributedLabel:label didSelectLinkWithURL:url];
}

#pragma mark -- XBHomeToolBarDelegate
- (void)toolBarDidSelectedBeautiful:(XBHomeToolBar *)toolBar
{
    [super toolBarDidSelectedBeautiful:toolBar];
}

- (void)toolBarDidSelectedFeel:(XBHomeToolBar *)toolBar
{
    [super toolBarDidSelectedFeel:toolBar];
}

- (void)toolBarDidSelectedComment:(XBHomeToolBar *)toolBar
{
    [super toolBarDidSelectedComment:toolBar];
}

#pragma mark -- XBShareWeChatViewDelegate
- (void)shareWeChatViewDidSelected
{
    [super shareWeChatViewDidSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

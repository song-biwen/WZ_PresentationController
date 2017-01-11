//
//  WZMainController.m
//  PresentationController
//
//  Created by songbiwen on 2017/1/11.
//  Copyright © 2017年 songbiwen. All rights reserved.
//

#import "WZMainController.h"
#import "WZTableViewController.h"


@interface WZMainController ()
<UIPopoverPresentationControllerDelegate>
@end

@implementation WZMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WZMainController";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonItemAction:)];
    
    self.view.backgroundColor = [UIColor brownColor];
    
}

#pragma makr - UIPopoverPresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationFullScreen;
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
    return nav;
}


#pragma mark - UIPopoverPresentationControllerDelegate
- (void)rightBarButtonItemAction:(UIBarButtonItem *)barButtonItem {
    WZTableViewController *tableVC = [[WZTableViewController alloc] init];
    tableVC.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popover = tableVC.popoverPresentationController;
    popover.delegate = self;
    popover.barButtonItem = barButtonItem;
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    [self presentViewController:tableVC animated:YES completion:nil];
}

@end

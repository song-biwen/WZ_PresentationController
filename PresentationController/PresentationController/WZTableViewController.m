//
//  WZTableViewController.m
//  PresentationController
//
//  Created by songbiwen on 2017/1/11.
//  Copyright © 2017年 songbiwen. All rights reserved.
//

#import "WZTableViewController.h"
#import "WZMainController.h"
#import "WZSearchController.h"

@interface WZTableViewController ()

@end

@implementation WZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WZTableViewController";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBarButtonItemAction)];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    WZSearchController *resultVc = [[WZSearchController alloc] init];
    UISearchController *searchVc = [[UISearchController alloc] initWithSearchResultsController:resultVc];
    searchVc.searchResultsUpdater = resultVc;
    self.tableView.tableHeaderView = searchVc.searchBar;
    self.definesPresentationContext = YES;
}

- (void)rightBarButtonItemAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section:%zd,row:%zd",indexPath.section,indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[[WZMainController alloc] init] animated:YES];
}
@end

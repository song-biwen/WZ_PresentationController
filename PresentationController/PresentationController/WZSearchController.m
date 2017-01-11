//
//  WZSearchController.m
//  PresentationController
//
//  Created by songbiwen on 2017/1/11.
//  Copyright © 2017年 songbiwen. All rights reserved.
//

#import "WZSearchController.h"

@interface WZSearchController ()


@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation WZSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
        _contentLabel.numberOfLines = 0;
        [self.view addSubview:_contentLabel];
    }
    return _contentLabel;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    self.contentLabel.text = searchController.searchBar.text;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

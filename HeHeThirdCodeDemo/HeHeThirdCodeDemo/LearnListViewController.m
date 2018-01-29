//
//  LearnListViewController.m
//  HeHeThirdCodeDemo
//
//  Created by ycb on 2018/1/29.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import "LearnListViewController.h"
#import "LearnListModel.h"
#import "LearnListCell.h"

@interface LearnListViewController ()
@property (nonatomic,strong) LearnListModel *liearListM;
@end

@implementation LearnListViewController
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.liearListM = [[LearnListModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return LearlistSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case LearlistSectionNetworking: {
            NSArray *arr = [self.liearListM.itmes objectAtIndex:LearlistSectionNetworking];
            return arr.count;
        }
        default:
            return 0;
    };
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LearnListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LearnListCell"];
    NSArray *arr = [self.liearListM.itmes objectAtIndex:LearlistSectionNetworking];
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case LearlistSectionNetworking:
            switch (indexPath.row) {
                case 0:
                    [self performSegueWithIdentifier:@"AFNetworkingSegue" sender:self];
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
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

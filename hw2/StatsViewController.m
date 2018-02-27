//
//  StatsViewController.m
//  hw2
//
//  Created by Zachary Kimelheim on 2/25/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numItems;
@property (weak, nonatomic) IBOutlet UILabel *daNewItems;

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _numItems.text = self.numItemsValue;
    _daNewItems.text = self.newwItemsValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)donePressed:(id)sender {
     [self dismissViewControllerAnimated:true completion:nil];
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

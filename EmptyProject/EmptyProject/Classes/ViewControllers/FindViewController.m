//
//  FindViewController.m
//  EmptyProject
//
//  Created by HuangMian on 2017/2/28.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "FindViewController.h"
#import "CustomTextView.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CustomTextView *textView = [[CustomTextView alloc] initWithFrame:CGRectMake(10, 50, 200, 200)];
    textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  ViewController.m
//  EmptyProject
//
//  Created by HuangMian on 2017/5/29.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "ViewController.h"
#import "VCView.h"
#import "CoreTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view addSubview:[[VCView alloc] initWithFrame:[self.view bounds]]];
    
    [self.view addSubview:[[CoreTextView alloc] initWithFrame:[self.view bounds]]];
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

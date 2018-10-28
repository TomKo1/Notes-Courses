//
//  ViewController.m
//  MyOBJCApp
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"
// access of all Swift classes MyProjectName-Swift.h
#import "MyOBJCApp-Swift.h"

@interface ViewController ()
@property(nonatomic, strong) SecondVC *secondVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loadSecondVC:(id)sender {
    _secondVC = [[SecondVC alloc]init];
    _secondVC.view.backgroundColor = [UIColor purpleColor];
    [self presentViewController:_secondVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

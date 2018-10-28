#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Objective-c dictionares can have interchangable types
    // not only one like in Swift
    NSNumber *age = [NSNumber numberWithInt:40];
    NSNumber *age2 = [NSNumber numberWithInt:34];
    
//    NSDictionary *dict = @{@"jack": @"smith", @"jon": age2, @"peter":@"parker"};
    
    NSDictionary *dict = @{ @"jon": age2, @"peter":age};
    
    int jacksAge = [[dict objectForKey:@"jack"] intValue];
    
    // NSMutableDictionary
    NSMutableDictionary *mut = [@{@"1": @"BMW", @"2":@"VOLVO", @"3":@"Ugy Honda Civic"} mutableCopy];
    NSMutableDictionary *mut2 = [[NSMutableDictionary alloc]init];
    [mut2 setObject:@"An object" forKey:@"A key"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

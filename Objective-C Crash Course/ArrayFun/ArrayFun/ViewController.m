#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // alwyas initialize NSArray with data
//    NSArray *arr = [[NSArray alloc]init];
//    NSString *str = @"Yay for string!";
    NSArray *array = [NSArray arrayWithObjects:@"My", @"mother",@"told",@"me", nil];
    NSArray *arr2 = @[@"Donkey", @"Kong", @"Ate"];
    
    NSString *str = [array objectAtIndex:2];
    array = nil;
    
    NSMutableArray *mut = [NSMutableArray arrayWithObjects:@"witam",@"zegnam",@"witam2",@"tktak", nil];
    NSLog(@"MUT: %@", mut.debugDescription);
    
    [mut removeObjectAtIndex:2];
    NSLog(@"Mut 2 %@", mut.debugDescription);
    
    NSArray *arr3 = [NSArray arrayWithArray:array];
    // you can convert it
    NSArray *arr4 = mut;
    // but this you can't do
//    NSMutableArray *arr4 = array;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

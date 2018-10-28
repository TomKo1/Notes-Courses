//
//  ViewController.m
//  DevslopesTutorials
//
//  Created by Tomasz Kot on 14.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property(nonatomic, strong)NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableVIew.dataSource = self;
    self.tableVIew.delegate = self;

    [[HTTPService instance]getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(NSDictionary *d in dataArray) {
                Video *vid = [[Video alloc]init];
                vid.videoTitle = [d objectForKey:@"title"];
                vid.videoDescription = [d objectForKey:@"description"];
                vid.thumbnailUrl = [d objectForKey:@"thumbnail"];
                vid.videoIframe = [d objectForKey:@"iframe"];
                
                [arr addObject:vid];
            }
            // NSMutableArray can be assigned to NSArray but not vice versa
            self.videoList = arr;
            
            [self updateTableData];
            
        } else if(errMessage) {
            // dispaly alert to user
        }
    }];
}

// grabs main thread and updates table
-(void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableVIew reloadData];
    });
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell*)cell;
    [vidCell updateUI:video];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier: @"videoVC" sender:video];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
    if(!cell) {
        cell = [[VideoCell alloc]init];
    }
    
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoVC *vc = (VideoVC*)segue.destinationViewController;
    Video *video = (Video*)sender;
    
    vc.video = video;
}

@end

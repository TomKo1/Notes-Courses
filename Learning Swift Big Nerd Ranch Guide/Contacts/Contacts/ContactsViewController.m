//
//  ViewController.m
//  Contacts
//
//  Created by Tomasz Kot on 07.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ContactsViewController.h"


// rozszerzenie VC UITableViewController (zgodnej z
// UITablrViewDataSource) o tablice z naszymi danymi
@interface ContactsViewController()

@property(nonatomic,readonly,strong) NSMutableArray * contacts;

@end



@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// metoda dodajaca dane poczatkowe do tablicy contacts
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder: aDecoder];
    if(self){
    
        Contact * c1 = [[Contact alloc]initWithContactName: @"Jan Kowalski"];
        Contact * c2 = [[Contact alloc]initWithContactName: @"Pawel Nowak"];
        Contact * c3 = [[Contact alloc]initWithContactName: @"Joanna Malinowska"];
        
        _contacts = [NSMutableArray arrayWithArray: @[c1, c2, c3]];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contacts.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    Contact *contact = self.contacts[indexPath.row];
    
    cell.textLabel.text = contact.name;
    
    return cell;    
}



@end

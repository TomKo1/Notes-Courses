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


- (IBAction)cancelToContactsViewController:(UIStoryboardSegue * )segue {
    // jeżeli użytkownik przerywa operacje, nie bedzie podjete zadne dzialanie
    
}


- (IBAction)createNewContact:(UIStoryboardSegue *)segue {
    NewContactViewController * newContactVC = segue.sourceViewController;
    NSString *firstName = newContactVC.firstTextField.text;
    NSString *lastName = newContactVC.lastNameTextField.text;
    
    if(firstName.length != 0 || lastName.length != 0 ){
        NSString * contactName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact * newContact = [[Contact alloc] initWithContactName:contactName];
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
}

// metoda dodajaca dane poczatkowe do tablicy contacts
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder: aDecoder];
    if(self){
        _contacts = [NSMutableArray array];
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

//
//  UserListViewController.m
//  TypicodeUsers
//
//  Created by vikash on 06/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "UserListViewController.h"
#import "DetailViewController.h"
#import "User.h"
#import "Network.h"

@interface UserListViewController ()
@property(nonatomic, strong) NSArray *userList;
@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UserList";
   // self.arrayList = [[NSMutableArray alloc]init];
    Network *network = [[Network alloc] init];
    network.delegate = self;
    [network getUserList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) receivedUserList:(NSArray *) userList{
    self.userList = userList;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    User *tempUser = (User*)[self.userList objectAtIndex:indexPath.row];
    cell.textLabel.text = tempUser.name;

   // cell.textLabel.text = [[self.arrayList objectAtIndex:indexPath.row] valueForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    User *selectedUser = (User*)[self.userList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"DetailVCSegue" sender:selectedUser];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender{
    DetailViewController *vcToPushTo = segue.destinationViewController;
    vcToPushTo.objectUser = (User *)sender ;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

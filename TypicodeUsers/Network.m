//
//  Network.m
//  TypicodeUsers
//
//  Created by vikash on 08/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "Network.h"
#import "User.h"


@implementation Network
-(void) getUserList{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users/"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableArray *userArray = [[NSMutableArray alloc]init];;

            NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [tempArray enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
                //self.arrayList=  User;
                NSDictionary *dic = (NSDictionary*)object;
                User *user = [[User alloc]initWithDictionary:dic];
                [userArray addObject:user];
                ;

                
            }
             ];
            [self.delegate receivedUserList:(NSArray *)userArray];

//            dispatch_async(dispatch_get_main_queue(), ^{
//                //UI Task
//                [self.tableView reloadData];
//            });
            
        }
    }];
    
    [dataTask resume];
}

@end

//
//  User.m
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype) initWithDictionary:(NSDictionary*) dictionaryUser{
    self = [super init];
    if (self) {
        self.userID = (int)[dictionaryUser valueForKey:@"id"];
        self.name = [dictionaryUser valueForKey:@"name"];
        self.username = [dictionaryUser valueForKey:@"username"];
        self.email = [dictionaryUser valueForKey:@"email"];
        self.phone = [dictionaryUser valueForKey:@"phone"];
        self.website = [dictionaryUser valueForKey:@"website"];
        self.address = [[Address alloc]initWithDictionary:[dictionaryUser valueForKey:@"address"]];
        self.company = [[Company alloc]initWithDictionary:[dictionaryUser valueForKey:@"company"]];
    }
    return self;
}
@end

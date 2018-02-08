//
//  User.h
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
#import "Company.h"


@interface User : NSObject
@property (assign) int userID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) Address *address;
@property (nonatomic, strong) Company *company;
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryUser;

@end

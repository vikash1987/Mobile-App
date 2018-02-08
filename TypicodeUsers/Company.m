//
//  Company.m
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "Company.h"

@implementation Company
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryCompany{
    self = [super init];
    if (self) {
        self.name = [dictionaryCompany valueForKey:@"name"];
        self.catchPhrase = [dictionaryCompany valueForKey:@"catchPhrase"];
        self.bs = [dictionaryCompany valueForKey:@"bs"];
    }
    return self;
}
@end

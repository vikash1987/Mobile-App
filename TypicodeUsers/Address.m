//
//  Address.m
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "Address.h"

@implementation Address
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryAddress{
    self = [super init];
    if (self) {
        self.street = [dictionaryAddress valueForKey:@"street"];
        self.suite = [dictionaryAddress valueForKey:@"suite"];
        self.city = [dictionaryAddress valueForKey:@"city"];
        self.zipcode = [dictionaryAddress valueForKey:@"zipcode"];
        self.geoLocation = [[GeoLocation alloc]initWithDictionary:[dictionaryAddress valueForKey:@"geo"]];
    }
    return self;
}
@end

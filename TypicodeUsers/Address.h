//
//  Address.h
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoLocation.h"
@interface Address : NSObject
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *suite;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) GeoLocation *geoLocation;
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryAddress;
@end

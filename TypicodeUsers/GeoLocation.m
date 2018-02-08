//
//  GeoLocation.m
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "GeoLocation.h"

@implementation GeoLocation
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryGeoLocation{
    self = [super init];
    if (self) {
        self.lat = [dictionaryGeoLocation valueForKey:@"lat"];
        self.lng = [dictionaryGeoLocation valueForKey:@"lng"];
    }
    return self;
}
@end

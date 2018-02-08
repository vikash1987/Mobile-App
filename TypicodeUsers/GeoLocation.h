//
//  GeoLocation.h
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoLocation : NSObject
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryGeoLocation;
@end

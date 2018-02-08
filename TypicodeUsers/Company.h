//
//  Company.h
//  TypicodeUsers
//
//  Created by vikash on 07/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *catchPhrase;
@property (nonatomic, strong) NSString *bs;
-(instancetype) initWithDictionary:(NSDictionary*) dictionaryCompany;
@end

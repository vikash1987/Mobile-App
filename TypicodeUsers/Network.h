//
//  Network.h
//  TypicodeUsers
//
//  Created by vikash on 08/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NetworkDelegate<NSObject>

-(void) receivedUserList:(NSArray *) userList;

@end

@interface Network : NSObject
@property (nonatomic,retain) id<NetworkDelegate> delegate;
-(void) getUserList;

@end

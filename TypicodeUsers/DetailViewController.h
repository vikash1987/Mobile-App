//
//  DetailViewController.h
//  TypicodeUsers
//
//  Created by vikash on 06/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "User.h"
@interface DetailViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, strong) User *objectUser;
@end


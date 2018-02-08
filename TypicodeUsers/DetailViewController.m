//
//  DetailViewController..
//  TypicodeUsers
//
//  Created by vikash on 06/02/18.
//  Copyright © 2018 vikash. All rights reserved.
//

#import "DetailViewController.h"
#import "Address.h"
#import "Address.h"
#import <objc/runtime.h>

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, strong) NSArray *sectionArr;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.objectUser.name;
    self.userName.text = self.objectUser.username;
    _mapView.showsUserLocation = YES;
    self.mapView.delegate = self;    // Do any additional setup after loading the view, typically from a nib
    NSString *latString = [[self.objectUser.address valueForKey:@"geoLocation"]valueForKey:@"lng"];
    NSString *lngString = [[self.objectUser.address valueForKey:@"geoLocation"]valueForKey:@"lng"];


    CLLocationCoordinate2D coord;
    coord.latitude = latString.doubleValue;
    coord.longitude = lngString.doubleValue;
    coord.latitude = 13.03297;
    coord.longitude = 80.26518;
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = [self.objectUser.address valueForKey:@"city"];
    annotation.subtitle = [self.objectUser.address valueForKey:@"street"];
    [annotations addObject:annotation];
    [self.mapView addAnnotations:[self createAnnotations:coord]];
    [self updateMapView:coord];
    
   self.sectionArr = [self allPropertyNames];

}
- (NSArray *)allPropertyNames
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([User class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}

- (NSMutableArray *)createAnnotations:(CLLocationCoordinate2D )coord
{
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = [self.objectUser.address valueForKey:@"city"];
    annotation.subtitle = [self.objectUser.address valueForKey:@"street"];
    annotation.coordinate = coord;
    [annotations addObject:annotation];
    return annotations;
}
- (void)updateMapView:(CLLocationCoordinate2D )coord
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coord, 5000.0,7000.0);
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView regionThatFits:viewRegion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    NSString *key = [self.sectionArr objectAtIndex:indexPath.row];
    NSString *value=@"";;
    if ([key isEqualToString:@"address"]) {
        value =  [[self.objectUser valueForKey:[self.sectionArr objectAtIndex:indexPath.row]] valueForKey:@"city"];

    }
    else if([key isEqualToString:@"company"]) {
        value =  [[self.objectUser valueForKey:[self.sectionArr objectAtIndex:indexPath.row]] valueForKey:@"name"];

    }
    else if([key isEqualToString:@"userID"]) {
        value =  [[self.objectUser valueForKey:[self.sectionArr objectAtIndex:indexPath.row]] stringValue];
    }
    else{
    value = [self.objectUser valueForKey:[self.sectionArr objectAtIndex:indexPath.row]];
       
    }
    NSString *upperCaseChar = [[key substringToIndex:1] capitalizedString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString: upperCaseChar];

    NSString *label = [[key stringByAppendingString:@": "] stringByAppendingString:value];
    cell.textLabel.text = label;
    
    // cell.textLabel.text = [[self.arrayList objectAtIndex:indexPath.row] valueForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

@end

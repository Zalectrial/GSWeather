//
//  Weather+CoreDataProperties.m
//  GSWeather
//
//  Created by Gridstone on 5/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Weather+CoreDataProperties.h"

@implementation Weather (CoreDataProperties)

@dynamic longitude;
@dynamic latitude;
@dynamic timezone;
@dynamic offset;
@dynamic currentWeather;
@dynamic dailyWeather;
@dynamic hourlyWeather;

@end

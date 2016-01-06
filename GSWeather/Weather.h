//
//  Weather.h
//  GSWeather
//
//  Created by Gridstone on 5/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WeatherDay, WeatherTime;

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Weather+CoreDataProperties.h"

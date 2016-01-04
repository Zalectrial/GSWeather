//
//  UIFont+Extended.m
//  GSWeather
//
//  Created by Megan Efron on 4/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//

#import "UIFont+Extended.h"

@implementation UIFont (Extended)

+ (UIFont *)screenTitleFont {
    return [UIFont systemFontOfSize:22];
}

+ (UIFont *)bigTitleFont {
    return [UIFont systemFontOfSize:65 weight:UIFontWeightUltraLight];
}

+ (UIFont *)smallTitleFont {
    return [UIFont systemFontOfSize:22 weight:UIFontWeightLight];
}

+ (UIFont *)bodyFont {
    return [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
}

+ (UIFont *)cellFont {
    return [UIFont systemFontOfSize:16 weight:UIFontWeightThin];
}

@end

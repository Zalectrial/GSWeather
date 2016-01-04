//
//  WeatherViewController.m
//  GSWeather
//
//  Created by Megan Efron on 4/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//

#import "WeatherViewController.h"
#import "UIColor+Extended.h"
#import "UIFont+Extended.h"

@interface WeatherViewController ()     <UITableViewDelegate, UITableViewDataSource>

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Gradient Color
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[[UIColor topColor] CGColor], (id)[[UIColor bottomColor] CGColor]];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    // Title Label
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont screenTitleFont];
    titleLabel.text = @"Melbourne, AU";
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titleLabel];
    
    //Weather Image
    UIImage *weather = [UIImage imageNamed:@"clear-day"];
    UIImageView *weatherImage = [[UIImageView alloc] initWithImage:weather];
    weatherImage.translatesAutoresizingMaskIntoConstraints = NO;
    weatherImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:weatherImage];
    
    //Temperature Label
    UILabel *temperatureLabel = [[UILabel alloc] init];
    temperatureLabel.textColor = [UIColor textColor];
    temperatureLabel.font = [UIFont bigTitleFont];
    temperatureLabel.text = @"17.6°";
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:temperatureLabel];
    
    //Weather Type Label
    UILabel *weatherTypeLabel = [[UILabel alloc] init];
    weatherTypeLabel.textColor = [UIColor textColor];
    weatherTypeLabel.font = [UIFont smallTitleFont];
    weatherTypeLabel.text = @"Clear Day";
    weatherTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:weatherTypeLabel];
    
    //Weather Min/Max Label
    UILabel *weatherMinMax = [[UILabel alloc] init];
    weatherMinMax.textColor = [UIColor whiteColor];
    weatherMinMax.font = [UIFont smallTitleFont];
    weatherMinMax.text = @"15°/24°";
    weatherMinMax.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:weatherMinMax];
    
    //Weather Date Label
    UILabel *weatherDate = [[UILabel alloc] init];
    weatherDate.textColor = [UIColor whiteColor];
    weatherDate.font = [UIFont bodyFont];
    weatherDate.text = @"Mon, 4 Jan";
    weatherDate.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:weatherDate];
    
    //Weather Table View
    UITableView *weatherTable = [[UITableView alloc] init];
    weatherTable.translatesAutoresizingMaskIntoConstraints = NO;
    weatherTable.delegate = self;
    weatherTable.dataSource = self;
    [self.view addSubview:weatherTable];
    weatherTable.backgroundColor = [UIColor clearColor];
    
    [NSLayoutConstraint activateConstraints:@[
                                              
        // Title Label
        [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20],
        
        // Weather Image
        [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
        [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:temperatureLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20],
        
        //Temperature Label
        [NSLayoutConstraint constraintWithItem:temperatureLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:temperatureLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-30],
        
        //Weather Type Label
        [NSLayoutConstraint constraintWithItem:weatherTypeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:temperatureLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10],
        [NSLayoutConstraint constraintWithItem:weatherTypeLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:25],
        
        //Weather Min/Max Label
        [NSLayoutConstraint constraintWithItem:weatherMinMax attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:temperatureLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10],
        [NSLayoutConstraint constraintWithItem:weatherMinMax attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30],
        
        //Weather Date Label
        [NSLayoutConstraint constraintWithItem:weatherDate attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:weatherMinMax attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5],
        [NSLayoutConstraint constraintWithItem:weatherDate attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30],
        
        //Weather Table View
        [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:weatherDate attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10],
        [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
    
    ]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ReuseIdentifier"];
    cell.textLabel.text = @"Mon";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont cellFont];
    cell.detailTextLabel.text = @"15°/24°";
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.font = [UIFont cellFont];
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:@"clear-night-small"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Something");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

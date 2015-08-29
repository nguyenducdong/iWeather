//
//  ViewController.m
//  iWeather
//
//  Created by Dong Nguyen Duc on 8/29/15.
//  Copyright (c) 2015 Dong Nguyen Duc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *location;

@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;

@property (weak, nonatomic) IBOutlet UILabel *labelTemperature;

@end

@implementation ViewController{
    NSArray *quotes;
    NSArray *locations;
    NSArray *photoFiles;
    BOOL flag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ",@"Có công mài sắt có ngày nên kim",@"Chớ thấy sóng cả mà ngã tay chèo",@"Không gì quý hơn độc lập tự do hạnh phúc",@"Đi một ngày học một sàn khôn"];
    
    locations = @[@"TP HCM", @"Hà Nội",@"Đà Nẵng",@"Nha Trang",@"Cần Thơ",@"Tokyo"];
    photoFiles = @[@"sunny",@"thunder",@"rain",@"windy"];
    flag = NO;
}



-(IBAction)updateWeather:(id)sender{
    int quoteIndex = arc4random_uniform(quotes.count);//return một số ngẫu nhiên nhỏ hơn quotes.count-1
    NSLog(@"%d",quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoFileIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoFileIndex]];
    
    NSString *stringTemperature = [NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    NSLog(@"%@",stringTemperature);
    [self.temperature setTitle:stringTemperature forState:UIControlStateNormal];
}

-(float)getTemperature{
    
    return 14.0 + arc4random_uniform(18) + (float)arc4random() / (float)INT32_MAX;
}

-(IBAction)tapButtonTemperature:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (!flag) {
        NSString *str = [btn titleForState:UIControlStateNormal];
        float tempC = [str floatValue];
        float Fahrenheit = tempC *1.8 + 32;
        [btn setTitle:[NSString stringWithFormat:@"%.1f",Fahrenheit] forState:UIControlStateNormal];
        flag = YES;
        self.labelTemperature.text = @"F";
    }else{
        NSString *str = [btn titleForState:UIControlStateNormal];
        float tempF = [str floatValue];
        float Celsius = (tempF - 32)/1.8;
        [btn setTitle:[NSString stringWithFormat:@"%.1f",Celsius] forState:UIControlStateNormal];
        self.labelTemperature.text = @"C";
        flag = NO;
    }
    
    
}

@end

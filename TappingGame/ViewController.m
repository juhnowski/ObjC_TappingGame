//
//  ViewController.m
//  TappingGame
//
//  Created by SBT on 01/05/2018.
//  Copyright © 2018 SBT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    timeInt = 10;
    tapInt = 0;
    self.tapButtonOutlet.enabled = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)StartGame:(id)sender {
    if (timeInt == 10){
        tapInt = 0;
        self.tapButtonOutlet.enabled = YES;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(StartCounter) userInfo:nil repeats:YES];
    }
}

-(void) StartCounter {
    timeInt -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%i",timeInt];
    if (timeInt == 0) {
        [timer invalidate];
    }
}

- (IBAction)TapButton:(id)sender {
    if(timeInt >0 ){
        tapInt += 1;
        self.tapLabel.text = [NSString stringWithFormat:@"%i",tapInt];
    }
    
    if (timeInt == 0) {
        timeInt = 10;
        tapInt = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%i",timeInt];
        self.tapLabel.text = [NSString stringWithFormat:@"%i",tapInt];
        
        self.tapButtonOutlet.enabled = NO;
    }
}
@end

//
//  ExampleViewController.h
//  Calculator
//
//  Created by apple06 on 2014. 4. 29..
//  Copyright (c) 2014년 COMP420. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"



@interface CalculatorViewController : UIViewController
{
    IBOutlet UILabel *display;
    IBOutlet UILabel *storeDisplay;
    CalculatorBrain *brain;
    BOOL userIsInTeMiddleOfTypingANumber;
    BOOL dotInputed;
    IBOutlet UISegmentedControl *selectRadDeg;
}

-(IBAction)digitPressed:(UIButton *)sender;
-(IBAction)operationPressed:(UIButton *)sender;
@end

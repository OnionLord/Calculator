//
//  ExampleViewController.m
//  Calculator
//
//  Created by apple06 on 2014. 4. 29..
//  Copyright (c) 2014년 COMP420. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

-(CalculatorBrain *)brain
{
    if(!brain)
        brain = [[CalculatorBrain alloc] init];
    return brain;
}

-(IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    if(userIsInTeMiddleOfTypingANumber)
    {
        [display setText:[[display text] stringByAppendingString:digit]];
    }
    else
    {
        [display setText:digit];
        userIsInTeMiddleOfTypingANumber = YES;
    }
}
-(IBAction)operationPressed:(UIButton *)sender
{
    if(userIsInTeMiddleOfTypingANumber)
    {
        [[self brain] setOperand:[[display text]doubleValue]];
        userIsInTeMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText : [NSString stringWithFormat:@"%g", result]];
}
@end

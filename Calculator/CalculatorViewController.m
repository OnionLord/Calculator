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
        dotInputed = NO;
    }
}
- (IBAction)dotPressed:(UIButton *)sender
{
    if(!dotInputed)
    {
        dotInputed = YES;
        NSString *init;
        if(userIsInTeMiddleOfTypingANumber)
        {
            init = @".";
            [display setText:[[display text] stringByAppendingString:init]];
        }
        else{
            init = @"0.";
            [display setText:init];
            userIsInTeMiddleOfTypingANumber = YES;
        }
    }
}

-(IBAction)operationPressed:(UIButton *)sender
{
    
    if(userIsInTeMiddleOfTypingANumber)
    {
        [[self brain] setOperand:[[display text]doubleValue]];
        userIsInTeMiddleOfTypingANumber = NO;
        dotInputed = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText : [NSString stringWithFormat:@"%g", result]];
}
- (IBAction)storePressed:(UIButton *)sender {
    NSString *content = [display text];
    double doubledContent = [content doubleValue];
    [[self brain] setStore:doubledContent];
    [storeDisplay setText : [NSString stringWithFormat:@"Memory : %g", [[self brain] getStore]]];
}
- (IBAction)memPlusPressed:(UIButton *)sender
{
    NSString *content = [display text];
    double doubledContent = [content doubleValue]+ [[self brain] getStore];
    [[self brain] setStore:doubledContent] ;
    [storeDisplay setText : [NSString stringWithFormat:@"Memory : %g", [[self brain] getStore]]];
}



- (IBAction)cPressed:(UIButton *)sender {
    userIsInTeMiddleOfTypingANumber = NO;
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText : [NSString stringWithFormat:@"%g", result]];
    
}

- (IBAction)algeModeChanged:(UISegmentedControl *)sender {
    NSInteger mode = [selectRadDeg selectedSegmentIndex];
    [[self brain] setAlgeMode:mode];
    
}
- (IBAction)delPressed:(UIButton *)sender
{
    NSString *str = display.text;
    NSString *truncatedString ;
    if([str length] <= 1)
    {
        truncatedString = @"0";
        userIsInTeMiddleOfTypingANumber = NO;
    }
    else{
        NSString * indexChar = [str substringWithRange:NSMakeRange([str length]-1, 1)];
        if([indexChar isEqual:@"."])
        {
            dotInputed = NO;
        }
        truncatedString = [str substringToIndex:[str length]-1];
    }
    [display setText:truncatedString];
    
}




@end

//
//  CalculatorBrain.m
//  Calculator
//
//  Created by apple06 on 2014. 4. 29..
//  Copyright (c) 2014년 COMP420. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain
-(void)setStore:(double)anStoredValue
{
    storedValue = anStoredValue;
}
-(double)getStore
{
    return storedValue;
}
-(void)setOperand:(double)anOperand
{
    operand = anOperand;
}
-(double)performOperation:(NSString *)Operation
{
    if([Operation isEqual:@"Sqrt"])
    {
        if(operand >= 0)
        {
            operand = sqrt(operand);
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Square root of negative number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil ];
            [alert show];
        }
    }
    else if([Operation isEqual:@"1/x"])
    {
        if(operand)
        {
            operand = 1 / operand;
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Divide by zero." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil ];
            [alert show];
        }
    }
    else if([Operation isEqual:@"π"])
    {
        operand = M_PI;
        //waitingOperand = operand;
    }
    else if([Operation isEqual:@"+/-"])
    {
        operand = operand * -1;
    }
    else if([Operation isEqual:@"C"])
    {
        waitingOperation=nil;
        waitingOperand = 0;
        operand = 0;
    }
    else if([Operation isEqual:@"Recall"])
    {
        operand = storedValue;
        //waitingOperand = operand;
    }
    else if([Operation isEqual:@"sin"])
    {
        NSLog(@"%g", M_PI * operand / 180);
        if(algeMode == 0)
            operand = sin(operand);
        else
            operand = sin( M_PI * operand / 180 );
    }
    else if([Operation isEqual:@"cos"])
    {
        NSLog(@"%g", M_PI * operand / 180);
        if(algeMode == 0)
            operand = cos(operand);
        else
            operand = cos(M_PI * operand / 180);
    }
    else{
        [self performWaitingOperation];
        waitingOperation = Operation;
        waitingOperand = operand;
    }
    return operand;
}

-(void)performWaitingOperation
{
    if([@"+" isEqual:waitingOperation])
    {
        operand = waitingOperand + operand;
    }
    else if([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    else if([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    else if([@"/" isEqual:waitingOperation])
    {
        if(operand)
        {
            operand = waitingOperand / operand;
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Divide by zero." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil ];
            [alert show];
        }
    }
}
-(void)setAlgeMode:(NSInteger)anAlgeMode
{
    algeMode = anAlgeMode;
}
@end


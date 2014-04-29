//
//  CalculatorBrain.m
//  Calculator
//
//  Created by apple06 on 2014. 4. 29..
//  Copyright (c) 2014년 COMP420. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain
-(void)setOperand:(double)anOperand
{
    operand = anOperand;
}
-(double)performOperation:(NSString *)Operation
{
    if([Operation isEqual:@"Sqrt"])
    {
        operand = sqrt(operand);
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
    }
}
@end


//
//  CalculatorBrain.h
//  Calculator
//
//  Created by apple06 on 2014. 4. 29..
//  Copyright (c) 2014년 COMP420. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject{
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
    double storedValue;
    NSInteger algeMode;
}

-(void)setStore:(double)anStoredValue;
-(double)getStore;
-(void)setOperand:(double)anOperand;
-(double)performOperation:(NSString *)Operation;
-(void)setAlgeMode:(NSInteger)anAlgeMode;

@end

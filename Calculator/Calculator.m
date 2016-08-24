//
//  Calculator.m
//  Sample 0823
//
//  Created by ㅇ on 2016. 8. 23..
//  Copyright © 2016년 LDCC. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
//{                                      이 주석들 전부 Calculator.h의 property선언으로 인해 주석이 가능해
//    double accumulator;                그리고 밑에 self.를 처리한 것은 내가 가진 것 중에 accumulator라는 property에
//}                                      접근하겠다 라는 뜻. self는 객체 자신을 의미!!! self. 안 쓰면 오류나
//-(void)setAccumulator:(double)value
//{
//    accumulator = value;
//}
-(void)clear
{
    self.accumulator = 0;
}
//-(double)accumulator
//{
//    return accumulator;
//}
-(void)add:(double)value
{
    self.accumulator += value;
}
-(void)subtract:(double)value
{
    self.accumulator -= value;
}
-(void)multiply:(double)value
{
    self.accumulator *= value;
}
-(void)divide:(double)value
{
    self.accumulator /= value;
}
@end

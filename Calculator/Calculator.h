//
//  Calculator.h
//  Sample 0823
//
//  Created by ㅇ on 2016. 8. 23..
//  Copyright © 2016년 LDCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic, assign) double accumulator;
//nonatomic, assign 외에도 많아 (strong 등)
//nonatomic 은 멀티쓰레드의 경우에도 다 갖다 쓸 수 있도록 락을 해제? 하는 것. fast but unsafety

//-(double)accumulator; 위의 property로 이 두 문장을 없앨 수 있다..? 모르겠당 ㅠㅠ
//-(void)setAccumulator:(double)value;
-(void)clear;

-(void)add:(double)value;
-(void)subtract:(double)value;
-(void)multiply:(double)value;
-(void)divide:(double)value;

@end

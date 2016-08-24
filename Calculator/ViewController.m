//
//  ViewController.m
//  Calculator
//
//  Created by ㅇ on 2016. 8. 24..
//  Copyright © 2016년 LDCC. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

enum opr {none, plus, minus, multiply, divide};
typedef enum opr Operator;//어떤 타입을 또다른 이름으로 정의하는 것.

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
//label은 왜 interface사이에 넣는거지

@end

@implementation ViewController
{
    int currentValue;
    //NSString *currentOpr; 가 아니고
    Operator currentOpr;
    Calculator *calc;
}

//- (IBAction)buttonClicked:(UIButton *)sender {
    //이미 연결된 정보는 스토리보드에 남아있기 때문에 이거 지운다고 해서 안없어져
    //왼쪽에 동그라미 2개 표시되어 있다는건 무언가 연결되어 있다는 뜻
    //구체적으로 확인하려면 View Controller -> Connection Inspect를 눌러보면 연결되어 있는 정보들 전부 볼 수 있어
    //지우게 되면 여기서 연결된 부분에 느낌표가 표시되어 있어
    //이 상태에서 컴파일하면 컴파일 시점이 아닌 실행시점에서 프로그램이 죽어
    //빌드도 되고 실행도 되거든. 프로그램 죽는 이유 중 하나가 이런거나 메소드 삭제되었을 때야 알아둬 ~~
    //직접 연결 지워주자!
//}

- (IBAction)buttonClicked:(id)sender{
    //직접 작성한 다음에 버튼에 연결하기 -> 왼쪽 동그라미 누르고 드래그
    //NSLog(@"buttonClicked"); 한 번 확인해보자 버튼이 눌리는지
    //self.myLabel.text = @"Test";
    //하나의 메소드에 여러 버튼을 어떻게 할당하느냐? 계속 동그라미 클릭해서 연결해 1~9 버튼에다가
    
    //sender는 들어올 때 현재 id 타입으로 오도록 지정되어 있지
    //그러면 버튼이 들어올 어떤 타입인지 알 수가 없어 그래서 객체 변환시켜주자
    UIButton *btn = (UIButton *)sender; //sender 타입을 버튼타입으로 변환해라
    int value = (int)btn.tag;//btn의 tag에 접근하자 그리고 밑에 자동완성을 보면 tag의 경우 NSInteger타입임을 알 수 있지
    
    if(currentOpr == none){
        currentValue = currentValue * 10 + value;
    }else{
        currentValue = value;
    }
    
    self.myLabel.text = [NSString stringWithFormat:@"%d",currentValue]; //tag를 통해 출력해주기
}

- (IBAction)clickOpr:(id)sender {
    
    UIButton * btn = (UIButton *)sender;
    int tagNum = (int)btn.tag;
    
    switch (tagNum) {
        case 1:
            currentOpr = plus;
            break;
        case 2:
            currentOpr = minus;
            break;
        case 3:
            currentOpr = multiply;
            break;
        case 4:
            currentOpr = divide;
            break;
        default:
            break;
    }
    
    [calc setAccumulator:currentValue];
}

- (IBAction)clickEqual:(id)sender {
    
    switch (currentOpr){
        case plus:
            [calc add: currentValue];
            currentValue = [calc accumulator];
            break;
        case minus:
            [calc subtract: currentValue];
            currentValue = [calc accumulator];
            break;
        case multiply:
            [calc multiply: currentValue];
            currentValue = [calc accumulator];
            break;
        case divide:
            [calc divide: currentValue];
            currentValue = [calc accumulator];
            break;
        default:
            break;
    }
    //currentValue = [calc accumulator]; 를 공통으로 빼지 않은 이유는 사용자가 아무것도 입력하지 않고 =를 입력할 수도 있으니까
    self.myLabel.text = [NSString stringWithFormat:@"%d", currentValue];
}

- (IBAction)claar:(id)sender {
    currentValue = 0;
    self.myLabel.text = @"0";
}

-(IBAction)unwind:(UIStoryboardSegue *)sender{
    //이 메소드가 구현되어 있는 곳으로 닫기(exit)를 하겠다.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    calc = [[Calculator alloc] init];
    currentOpr = none;
    currentValue = 0;
    
    self.myLabel.text = @"0"; //첫 화면에서 Label이라고 안 뜨게
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

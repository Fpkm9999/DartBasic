/// ===========================================================
/// fileName       : Function 타입 함수
/// date           : 2024-02-03
/// description    :
///  Function 타입은 Dart에서 함수를 변수에 할당하거나,
///  함수를 다른 함수의 매개변수로 전달하고, 함수에서 다른 함수를 반환할 때 사용할 수 있다.
///  이는 Dart에서 함수가 일급 객체(first-class citizens)라는 것을 의미한다.
/// ===========================================================
import 'dart:math';
// 함수를 이용한 예
int plus(int no,int no2){
  return no + no2 + 10;
}
int multiply(int no){
  return no * 10;
}

// 함수를 변수에 할당
void sayHello(String name) { // sayHello 라는 함수. 매개변수로 입력받은 값을 출력함
  print('Hello, $name!');
}

// 함수를 다른 함수의 매개변수로 전달하기
void executeOperation(int a, int b, Function operation) { // 3번째 매개변수로 Function 타입을 받았다.
  print(operation(a, b));
}

int add(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

// 함수에서 다른 함수를 반환하기

Function multiplyBy(int multiplier) {
  return (int number) => number * multiplier;
}

void main() {
  // 1. 함수를 변수에 할당
  Function greet = sayHello;  // sayHello 함수를 변수에 할당함.

  // 변수를 사용하여 함수 호출한다.
  greet('John');  // Hello, John! 출력.

  // 2. 함수를 다른 함수의 매개변수로 전달하기
  // 함수를 매개변수로 전달하여 호출
  executeOperation(5, 3, add);
  executeOperation(5, 3, subtract);
  executeOperation(10, 5, plus);
  // 이 함수는 add와 subtract, plus 함수를 매개변수로 받아 해당 연산을 실행하고 결과를 출력한다.

  // 3. 함수에서 다른 함수를 반환하기
  // 함수에서 함수를 반환받음
  var triple = multiplyBy(3);

  // 반환받은 함수를 사용
  print(triple(5)); // 출력: 15
// Function 타입을 사용하면 함수를 더 유연하게 다룰 수 있으며, 고차 함수(higher-order function)와 같은 함수형 프로그래밍 패턴을 적용할 수 있다.
}

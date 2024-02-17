/**
 * ===========================================================
 * fileName       : anonymousFunction_01
 * date           : 2024-02-18
 * description    :
 * ===========================================================
 */

// 일반 함수 정의
int add(int a, int b) {
  return a + b;
}

// 익명 함수를 변수에 할당
// 익명 함수는 이름 없이 선언되며, 변수에 할당되거나 다른 함수의 인자로 직접 전달될 수 있다.
var multiply = (int a, int b) {
  return a * b;
};
// 타입을 명시한 익명 함수 사용 예
// 타입을 명시하여 익명 함수를 변수에 할당할 수도 있다.
// 이는 코드의 가독성과 타입 안정성을 높여줍니다.

// 타입을 명시한 익명 함수
void Function(int, int) subtract = (int a, int b) {
  print(a - b);
};

// 익명 함수를 인자로 전달하는 예
// 고차 함수 정의
// 익명 함수는 다른 함수의 인자로 전달될 때 직접 선언되어 사용될 수 있습니다. 이는 콜백 함수나 고차 함수 패턴에서 유용하게 사용됩니다.
void executeOperation(int a, int b, Function(int, int) operation) { // 고차함수. // 3번째 인수로 함수를 받음.
  print(operation(a, b));
}

void main() {
  // 일반 함수 호출
  int result = add(5, 3);
  print(result); // 출력: 8

  // 익명 함수 호출
  print(multiply(4, 2)); // 출력: 8

  // 익명 함수 호출
  subtract(10, 3); // 출력: 7

  // 익명 함수를 인자로 전달하여 고차 함수 호출
  executeOperation(6, 2, (a, b) => a / b); // 출력: 3.0 // 3번째 인자로 익명함수를 받는데 화살표함수를 사용하여 직접 전달한다.
}

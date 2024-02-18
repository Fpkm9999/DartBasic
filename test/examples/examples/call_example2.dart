/// ===========================================================
/// fileName       : call_example2
/// date           : 2024-02-18
/// description    :
/// ===========================================================
class Calculator {
  double Function(double, double) operation;  // operation 이라는 함수를 생성

  Calculator(this.operation); // 생성자 를 통해 operation 함수 호출

  // double performOperation(double x, double y) {
  //   return operation(x, y);
  // }

  // call 메소드를 사용하여 Calculator 객체를 함수처럼 호출할 수 있도록 함
  double call(double x, double y) {
    return operation(x, y);
  }
}

void main() {
  // 덧셈을 수행하는 함수를 전달하여 Calculator 객체 생성
  var adder = Calculator((double x, double y) => x + y);
  print(adder); //  adder 변수가 Calculator 클래스의 인스턴스임을 의미 // adder 변수는 이 Calculator 클래스의 객체를 가르키고 있다.

  // Calculator 객체를 함수처럼 호출하여 덧셈 수행
  print('덧셈 결과: ${adder(3, 4)}'); // "덧셈 결과: 7"
  print('${adder.call(3, 9)}');
}

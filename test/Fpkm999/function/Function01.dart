/*
함수의 특징
1) 변수가 함수 참조 가능 <<<
2) 다른 함수의 인자로 함수 전달 가능
3) 이름 있는 선택 매개변수
4) 위치적 선택 매개변수
5) 익명 함수 및 람다
 */

void main() {
  int a = 10;
  int b = 5;

  // 1. 변수가 함수 참조 가능
  // var 타입 name 변수가 문자열을 리턴해주는 getName() 함수를 참조 한다.
  // 그러면 name은 문자열을 값으로 가지기 때문에 String 타입이 된다.
  // 흔히 사용되는 함수 호출의 형태이다.
  // ============================
  // 타입 변수명 = 함수(){}
  // ex) var name = getName() {}
  var name = getName();
  print(name);
  print('Name is $name.');

  print('$a + $b = ${add(a, b)}');
  print('$a - $b = ${sub(a, b)}');

}
// 리턴타입O / 매개변수 타입 X 함수
getName() {
  return 'Oh';
}
// 리턴타입O / 매개변수 O 함수
int add(int a, int b) {
  return a - b;
}
// sub() 함수에서는 타입이 지정되지 않았다.
// 생략이 가능 하긴 하지만 가급적 명시 해 주는게 좋다.
int sub(a, b) {
  return a - b;
}
// https://brunch.co.kr/@mystoryg/119
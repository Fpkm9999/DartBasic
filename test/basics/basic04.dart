import '../TypedefTest.dart';

// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : basic04
 * date           : 2024-02-11
 * description    :
 * ===========================================================
 */

// 함수
void main() {
  addNumbers(10, 20, 30);

  addNumbers(20, 30, 40);

  addNumbersOptional(10);
  // 기본값 무시됨
  addNumbersOptional(20, 30, 40);

  addNumbersNamed(x: 10, y: 20, z: 30);
  addNumbersNamed(x: 10, y: 30, z: 40);
  addNumbersNamed(x: 10, z: 40, y: 30);

  addNumbersNamedOptional(x: 10, y: 30);
  addNumbersNamedOptional(x: 10, y: 30, z: 40);
  int result = addNumbersNamedOptionalReturn(x: 10, y: 30);
  int result2 = addNumbersNamedOptionalReturn(x: 10, y: 30, z: 40);

  print('result : $result');
  print('result2 : $result2');
  print('sum : ${result + result2}');

  int result3 = addNumbersPositionalNamedOptional(10, y: 20);
  int result4 = addNumbersPositionalNamedOptional(10, y: 30, z: 40);
  print('result3 : $result3');
  print('result4 : $result4');
  print('sum : ${result3 + result4}');

  int result5 = addNumbersPositionalNamedOptionalArrow(10, y: 20);
  int result6 = addNumbersPositionalNamedOptionalArrow(10, y: 30, z: 40);
  print('result5 : $result5');
  print('result6 : $result6');
  print('sum : ${result5 + result6}');

  Operation operation = add;
  int result7 = operation(10,20,30);
  print(result7);
  operation = subtract;
  int result8 = operation(10,20,30);
  print(result8);

  int result9 = calculate(30, 40, 50, add);

  print(result9);

  int result10 = calculate(40, 50, 60, subtract);

  print(result10);
}

// 세개의 숫자 (x, y, z) 를 더하고 짝수인지 홀수 인지 알려주는 함수
// parameter / argument - 매개변수
// positional parameter - 순서가 중요한 파라미터 (순서가 틀리면 안됨)
// optional parameter - 있어도 되고 없어도 되는 파라미터
addNumbers(int x, int y, int z) {
  // print('addNumbers 실행');
  // int x = 10;
  // int y = 20;
  // int z = 30;

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');
  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
}

// optional parameter - 있어도 되고 없어도 되는 파라미터

addNumbersOptional(int x, [int y = 20, int z = 30]) {
  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');
  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
}

// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
addNumbersNamed({
  required int x,
  required int y,
  required int z,
}) {
  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
}

// named 파라미터에서 optional 파라미터를 사용할려면
addNumbersNamedOptional({
  required int x,
  required int y,
  int z = 30,
}) {
  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
}

int addNumbersNamedOptionalReturn({
  required int x,
  required int y,
  int z = 30,
}) {
  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
  return sum;
}

int addNumbersPositionalNamedOptional(
  int x, {
  required int y,
  int z = 30,
}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
  return sum;
}

// arrow function - 화살표 함수
int addNumbersPositionalNamedOptionalArrow(
  int x, {  // positional
  required int y, // named
  int z = 30, // optional
}) => x + y + z;

typedef Operation = int Function(int x, int y, int z);  // 가장 간단한 형태의 typedef

// 더하기
int add(int x, int y, int z) => x+y+z;

// 빼기
int subtract(int x, int y, int z ) => x-y-z;

// 계산
int calculate(int x, int y, int z, Operation operation){
  return operation(x,y,z);
}
void main() {
  // addNumbers(10, 20, 30);
  // addNumbers(20, 30, 40);
  addNumbers(10);
  addNumbers(20);
  addNumbers(10, 50, 60);// 직접 값을 넣으면 기본값이 무시됨. 이게 옵션 파라미터
}

// 세개의 숫자 (x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument - 매개변수
// positional parameter - 순서가 중요한 파라미터
// optional parameter - 있어도 되고 없어도 되는 파라미터
// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)

// addNumbers(int x, int y, int z) {
addNumbers(int x, [int y = 20, int z = 30]) {
  // [] 안에는 안넣어도됨   // 기본값을 넣으면 오류안뜨지만 기본값을 사용함
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
    print('홀수입니다');
  }
}

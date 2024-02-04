void main() {
  // addNumbers(10, 20, 30);
  // addNumbers(20, 30, 40);
  int result =  addNumbers(10, y: 20);
  int result2 =  addNumbers(10, y: 20, z: 40);  // 이름을 지정해서 했기 때문에 순서 상관ㅇ벗음
  // addNumbers(20);

  print('result : $result');
  print('result2 : $result2');

  print('sum : ${result+ result2}');
}

// 세개의 숫자 (x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument - 매개변수
// positional parameter - 순서가 중요한 파라미터
// optional parameter - 있어도 되고 없어도 되는 파라미터
// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
// arrow function - 화살표 함수
// addNumbers(int x, int y, int z) {
int addNumbers(int x, { // 반환 타입을 안적으면  void 가 기본값임. // 포지셔널 파라미터
  required int y,
  int z = 30,
  }) => x + y + z;  // return


/**
 * ===========================================================
 * fileName       : asdf
 * date           : 2024-02-27
 * description    :
 * ===========================================================
 */
// 이 함수는 int를 받아 다른 int를 반환하는 함수를 반환합니다.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // add2는 int를 받아 2를 더해 반환하는 함수입니다.
  var add2 = makeAdder(2);
  print(add2(3));  // 출력: 5
  var add3= makeAdder(5);
  print(add3);
}


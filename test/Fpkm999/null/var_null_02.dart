/**
 * ===========================================================
 * fileName       : var_null_02
 * date           : 2024-02-02
 * description    :
 * ===========================================================
 */
void main() {
  int no1 = 10; // 널 불허
  int? no2; // 널 허용

  print(no1);
  print(no2);

  var a1 = no1; // int로 결정
  var a2 = no2; // int?로 결정됨

  print(a1);
  print(a2);

  a1 = 20;
  // a1 = null; // 널 불허 변수에 널을 대입해서 오류

  a2 = 20;
  // a2 = "hello"; // int? 타입에 문자열을 대입해서 오류
  a2 = null;
}

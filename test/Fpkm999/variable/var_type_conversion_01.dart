/**
 * ===========================================================
 * fileName       : var_type_conversion_01
 * date           : 2024-02-01
 * description    :
 * int -> double 형 변환
 * int -> String 형 변환
 * ===========================================================
 */

void main() {
  // int 와 double 형 변환
  int n1 = 10;
  double d1 = 10.0;

  double d2 = n1.toDouble(); // 성공
  int n2 = d1.toInt();

  print(d2);
  print(n2);

  // int와 String 형 변환
  int n3 = 10;
  String s1 = '10';

  String s2 = n3.toString();
  int n4 = int.parse(s1);

  // 형변환을 할때는 함수를 이용한다
}

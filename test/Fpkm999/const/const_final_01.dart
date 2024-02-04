/**
 * ===========================================================
 * fileName       : const_final_01
 * date           : 2024-02-01
 * description    : 상수 변수와 문자열 템플릿
 * ===========================================================
 */

void main(){
  String s1 = 'hello';
  const String s2 = 'world';
  final String s3 = 'helloworld';

  String s4 = '$s1, $s2';
  const String s5 = '%s2';
  // const String s6 = '$s1, $s2, $s3';  // 오류
  final String s7 = '$s1, $s2, $s3';  // 정상

  /*
  const 예약어로 선언한 String 타입 상수 변수에 문자열 템플릿으로 값을 대입할 때는
  템플릿 내부에서도 컴파일 타입 상수를 사용해야 한다.
   */
}
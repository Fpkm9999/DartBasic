/// ===========================================================
/// fileName       : dynamic_null_01
/// date           : 2024-02-02
/// description    :
/// dynamic 타입의 널 안전성
///
/// ===========================================================
void main() {
 // dynamic 타입은 기본적으로 어떤 종류의 값이든 할당이 가능하다. null 도 포함해서.
  dynamic a1 = 10;
  dynamic a2;
  dynamic? a3; // dynamic 타입에는 물음표를 추가할 수 있지만 dynamic 타입으론 null 자체가
  // 허용되므로 의미는 없다.

  a1 = null;
  a2 = null;
  a3 = null;

  int a4 = 10; // null 값을 가질 수 없는 int 타입 변수
  int? a5 = 20;  // null 값을 가질 수 있는 int 타입 변수

  // 타입 캐스팅을 사용할 때
  // `as` 연산자는 타입을 강제로 변환 시킨다.
  //  변환하려는 타입이 호환되지 않으면 런타임 오류가 발생할 수 있다.
  a4 = a5 as int; // a5는 null이 아니기 때문에 `int`로 캐스팅이 가능합니다.
  print("a4: $a4, a5: $a5");

  int? a6 = 30;
  a6 = a5 as int?; // a5를 int? 타입으로 캐스팅하여 a6에 할당합니다.
  print("a5: $a5, a6: $a6");

  // error case1
  // int? a7;
  //// a7=1;
  // a6 = a7 as int;
  // print('${a6}');
  /*
   a7 변수가 int? 타입으로 선언되어 있어서 null 값을 가질 수 있지만, as int를 사용하여 a7을 int 타입으로 강제 변환 하려고 하기 때문
   만약 a7이 null 을 가지고 있다면 null 을 int 타입으로 변환하려고 할 때 런타임 오류가 발생한다.

  Dart에서 as 키워드를 사용한 타입 캐스팅은 변환하려는 값이 명시된 타입과 호환되지 않을 경우 오류를 발생
  null 값을 null이 허용되지 않는 타입으로 캐스팅하려고 하면, TypeError가 발생하여 프로그램이 중단됩니다.

  핵심 : 타입 캐스팅을 수행 하기 전에 null 여부를 체크 하는 것이 중요하다.
   */


}

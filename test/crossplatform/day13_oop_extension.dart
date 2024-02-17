import 'dart:core';

/*
 * - 확장
 *   메소드를 이미 선언되어있는 클래스에 메소드에 대해서만 확장시켜주는 기능
 *   상속 불가 => 오버라이딩 없음
 *     => 유틸리티성 기능을 메소드로 만들어줌
 *     => 이후에 고정적인 기능(e.g. 날짜 계산)을 메소드로 만들어줌
 *   함수형/선언형 프로그래밍 시 유용하게 사용 가능
 *     => 확장 메소드는 1개 기능만 할 것
 *
 * 관례상 확장 명칭에 Ext 또는 Extension 붙여줌
 */
extension DateTimeExt on DateTime {
  DateTime after(DateTime afterDate) {
    // 확장 메소드를 호출한 객체가 곧 this
    // DateTime이 상속을 받았다면, super도 사용 가능
    DateTime source = this;
    return DateTime.now(); // 몇일 후에 결과라고 가정
  }
}
class DateUtil {
  static DateTime after(DateTime source, DateTime afterDate) {
    return DateTime.now(); // 몇일 후에 결과라고 가정
  }
}



void main() {
  DateTime source = DateTime.now();
  DateTime afterDate = DateTime.now(); // 3일 후라고 가정
  DateTime ellipsed = DateUtil.after(source, afterDate);

  print(source);
  // Callable
  // 람다 => 메소드를 객체처럼 취급/객체를 메소드로 취급
  void Function() lambda = (){ };
  lambda.call();// call은 call인데, call 메소드 자체를 커스텀화 => Callable
}

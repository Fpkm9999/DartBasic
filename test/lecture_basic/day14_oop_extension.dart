/**
 * ===========================================================
 * fileName       : day14_oop_extension
 * date           : 2024-02-17
 * description    :
 * ===========================================================
 */
import 'dart:core';

/*
   - 확장
     메소드를 이미 선언되어 있는 클래스에 메소드에 대해서만 확장시켜주는 기능
     상속이라는 기능은 없음(다른 말로는 오버라이딩이 없다는 말임)
     => 유틸리티성 기능을 메소드로 만들어줌
      => 이후에 고정적인 기능 (e.g 날짜)을 메소드로 만들어줌
      => 함수형/선언형 프로그래밍 시 유용하게 사용가능
      => 확장메소드는 1개의 기능만 할 것.


      관례상 확장 명칭에는 `Ext` 또는 `Extension` 을 붙여줌
 */
extension DateTimeExt on DateTime {
  DateTime after(DateTime source, DateTime afterDate) {
    // 확장 메소드를 호출한 객체가 곧 this
    // DateTime이 상속을 받았다면 , super 도 사용가능
    DateTime source = this;
    return DateTime.now(); // 몇일 후에 결과라고 가정
  }
}

class DateUtil {
  static DateTime after(DateTime source, DateTime afterDate) {
    //
    return DateTime.now(); // 몇일 후에 결과라고 가정
  }
}

void main() {
  DateTime source = DateTime.now();
  DateTime afterDate = DateTime.now(); // 3일 후라고 가정
  DateTime ellipsed = DateUtil.after(source, afterDate);


// Callable
// 람다 => 메소드를 객체처럼 취급/객체를 메소드로 취급
void Function() lambkda = (){};
lambkda.call();  // call 은 call 인데, call 메소드 자체를 커스터마이징 하고 싶음 => Callable을 봐야함.
}
/**
 * ===========================================================
 * fileName       : const_01
 * date           : 2024-02-01
 * description    : 상수 변수는 초깃값을 대입한 후 값을 바꿀수없다.
 * 다트에서는 여기서 추가로
 * 상수가 되는 시점에 따라 컴파일 타임 상수 변수와
 * 런타임 상수 변수로 구분된다.
 * ===========================================================
 */

/*
  컴파일 타임 상수 변수 - const
  - 예약어 : const
  - 클래스에 예약할 때는 static 변수로만 선언할 수 있다.
  - const 변수는 컴파일 단계에서 상수가 되므로 변수를 선언할 때는 초기값을 대입해야 하며
  그 후에는 값을 바꿀 수 없다. => 초깃값을 대입하지 않으면 오류가 발생한다.
 */
// case 1
// 초깃값 없이 const 변수 선언 오류
// const String data1; // 오류

// class User {
//   static const String data2; // 오류

  // void some(){
  //   const String data3; // 오류
  // }
// }

// case 2
const String data1 = 'hello';

class User {
  static const String data2 = 'hello';

  void some(){
    const String data3 = 'hello';
  // data1 ='world'; // 오류
  // data2 ='world'; // 오류
  // data3 ='world'; // 오류
// 상수 변숫값을 변경할려고 하면 오류가 뜸

  }
}
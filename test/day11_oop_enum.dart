import 'dart:ui';

/**
 * ===========================================================
 * fileName       : day11_oop_enum
 * date           : 2024-02-03
 * description    :
 *  - enum
 *    컴파일 타임 상수 열거형(Enumberation) 클래스
 *    > const라고 가정함
 *
 *   - enum의 두갖
 *     기존(Classic) : 상수만 선언 가능 + 멤버 변수를 가질 수 있음
 *     향상형(Enhanced) : 메소드 정의까지 지원
 *
 * ===========================================================
 */
/*
   RGB 색상 값 :  0xRRGGBB => 0xFFFFFF 는 흰색
 */
enum Colors {
  // 컬러의  10 진수 : 최대값 255 => 2^8 => 1byte
  // 컬러의 10  진수 : 최솟값 0
  Red(value: 0xFF0000),
  Green(value: 0x00FF00),
  Blue(value: 0x0000FF); // enum에 상수에 값 범위도 지정가능

  // 클래스 이기때문에 생성자를 가짐
  // 상수형 생성자만 가능함(const가 붙는거)
  const Colors(
      { // enum 타입 앞에서는 const가 필수다
      required this.value})
      : this.min = 0,
        this.max = 255;

  final int min;
  final int max;
  final int value; // 초깃값을 주는 변수

  // 확장형, 주어진 색상 값이 현재 색상 값과 같은지 검사
  bool isSame(int value) => this.value == value;

  void operateForSomething() {
    Colors selected = Colors.Red;
    switch (selected) {
      case Colors.Red:
        break;
      case Colors.Blue:
        break;
      case Colors.Green:
        break;
      default:
        break;
    }
  }
}

void main() {
  // String str = Colors.values[1];
  List<Colors> colors = Colors.values; // 색상 열거형에 선언된 모든 상수
  String redName = Colors.Red.name; // 빨간색의 이름(선언된 이름을 문자열로)
  int redIndex =
      Colors.Red.index; // 빨간색이 선언된 순서(0부터 시작함) // 빨간색이 선언된 순서(당연히 0부터 시작)
  print(colors);
  print(redName);
  print(redIndex);

  // 주어진 열거형과 switch문을 활용한 상수 검사
  Colors selected = Colors.Red;
  switch (selected) {
    case Colors.Red:
      break;
    case Colors.Blue:
      break;
    case Colors.Green:
      break;
    default:
      break;
  }
  // switch + 열거형  결합은 별로 좋은 방법이 아님
  // => 새로운 상수가 추가 되었을 때, 작성했던 switch 문 마다 모두 처리해야되는 문제가 있음.
  //    => 열거형 안에 메소드로 선언해서, 호출하도록 만들자 !

  selected.operateForSomething();   // 이것도 문제가 있음.
  // => 누락되는 문제가 발생(실수case 문처리)
  // >>> 그래서 안빼먹도록 sealed 처리를 함 => 다음 파일로 추가
}

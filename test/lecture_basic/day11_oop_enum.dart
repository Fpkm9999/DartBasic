/**
 * - enum
 *   컴파일 타임 상수 열거형(Enumeration) 클래스
 *
 * - enum의 두 가지
 *   기존(Classic) : 상수만 선언 가능 + 멤버변수 보유 가능
 *   향상형(Enhanced) : 메소드 정의까지 지원
 */

// 컬러의 10진수 : 최소 값 0, 최대 값 255 => 2^8 => 1 byte
// RGB 색상 값 : 0xRRGGBB
enum Colors {
  Red(value: 0xFF0000),
  Green(value: 0x00FF00),
  Blue(value: 0x0000FF),
  Orange(value: 0x0000FF);

  // 클래스이기 때문에 생성자를 가짐
  // 상수형 생성자만 가능
  const Colors({
    required this.value
  }): this.min = 0,
      this.max = 255;

  final int min;
  final int max;
  final int value;

  // 확장형, 주어진 색상 값이 현재 색상 값과 같은지 검사
  bool isSame(int value) =>
    this.value == value;

  void operateForSomething() {

    Colors selected = Colors.Red;
    switch(selected) {
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
  operateForSomething2() {
    Colors selected = Colors.Red;
    switch(selected) {
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
  List<Colors> colors = Colors.values;//색상 열거형에 선언된 모든 상수
  String redName = Colors.Red.name;//빨간색의 이름(선언된 이름을 문자열로)
  int redIndex = Colors.Red.index;//빨간색이 선언된 순서(당연히 0부터 시작)

  // 주어진 열거형과 switch문을 활용한 상수 검사
  Colors selected = Colors.Red;
  // switch(selected) {
  //   case Colors.Red:
  //     break;
  //   case Colors.Blue:
  //     break;
  //   case Colors.Green:
  //     break;
  //   default:
  //     break;
  // }

  // switch + 열거형 결합은 별로 좋은 방법이 아님
  //   => 새로운 상수가 되었을 때, 작성했던 switch문마다 모두 처리 필요
  //      => 열거형 안에 메소드로 선언해서, 호출하도록 만들자!
  //         => 최종 문제 : 누락
  selected.operateForSomething();
}

enum OperationState {
  Before, // 출금 전, 운영 전, 시작 전
  Ing, // 출금 중, 운영 중, 동작 중
  After // 출금 후, 운영 후, 완료 후
}
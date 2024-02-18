/**
 * - 봉인 클래스(Sealed Class)
 *   타입을 제한시키는 클래스
 *      => 타입 비교 => 내가 원하는 타입이 맞는가?
 *      => 열거형은 상수 비교 후 switch로 처리였다면,
 *         봉인 클래스는 클래스 비교 후 메소드로 처리
 *
 * - 봉인 클래스 vs enum
 *   switch문 탈피/호출 vs switch문 기반 검사/호출
 *   상태 관리에 대한 명확성
 *   문법에 대한 의존도
 *   봉인 클래스 사용 시 코드 복잡도 상승, 관리 측면 증가 => 열거형의 간단함, 관리 측면 감소
 */
// abstract 키워드로 직접 생성 막아줌
abstract class Colors {
  // 외부에서 직접 생성하는 행위 제한
  const Colors._();

  // const factory로 클래스에 따라 객체 생성
  // = ColorsRed   => 생성자 위임(Delegation)
  factory Colors.red() => ColorsRed._();
  const factory Colors.green() = ColorsGreen._;
  const factory Colors.blue() = ColorsBlue._;
  const factory Colors.orange() = ColorsOrange._;

  void operateForSomething();
}

class ColorsRed extends Colors {
  // 외부에서 직접 생성하는 행위 제한
  ColorsRed._(): super._();

  int f = 0;

  @override
  void operateForSomething() { /*처리*/ }
}

class ColorsGreen extends Colors {
  const ColorsGreen._(): super._();

  @override
  void operateForSomething() { /*처리*/ }
}

class ColorsBlue extends Colors {
  const ColorsBlue._(): super._();

  @override
  void operateForSomething() { /*처리*/ }
}

class ColorsOrange extends Colors {
  const ColorsOrange._(): super._();

  @override
  void operateForSomething() {
    // TODO: implement operateForSomething
  }
}

void main() {
  Colors selected = Colors.red();
  selected.operateForSomething();

  bool isColors = selected is Colors;// 선택된 색상이 Colors가 맞는지 검사
  bool isRed = selected.runtimeType == ColorsRed;// 선택된 색상이 빨간색이 맞는지 검사
}
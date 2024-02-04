/**
 * - 팩토리(Factory)
 *   지정한 종류에 따라 객체를 생성만 하는 공장
 *   DART 에서는 factory 키워드 지원
 */
class Factory {
  // 기본형 생성자
  const Factory();

  // 명칭형 생성자
  const Factory.named();

  /*
   * - const 키워드 사용하는 이유
   *   객체에 대한 안정성 확립 > 런타임에서 실수든 의도적인 값을 바꾸면 안정성이 떨어짐
   * - 생성하고 난 후 값을 변경하려면?
   *   copyWith 메소드를 사용해서 값 변경 + 재생성
   * - factory 생성자
   *   copyWith 메소드 호출량을 줄이고, 생성할 때 값을 변경 가능하도록 지원
   */

  // 공장형 생성자
  factory Factory.factory() {
    // 몸체가 있는 생성자를 통해 생성 직후 몸체에서 초기화
    var factory = Factory();
    return factory;
  }

  // 값을 변경하기 위해서 이 메소드를 호출하게 될 것임
  Factory copyWith() => Factory();
}

class Computer {
  const Computer(this.touch);

  final bool touch;

  // 외부에서 이 메소드를 통해 생성할 경우 생성되는 과정에 깊이 알필요가 없음
  factory Computer.standard() {
    // 생성 전에 값을 원하는대로 조정
    // 객체 생성 시 사용
    var computer = Computer(false);
    // 값 변형 또는 부가 행위들 처리
    return computer;
  }

  factory Computer.touch() {
    // 생성 전에 값을 원하는대로 조정
    // 객체 생성 시 사용
    var computer = Computer(true);
    // 값 변형 또는 부가 행위들 처리
    return computer;
  }
}

void main() {
  var factory = Factory().copyWith();
  factory = Factory.factory();

  // factory 메소드가 없을 경우...호출 측에 이렇게 해달라고 요구를 해야 함
  // 생성 전에 값을 원하는대로 조정
  // 객체 생성 시 사용
  var computer = Computer(false);
  // 값 변형 또는 부가 행위들 처리

  var standardComputerByFactory = Computer.standard();
  var touchComputerByFactory = Computer.touch();
}
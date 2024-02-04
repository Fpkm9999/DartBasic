/*
  - 팩토리 (Factory)
    지정한 종류에 따라 객체를 생산만 하는 공장
  - DART 에서는 factory 키워드 지원
    
 */
class Factory {
  // 기본형 생성자
  Factory();

  // 명칭형 생성자
  const Factory.named(); // const 를 쓸 수 있으면 안정성이 높아짐.

  // - const 키워드 사용 하는 이유
  //  객체에 대한 안전성 확립 => 런타임에서 실수든 의도적인 값을 바꾸면 안정성이 떨어짐
  // - 생성하고 난 후 값을 변경하려면?
  //  copyWith 메소드를 사용해서 값 변경 + 재생성
  // - factory 생성자
  //  copyWith 메소드 호츌량을 줄이고, 생성할 때 값을 변경 가능하도록 지원

  //공장형 생성자
  factory Factory.factory() {
    // 몸체가 있는 생성자를 통해 생성 직후 몸체에서 초기화
    var factory = Factory();
    return factory;
  }

  // 값을 변경하기 위해서 이 메소드를 호출하게 될 것임
  Factory copyWith() => Factory();
}

class Computer{
  // const Computer(this.touch);
  // final bool touch;
  //
  // factory Computer.standard(){
    // 생성 전에 값을 원하는대로 조정
    // 객체 생성 시 사용
    // var computer = Computer(false);
    // 값변경
  // }

    // factory Computer = Factory.factory();
  // var factory  = Computer.standard(){
  // }
}

void main() {
  var factory = Factory().copyWith();
  factory = Factory.factory();
  // 단순하게 사용하면 외부에서 할일을 여기서 다 만들어서 리턴하는거?

}

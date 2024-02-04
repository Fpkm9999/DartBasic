/**
 * ===========================================================
 * fileName       : day11_oop_sealed
 * date           : 2024-02-03
 * description    :
 * ===========================================================
 */
/*
  봉인 클래스 라고도 함
  - todo 봉인 클래스(Sealed Class)
    타입을 제한시키는 클래스 => 타입을 확인할 수 있음. 다르게 말해서 타입 비교가 가능함
    => 내가 원하는 타입이 맞는가? 까지고 확인이 가능함
    => 열거형은 상수 비교후 switch로 처리였다면 ,
    봉인 클래스는 클래스 비교 라는 걸로 처리를 함. 클래스 비교 후 메소드로 처리

    - 봉인 클래스 vs enum
      switch 문 탈피/호출 vs switch 문 기반 검사/호출
      상태 관리에 대한  명확성
      문법에 대한 의존 -> 다트에서 코틀린과 같은 다른 언어로 수정해야 한다면 별 문제 없이 수정하면됨.
      봉인클래스 사용 시 코드 복잡도 상승 => 열거형의 간단함
      // 무조건 봉인클래스가 능사는 아니지만 이렇게 구현해놓으면 추후 문제가 생길일이 잘 없음
      // 수정이 잦다면 이후 유지보수가 필요하다면 봉인클래스를 사용하는게 좋음. 관리 측면 감소
 */

// sealed 형태는 2개가 있음
// abstract 키워드로 직접 생성을 막아둠
abstract class Colors{
  // 외부에서 직접 생산하는 행위 제한

  const Colors._();
  // const factory 로 클래스에 따라 객체 생성
  // = ColorsREd => 생성자 위임하겠다(Delegation);
  const factory Colors.red() = ColorsRed._; // 여기서 생성자를 통해 객체 새성을 해야하는데 안하고 넘겨버림
  const factory Colors.Green() = ColorsGreen._; // 여기서 생성자를 통해 객체 새성을 해야하는데 안하고 넘겨버림
  const factory Colors.Blue() = ColorsBlue._; // 여기서 생성자를 통해 객체 새성을 해야하는데 안하고 넘겨버림

   void operateForSomething();
}
class ColorsRed extends Colors{
  // 외부에서 직접 생성하는 행위 제한
  const ColorsRed._(): super._();

  @override
  void operateForSomething() {  /*.처리..*/
    // TODO: implement operateForSomething
  }

}
class ColorsGreen extends Colors{
  // 외부에서 직접 생성하는 행위 제한
  const ColorsGreen._(): super._();

  @override
  void operateForSomething() { /*.처리..*/
  }

  // @Override
  // void operateForSomething(){ /*.처리..*/ }
}
class ColorsBlue extends Colors{
  // 외부에서 직접 생성하는 행위 제한
  const ColorsBlue._(): super._();

  @override
  void operateForSomething() { /*.처리..*/
  }

  // @Override
  // void operateForSomething(){ /*.처리..*/ }
}

void main(){
  Colors selected = Colors.red();
  selected.operateForSomething();
  bool isColors = selected is Colors; // 선택된 색상이 Colors 가 맞는지 검사
  bool isRed = selected.runtimeType == ColorsRed; // 선택된 색상이 빨간색이 맞는지 검사.
}
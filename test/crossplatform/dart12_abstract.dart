/**
 * - 추상화(Abstraction)
 *   큰 개념만 대충 정의 > 실제 구현은 하위 클래스에서 수행
 *
 *   결정되는 것은 하나도 없음 , 틀만 가지고 있을 뿐.
 *   "몸체가 없음!"
 *
 *   일상 생활 : 대충 그런거 있잖아? => 추상
 *              초콜릿 중에 봉지가 대충 까만색인거 있잖아? => 추상
 *              킨더 초콜릿 말이야 => 구현
 */
abstract class Abstract {
  // 추상화에서는 멤버변수 선언 가능
  int parentField = 100;// 필드 : 추상화 미지원 => 다른 타 언어도 동일

  // 필드 추상화를 원했다면, 액세서 추상화 (필드 구현을 요구하는 것)
  int get field;
  set field(newValue);

  // 메소드 추상화
  void method();
}
class Impl extends Abstract {
  int _field = 0;
  @override
  int get field => _field;
  @override
  set field(newValue) => _field = newValue;

  @override
  void method() {
    // 메소드 추상화를 할 때, super에 메소드는 없음 => 부모 몸체가 없음
    //super.method();


    var p = this.parentField;
  }
  // 부모에는 없는 메소드 => 상속받은 적 없음
  void child() { }
}

void main() {
  var child = Impl();
  child.method();
  child.child();

  // 묵시적 캐스팅(Implicit Casting) : 자식 클래스 > 부모 클래스로 변환할 때
  Abstract abstract = child;
  // 명시적 캐스팅(Explicit Casting) : 부모 클래스 > 자식 클래스로 변환할 때
  Impl? impl = null;
  if(abstract is Impl) {// 상속관계 포함 검사
    impl = abstract as Impl;// 변환
  }

  bool isImpl = abstract.runtimeType == Impl;

  // impl 사용
}
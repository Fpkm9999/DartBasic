// ignore_for_file: slash_for_doc_comments

/**
 * ===========================================================
 * fileName       : day12_abstract
 * date           : 2024-02-04
 * description    :
 * - 추상화(Abstraction)
 *  큰 개념만 대충 정의 하는 것 => 실제 구현은 하위 클래스에서 함
 *
 *  추상화(abstraction)를 한다고 해서 결정 되는 것은 하나도 없음. 틀만 가지고 있을 뿐
 *
 *  일상생활에서 비교 하자면)
 *    대충 그런거 있잖아? => 추상
 *    초콜릿 중에 봉지가 대충 까만색 이렇게 생긴거 있잖아? => 이런게 바로 추상적
 *    킨더 초콜릿 말이야 => 이건 구현한 거임 사실상.
 * ===========================================================
 */
// 클래스에다 `abstract` 가 붙으면 추상 클래스라고 알려줌
abstract class Abstract {
  // int field;  // 필드 선언  // 무조건 초기화를 해줘야 하기 때문에 이렇게 사용 하기 에는 무리가 있다.
  // 필드 : 추상화 지원 미지원 => 다른 타 언어도 동일함.
  // get / set을 통해 사용한다

  // 필드 추상화를 원했다면, 액세서를 추상화해야 한다 (필드 구현을 요구하는 것)
  int get field;

  set field(newValue);

  // 메소드 추상화
  void method(); // 메소드 선언

// 추상클래스에는 몸체가 없다. 하위 클래스에서 함
}

// 다트에서은 인터페이스라는 키워드는 없음
class Impl extends Abstract {

  int _field = 0;
// _field라는 내부 변수를 선언 및 사용하여
//  field의 값을 저장하고 반환하는 getter와 setter를 구현
  @override
  int get field => _field;
  @override
  set field(newValue) => this._field = newValue;

  @override
  void method() {
    // 메소드 추상화를 할 때, super에 메소드는 없음 => 부모 몸체가 없으니까
    // super.method(); // 몸체를 구현한 적이 없어서 못한다.
    print('추상클래스 메소드를 오버라이딩한 메소드');

  }
  // 부모에는 없는 메소드 => 상속 받은 적이 없는 메소드임. // 하위 클래스에서 독자적으로 생성한 메소드임
  void child() {  // 하위 클래스 메소드
    print('하위 클래스에서 직접 생성한 메소드');
  }

}
void main(){
  var child = Impl(); // Impl 클래스의 인스턴스 생성
  child.method(); // 부모로 부터 물려 받은 메소드
  child.child();  // 자식 메소드 (상속x)
  var v1 = child._field;
  print(v1);

  // 묵시적 캐스팅 : 자식 클래스에서 부모 클래스로 변환할 때
    Abstract abstract = child;  // 자식은 부모이기 떄문에 다른 타입에 abstract 타입에 넣을 수 잇다.
  // Abstract abstract = child as Abstract;  // 자식은 부모이기 떄문에 다른 타입에 abstract 타입에 넣을 수 잇다.
  // =>> 자식 클래스도 as로 명시적 캐스팅을 해도 되지만 컴파일러가 알아서 해주기 때문에 할 필요가 없음.
  var v2 = abstract.runtimeType;
  print('v2 : $v2');
  // 명시적 캐스팅 : 부모 클래스 에서 자식 클래스로 변환할 때
  Impl? impl = null;
  if(abstract is Impl) {  // 상속관게 포함 검사
  Impl impl = abstract as Impl; // 변환
  print('명시적 형변환 : true');
  }
  bool isImpl = abstract.runtimeType == Impl;
  // impl 사용
  print(impl);
  print(isImpl);
  var v3 = abstract.runtimeType;
  print('v3 : $v3');
}
/*
묵시적 캐스팅을 통해 자식 클래스를 부모 클래스로 변환하고,
명시적 캐스팅을 통해 다시 자식 클래스로 변환합니다.
 */
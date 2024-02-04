// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : day12_interitance
 * date           : 2024-02-04
 * description    :
 *  - 상속(Inheritance)
 *    부모의 속성(변수)/기능을 물려 받는 기능
 *
 *  - 상속 범위
 *    속성 - 필드, 액세서
 *    기능 - 메소드
 *
 *  - 메소드 오버라이딩(Method Overriding)
 *    부모로부터 상속받은 메소드의 기존 정의된 몸체를 자식 클래스에서 변형하는 것
 *
 *  - 개념
 *     상속 : is - a  : A 는 B다.  => [자식] 은 [부모] 이다. 로 해석해야 된다. <<< 을 기준으로 비교. 관계를 반대로하면 틀리는게 맞음
 *        >>> e.g [사람] 은 [동물] 이다. 이게 통한다면 상속개념으로 가야한다. 다만 [동물] 은 [사람] 이다 라는 해석은 틀렸다. 반대로는 관계가 성립하지 않아야 됨.
 *        >>> 딱딱함, 공통성 증가
 *
 *     전략적관계 : has - a : A 는 B를 갖는다. => 멤버 변수 형태로 같는 형태로 관계
 *        >>> 다른 기능을 쓰겠다고 무작성 상속을 하면 안된다.
 *        >>> 유연함, 공통성 저하
 *
 *     ** 상속의 기회는 단 1번(다중 상속이 안됨)
 *     ** 그래서 is-a 관계가 확실한 것을 해야한다. 무작정 상속으로 기능 활용을 하면 안됨.
 *        => 상속 기능으로 해결하면 , 유연성이 떨어짐
 *
 *        상속을 배우는 이유 : abstract 떄문.
 * ===========================================================
 */
// 전략 관계
class Strategy {
  // 전략(Strategy) 패턴
  Strategy( this.child);  // 생성자에 Chil 객체를 받음. 직접 가짐
  Child child;

  void parentMehod(){
    // 위임(Delegation)
    child.parentMethod();
  }
}

class Parent {
  // 부모 클래스
  // 기본 생성자 : 컴파일러가 생성자를 기본적으로 정의해주는 형태
  // Parent();
  Parent(this.parent, this.other); // 외부값 other도 저장 내부값 parent도 저장 초기화

  int parent;
  int other;

  void parentMethod() {}
}

class Child extends Parent { // 자식 클래스 Parent 클래스를 상속 받음
  // 자식 클래스
  // 기본 생성자
  // Child(): super(); // 일단 {} 몸체는 사용할 일이 없어서 지움
  Child(int param) : super(50, param); // param은 외부에서 받을 값
                    // super() 초기화를 해주지않으면 제대로 안될 수 있으므로 해주는 것이 좋다
  @override
  int other = 40; // 이건 건들지 않았음

  @override
  void parentMethod() { // 상속을 받은 멤버는 super이나 this나 결과는 동일함.
    // 부모로 부터 상속받은 속성
    print(this.parent); // 상속을 받으면 부모 멤버를 this로 자기꺼 처럼 사용이 가능해짐
    // super : 바로 직전 상위의 부모 클래스를 지칭하는 레퍼런스
    print(super.other); // 100
    print(this.other);  // 50 // super로 줬냐 this로 줬냐에 따라 값이 달라 질 수 있음
    print(other); // 50 >>> 자기자신을 가르킴
    // 오버라이딩 할 때, 부모 메소드를 호출 하는 것이 의무적인 것은 아님
    // super.parentMethod();
  }
}
void main() {
  var child = Child(100); // 외부에서 값 100 대입
  child.parentMethod();
}
// 상속을 사용할 때 오버라이딩의 정확한 개념을 몰라서(어디서 오고 어디를 불러내고 있는지) 어렵게 느껴질 수 있다.
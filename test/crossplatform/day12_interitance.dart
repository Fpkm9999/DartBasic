/**
 * - 상속(Inheritance)
 *   부모의 속성(변수)/기능을 물려받는 기능
 *
 * - 상속 범위
 *   속성 - 필드, 액세서
 *   기능 - 메소드
 *
 * - 메소드 오버라이딩(Method Overriding)
 *   부모 클래스로부터 상속받은 메소드의 기존 정의된 몸체를 자식 클래스에서 변형하는 것
 *
 * - 개념
 *   상속 is-a : A는 B다. => "[자식]은 [부모]이다." 기준으로 비교
 *              딱딱함, 공통성 증가
 *              e.g. O : [사람]은 [동물]이다. / X : [동물]은 [사람]이다.
 *   전략 has-a : A는 B를 갖는다. => 멤버 변수 형태로 관계
 *              유연함, 공통성 저하
 *
 *   상속의 기회는 단 1번이기 때문에, 무작정 상속으로 기능 활용을 하면 안됨
 *   => 상속 기능으로 해결하면, 유연성이 떨어짐
 */
class Strategy {
  // 전략(Strategy) 패턴
  Strategy(this.child);
  Child child;

  void parentMethod() {
    // 위임(Delegation) 패턴
    child.parentMethod();
  }
}

class Parent { // 부모 클래스
  // 기본 생성자 : 컴파일러가 생성자를 기본적으로 정의해주는 형태
  //Parent();

  Parent(this.parent, this.other);

  int parent;
  int other;

  void parentMethod() {}
}
class Child extends Parent { // 자식 클래스
  // 기본 생성자 : 컴파일러가 생성자를 기본적으로 정의해주는 형태
  //Child(): super();
  Child(int param): super(50, param);

  @override
  int other = 50;

  @override
  void parentMethod() {
    // 부모로부터 상속받은 속성
    print(this.parent);

    // super : 바로 직전 상위의 부모 클래스를 지칭하는 레퍼런스
    print(super.other);// 100
    print(this.other);// 50
    print(other);// 50

    // 오버라이딩할 때, 부모 메소드를 호출하는 것이 의무적인건 아님
    super.parentMethod();
  }
}
void main() {
  var child = Child(100);
  child.parentMethod();
}
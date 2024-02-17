/**
 * - 프로그래밍 패러다임
 *   우리가 코드 작성을 어떻게 할 것인가?
 *
 *   절차 지향 프로그래밍 : 순서대로/차례대로 작성하고 동작하는 패러다임
 *                       => 실제 문제에 부딪혔을 때, 이해하기가 어려움
 *                          본질적인 문제에 접근하기가 어려움
 *   객체 지향 프로그래밍 : 유형이든/무형이든 모든 것을 객체로 보고 작성하고 동작하는 패러다임
 *   관점 지향 프로그래밍 : 바라보는 관점에 따라서, 동작하거나 사용하는 기능을 위주로 작성하고 동작하는 패러다임
 *                       => 핵심(Core) : 서비스에서 필요로 하는 기능(e.g. 인출)
 *                       => 부수(Cross) : 서비스에서 필요로 하는 공통 기능(e.g. 로그)
 *   함수형 프로그래밍 : 순수 함수를 조합으로 로직을 작성하고 동작하는 패러다임
 *   선언형 프로그래밍 : 함수형 프로그래밍 등을 기반으로(특히, 람다 같은 것들) 선언하듯 작성하고 동작하는 패러다임
 *
 * - 객체 지향 프로그래밍? (OOP: Object-Oriented Programming)
 *   프로그래밍 측면에서 보면, 객체는 부품임.
 *   객체 간 상호작용을 통해 특정한 문제를 해결
 *
 * - 객체 구분 방식
 *   정적/명명된 타이핑 : 클래스의 이름에 기반해서 객체 분류
 *                     e.g. C++, JAVA, C# 등 거의 대부분 언어들
 *   동적/구조적 타이핑 : 객체가 가진 변수, 함수 등에 기반해서 객체 분류
 *                     e.g. JavaScript, TypeScript 등 스크립트 언어들
 *
 * - 객체 지향 프로그래밍을 통해 해결되는 것들
 *   WARNING. 책에서는 "클래스라는 것은 일종의 틀이다."
 *                    "객체를 찍어내는 틀이다."
 *            이렇게 외우시면 안됨!!! => 분류하다.
 *   개념 : 분류
 *         사람은 사람이다.
 *         포유류는 사람인가? X
 *         사람은 포유류인가? O
 *         동물은 포유류인가? X
 *   표현 : 객체 지향 프로그래밍 이전에는 함수나 어느정도 정해진 타입
 *         아직 정의되지 않은 것들도 타입으로 정의 가능 (예전에는 구조체 Strucuture)
 *         구조체(Structure) vs 클래스(Class)
 *         구조체는 상태만 가짐 + 중요한 차이 : 상속, 다형성 없음
 *         클래스는 상태+동작 까지 가짐 + 중요한 차이 : 상속, 다형성 있음
 *   기타 : 정의되지 않은 여러가지들까지도 표현 가능
 *
 * - 클래스?
 *   객체를 분류하는 기능 (Classify : 분류하다)
 *   e.g. 학교에서의 학반? 아이들을 일련의 분류를 한 것
 *   일반적으로 책에서 말하는 클래스 : 일종의 객체를 찍어내는 틀이다. => 틀린 것, 객체 생성 시점에만 맞는 말
 *
 *   => 클래스 1 : N 객체를 생성 가능
 *   => 더 이상 참조하는 객체가 없을 때 제거(null 처리)
 *      하지 않을 경우 메모리 누수
 *      "참조하지 않을 때" 라는 것은 아무 변수에도 이 객체가 담겨져있지 않음
 *      "두 객체가 서로 참조하고 있을 때" 라는 것은 강한 참조(Strong Reference), 이것 또한 메모리 누수
 *         어쩔 수 없이 강한 참조해야 하는 경우 두가지 방법
 *            1. 함수 파라미터 사용으로 변경하기
 *               : (귀찮음)애시당초 멤버로 소유하지 않게끔 처리
 *            2. null 처리를 할 수 있도록 특정 함수 호출해주기
 *               : (덜 귀찮음->위험)보유를 하되, 사용이 더이상 불필요할 때 명시적으로 제거 처리
 *
 *   객체 분류 방법
 *   TOP-DOWN : 추상적 개념 > 구체화 > 상태/속성과 행동/기능 정의
 *   BOTTOM-UP : TOP-DOWN의 역. 작은 개념에서 더 큰 개념으로 정의
 *   e.g.
 *   추상적 개념 : 사람이다
 *   구체화 : 사람은 팔, 다리, 몸통, 머리, 생각을 갖는다.
 *   상태/속성 : 팔 2개, 다리 2개, 몸통 1개, 머리 1개, 생각 1개
 *   행동/기능 : 말한다. 뛴다. 글을 쓴다. 컴퓨터를 사용한다. ...
 *
 *   분류된 객체를 코드화
 *
 * - 코드로써의 객체
 *   컨셉 : 클래스(Class)
 *     ㄴ 상태/속성 : 필드(Field) == 변수/상수 == 객체의 고유 값
 *     ㄴ 행동/기능 : 메소드(Method) == 함수 == 객체가 하는 동작/기능
 *
 * - 객체 지향 원칙(Principle) : 5대 원칙
 *   캡슐화(Capsulation) : 객체의 내부(객체가 작성된 코드 => 클래스)를 들여다보지 않고 가져다 사용
 *   정보 은닉(Information Hiding) : 변수(값)/함수(기능)를 내부적으로 숨기고, 필요로 하는 부분만 노출
 *   추상화(Abstraction) : 공통된 것을 상위로 추출해서 추상화(== 객체 분류 방법과 동일 과정)
 *   상속(Inheritance) : 부모/자식 클래스로 나누고, 부모에 추상화시킨 것을 정의 후 하위 클래스에서 구현,
 *                      다음 상속받는 자식에게 그대로 전수
 *   다형성(Polymorphism) : 여러가지 형태로 변형 가능(부모 > 자식, 자식 > 부모, 인터페이스)
 *
 *   TIP. 부모 : 더 넓은 상위 개념 (상위 : Base/Super/Parent)
 *        자식 : 더 구체화된 개념 (하위 : Sub/Derived/Child)
 */
void main() {
  // JAVA : MyClass myObject = new MyClass();
  // 버전 업데이트 전 DART : MyClass myObject = new MyClass();
  MyClass? myObject = MyClass(); // 기본 생성자로 클래스로부터 객체 생성

  print(myObject); // 인스턴스 : Instance of 'MyClass'
  print(myObject.runtimeType); // 클래스명 : MyClass
  print(myObject.hashCode); // 객체의 해시값 : 466242970
  print(myObject == MyClass()); // 객체가 새로 생성한 객체가 같은지 비교 : false
  print(myObject == myObject); // 두 객체가 같은 객체인지 비교 : true => Class명, HashCode 값, 재정의할 때 비교선언한 것들로 비교

  myObject = null; // 객체 제거
  print(myObject); // 없는 인스턴스 : null

  print(myObject?.runtimeType); // 없는 인스턴스 : null
  print(myObject?.runtimeType?.toString() ?? ""); // 기본 값 빈 문자열 : ""

  // 여러 객체나 데이터 변수들 등이 서로서로 한정된 메모리 공간을 잘 활용하려고...
  // 객체가 다시 필요할 시 재생성 => 단, 이 때, 기존 객체에 있던 값은 없음
  myObject = MyClass();
  // 사용을 다하고 난 후 불필요한 시점에 다시 제거
  myObject = null;

  // *.dart 72:17  main
  // Failed to load "*.dart": Null check operator used on a null value
  // 널포인터 예외(NPE : Null Pointer Exception)
  print(myObject!.runtimeType);
}

// 관례적인 작성 순서 : 코드 규칙(Code Convension)
class MyClass {
  // 상수(Constants) : 대문자 + 언더라인으로 명명(Snake 작성법 작성)

  // 필드(Field) == 변수(Variable)/속성(Property)
  //    ㄴ 객체마다 값 부여
  //    ㄴ 정적/클래스 변수 : 클래스명으로 즉각 사용 -> 공유
  //    ㄴ 동적/멤버 변수 : 객체를 생성해야만 사용 -> 객체 개별

  // 생성자(Constructor)
  //    ㄴ 클래스로부터 객체를 생성하는 함수(함수명은 클래스명으로 고정)

  // 메소드(Method) == 함수(Functions)
  //    ㄴ 정적/클래스 메소드 : 클래스명으로 즉각 사용 -> 공유
  //    ㄴ 동적/멤버 메소드 : 객체를 생성해야만 사용 -> 객체 개별

  // 중첩(Nested Class)/내부(Inner) 클래스/인터페이스 : DART 미지원
}

void strongSample() {
  A a = A();
  C c = C();
  a.c = c;
  c.a = a;
}

// 강한 참조 예시1 : 양쪽 강한 참조
class A { C? c = null; }
class C { A? a = null; }

// 강한 참조 예시2 : 상속 강한 참조
class Parent {
  Child? child;
  void init() { child = Child(this); }
}
class Child extends Parent {
  Child(Parent p) { this.p = p; }
  Parent? p = null;
}

// 강한 참조 예시3 : 순환식 강한 참조
class CLS1 { CLS2? y = null; }
class CLS2 { CLS3? z = null; }
class CLS3 { CLS1? X = null; }
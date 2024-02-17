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

// "동물" 분류 만듦
class Animal { }

// "사람" 분류 만듦
class Person {
  /**
   * - 객체의 의미 3가지
   *   Object 로써의 객체 : 모든 객체
   *   Instance 로써의 객체 : 메인메모리 상의 객체
   *   Entity 로써의 객체 : 데이터로 만들어져있는 객체
   *
   * - 인스턴스(Instance)?
   *   메인 메모리에 있는 상태의 객체
   *   (+ 인스턴스화(Instantiate) : 메인메모리에 클래스로부터 객체로 만드는 것)
   *
   * - 객체의 멤버 두 가지
   *   인스턴스 멤버 : 멤버 변수/함수(멤버 필드/멤버 메소드)
   *   별도 키워드 없음 => 객체마다 고유한 값/기능 부여
   *                  => 힙(Heap) 영역 => null 처리 후 제거
   *                  => 객체 사용할 때까지만 가지고 가고 싶을 때
   *                     (90% 이상 여기에 속하게 될 것)
   *   클래스 멤버 : 정적 변수/함수(정적 멤버 필드/정적 멤버 메소드)
   *   static 키워드 => 모든 객체가 공유하는 값/기능 부여
   *                => 코드/텍스트 영역 => 프로그램 종료 시점에 제거
   *                => 프로그램이 끝날 때까지 계속 보유하고 싶을 때
   *                   (10% 이하 또는 더 적은 쪽임. e.g. 상수)
   */
  // 초기화 하지 않을 경우 오류 :
  // Non-nullable instance field 'head' must be initialized.
  // 최소한 기초 타입의 기본 값으로 초기화할 것!

  // 공유되는 값임
  static int STATE = 10;

  // 초기화 : 이 클래스로부터 객체가 최초로 생성될 때 가질 값
  int head = 1;
  int face = 1;
  int hands = 2;
  int legs = 2;
  int body = 1;
  int? arm = null;

  // 기능 == 함수/메소드
  void work() {
    // 기본적으로 변수를 지칭하면,
    // 멤버변수(필드)를 호출하게 됨

    // 같은 이름의 변수일 경우 우선순위는
    // 지역변수 > 멤버변수
    // (스코프에 따른 변수의 우선순위 : 지역 > 외부 > 전역)
    int legs = 3;
    print("${ legs }개의 다리로 걸음");
    // this 키워드로 멤버변수를 직접 지칭 가능
    print("${ this.legs }개의 다리로 걸음");
    // this 키워드? 현재 객체의 레퍼런스 주소

  }

  // Listener : 리눅스 계통
  // Handler : 윈도우 계통
  // 콜백 시스템 : 등록이 언제될지 모르지만, 일단 등록되면, 상황에 대해 일어난 것을 캐치 가능
  void addOnRanListener(void Function() onRan) {
    this.onRan = onRan;
  }

  void Function()? onRan;

  void run() {
    // 주석에서 `ignore: ~` 입력하면, Lint에게 경고하는 것 끄라고 지시
    // ignore: unnecessary_this
    print("${ this.legs }개의 다리로 뜀");

    // 고차함수/람다 개념을 같이 엮으면 헷갈려지기 시작함
    // => 멤버 메소드 안에서 클래스 메소드를 호출하더라도,
    //    클래스 메소드에서 this를 알 수는 없음
    // => 클래스 멤버에는 자기자신 레퍼런스 주소(this) 정보는 없음
    //    인스턴스 멤버에는 자기자신 레퍼런스 주소(this) 정보가 있음
    var speak = Person.speak;
    speak.call(this);// 클래스 메소드를 람다로 가져와서 호출 => this 정보 없음
    var work = this.work;
    work.call();// 인스턴스 메소드를 람다로 가져와서 호출 => this 정보 있음

    // 콜백 : 호출 측 또는 이 상황에 관심있는 객체에게 알려주는 역할
    onRan?.call();

    // 위의 두 가지가 다른 점 : 인스턴스 보유 유무
    some(speak);
  }

  // 클래스 메소드와 고차함수 => 여기서 중요한 것?
  // 클로저 이냐? vs 아니냐? 개념을 정확히 알고서 사용해야 함 => 잘 모르면 메모리 누수
  // 그렇다면 고차함수 스타일은 언제 쓰는게 좋은가요? 콜백용으로 사용하는 것이 좋음
  void some(void Function(Person) fn) {
    fn.call(this);
  }

  void bye() {
    // 멤버변수를 해치지 않으면서 멤버변수를 사용하는 방법

    // 내 기존 멤버변수의 값을 100으로 바꿈
    // 이 메소드가 다시 실행되는 시점에는 기존 멤버변수의 값이 100으로 사용됨
    // this.hands = 100;
    // print("${ hands }개로 안녕~ 이라고 인사함");

    // 이 메소드가 다시 실행되는 시점에는 기존 멤버변수의 값이 그대로 유지됨
    // 멤버변수의 값을 복사해와서 사용 => 기초 타입에서만 해당되는 이야기
    int hands = this.hands;
    hands = 100;
    print("${ hands }개로 안녕~ 이라고 인사함");
  }

  static void speak(
    Person thiz // 객체의 레퍼런스 주소가 복제됨
  ) {
    // 객체의 레퍼런스 주소에 찾아가서 그 멤버변수의 값을 변경시킴
    // => 의도치 않게 외부 효과(Side Effect)를 일으킴
    // thiz.face = 100;
    int face = thiz.face;
    face = 100;
    print("${ face }개의 얼굴로 말함");

    // 클래스 메소드(정적 메소드) : this를 잃어버림
    // => 이 메소드는 객체 생성없이도 가능
    // => 인스턴스 멤버는 사용 불가 => 멤버변수/메소드는 사용 불가
    //print("${ face }개의 얼굴로 말함");
    print("${ thiz.face }개의 얼굴로 말함");
  }
}

// 사과 클래스 정의
class Apple { }

void main() {
  // 1개 객체가 들어갈 수 있는 공간만 선언 => 객체 생성한 것 아님!
  MyClass myClass; // == " MyClass myClass = null; "
  myClass = new MyClass(); // 가능 : 보일러 플레이트 코드 new
  myClass = MyClass(); // 가능 : 생성자 함수를 직접 호출

  // 아래 myClass1 객체와 myClass2 객체는 같은가?
  // 아니오. 레퍼런스 주소가 다름 => 클래스 1개당 N개 객체 생성
  MyClass myClass1 = MyClass();
  MyClass myClass2 = MyClass();
  print(MyClass() == MyClass());

  // 클래스명 == 생성자 가 아님!
  // 구조적 타이핑 언어에서는 클래스명이 곧 생성자 이지만,
  // 정적 타이핑 언어에서는 클래스명은 클래스일 뿐! (== 타입이다.)
  var type = MyClass; // Type 타입을 가져온 것

  // 과일 : 사과를 정의하고 생성하시오.
  Apple apple = Apple();

  // 최초에 배우던 변수 선언과 초기화
  // 클래스를 배우고 난후 변수 선언과 초기화
  // 완전히 같음.
  // 다른 부분?
  // 최초에 배울 때는 DART에서 기본 지원하던 타입만 했던 것
  // 새로운 타입(== 클래스, 사용자 정의 타입)을 선언하고 초기화
  // - 기초 타입(Primitive, Built-in) : 값 정의 타입
  // - 사용자 정의 타입(User-Defined) : 유형 정의 타입
  //
  // 변수 선언 + 초기화
  Animal animal = Animal();
  // 변수 초기화
  animal = Animal();

  // 직접 생성해보기
  Person person = Person();
  // person. 입력 후 내용을 보면,
  // f: 필드
  // p: 속성 = 필드 + 액세서   => 필드: 값, 액세서: 메소드
  // m: 메소드
  print("${ person.head } ${ person.face } ${ person.body } ${ person.hands } ${ person.legs }");
  person.head = 2;// 이 사람 객체는 머리가 두 개가 됨

  Person difPerson = Person();
  // 필드는 객체의 고유한 값
  // person.head == 2
  // difPerson.head == 1
  print("${ person.head } ${ difPerson.head }");

  // 특정 객체를 명시해서 호출하려는 경우
  // 이 객체에서 해당되는 사항만 인텔리전스(자동완성)에 나타남
  // person.
  // static 키워드가 있는 필드를 사용하려면 클래스명을 정확히 지칭해야 함
  print(Person.STATE);

  // 메소드 호출하기
  person.work();
}










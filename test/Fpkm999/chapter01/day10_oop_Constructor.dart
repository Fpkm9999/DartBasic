/*
    P29
  - 접근 제한자 (Visibility Modifier)
    다른 객체에게 노출 여부 ex) 도트로 접근할 때
    언더라인('_')이 있으면 : 비공개 -> 내부에서만 사용될 가능성이 다분함.
    언더라인('_')이 없으면 : 공개
    DART : 파일 단위 / 비공개 변수(private), 공개(public) <-- 다트는 2가지만 지원함
    타 언어의 경우 : 객체 단위 / 비공개(private), 상속(protected), 공개(public)
                          (자바) package-private
                          (코틀린) internal <- 프로젝트

  - 생성자(Constructor)
    객체를 생성 하는 함수 -> 힙(Heap) 영역에 배치가 됨.
    파라미터 들어올 수 있는거 : 생성자, 포지셔널, 네임드

 */
class Default {
  /*
   * 생성자를 작성 하지 않음 : 컴파일러가 자동으로 파라미터가 없는 생성자로 자동으로 만들어줌.
   */
  // Default() {} => 이상태로 만들어줌
  // todo 2교시
  static void sample() {
    Default instance = Default();
  }
}

class MyDefault {
  // case1. 몸체가 없는 생성자 => 생성타임 후 변형이 없다. // 이것도 기본생성자가 생성된거임
  MyDefault();
// case 2. 몸체가 있는 생성자 => 생성 타임 직후 변형이 있음
// MyDefault() {// 몸체 }
}

class NoneBodyDefault {
//   몸체가 없는 생성자 => 생성 타임 직후 값에 대해 변형이 없음.
  NoneBodyDefault();
}

class BodyDefault {}

class NoneBodyParameterized {
  // 파라미터가 있는 생성자

  // DART 전용 : 생성 타임에 초기화 (생성자초기화 매개변수가 있는)
  // 생성타임 : 'BodyParameterized()' 구문에서 생성되고 초기화 될 때까지
  // case 1
  // BodyParameterized(int value) : this.value = value; // case1의 경우 파라미터 의 이름 변경이 가능함. 매개변수명과  int exter) = this.value = exter;
  // case2, 또 축양된 생성자 초기화 방법. case1과는 다른 방법임
  // NoneBodyParameterized(this._value);
  // case2는 이름이 멤버변수의 이름과 같아야만 사용가능
  // 파라미터 이름과 멤버 변수의 이름이 같아야만 함
  // => KOTLIN 같은 언어에선 내부적으로 백킹 필드(Backing Field) 추가됨
  // DART에서는 멤버 변수가 곧 백킹 필드 역할을 함
  //  - 백킹 필드 : 보이지 않는 뒤쪽에 필드를 말함

  int _value = 0; // private 멤버 변수

// 파라미터의 이름 변경 가능 / 내부/외부 변수명 이 다르게 사용
// NoneBodyParameterized(this._value); // 잘못된 작성법
// NoneBodyParameterized(int external =0): this._value = external; // 이게 정석
// BodyParameterized({int value = 0}):this._value = value;
  NoneBodyParameterized();
// this가 붙으면 멤버 변수라고 보자 일단은.

// 모든 멤버 변수가 final 로 선언 되었을 때(생성 될 때 값이 결정 되고, 바뀌지 않음 => 상수)
// 생성자 이름 앞에는 const 키워드 사용 가능
// 상수 규칙 이해 : 컴파일 상수든, 런타임 상수든 선언 되고 초기화 되고 난 후에 값 수정 불가
// 이런게 되는 경우
// 값만 갖는 경우에 이렇게 사용됨
//  => 실행 중도에 변경 없는 객체
//      => 변경 하고 싶었 다면,재생성 되는 객체
  //           => 관용적 명칭의 메소드 : copyWith({ 변경가능한 파라미터 나열 }) todo  copyWith
// const BodyParameterized(this.value);
//   final int value;
//   BodyParameterized copyWith({
//     int? value
// }) => BodyParameterized(
//     value ?? this.value // null이라면 this.value 객체의 값을 사용 한다
//   );

// 플러터에서 주로 사용 되는 형태 : todo 위젯 클래스
// const NoneBodyParameterized({required this.value});
// final int value;  // 값이 바뀌는 경우 사용할 수 없다.
// NoneBodyParameterized copyWith({
//   int? value
// } => NoneBodyParameterized(
//     value : value ?? this.value // null이라면 this.value 객체의 값을 사용 한다
// ); // return
}

class BodyParameterized {
  //  일반적인 언어에서 생성할 때... (+ DART 에서도 지원)
  // BodyParameterized() >>> 구문에서 객체 생성 > (생성 타임 직후) 생성자 몸체에서 초기화 | 일단 이 구문에서생성자가 실행됨
  //  파라미터가 있는 생성자 + 몸체가 있는 생성자
  // BodyParameterized(var value){
    // this.value = value;
  // } // 경구 뜸 그래서 아래와 같이 할 수 있음 다트에선

  // DART 전용 : 생성 타임에 초기화 (생성자초기화 매개변수가 있는)
  // 생성타임 : 'BodyParameterized()' 구문에서 생성되고 초기화 될 때까지
  // case 1
  // BodyParameterized(int value) : this.value = value; // case1의 경우 파라미터 의 이름 변경이 가능함. 매개변수명과  int exter) = this.value = exter;
  // case2, 또 축양된 생성자 초기화 방법. case1과는 다른 방법임
  // BodyParameterized(this.value);
  // case2는 이름이 멤버변수의 이름과 같아야만 사용가능
  // 파라미터 이름과 멤버 변수의 이름이 같아야만 함
  // => KOTLIN 같은 언어에선 내부적으로 백킹 필드(Backing Field) 추가됨
  // DART에서는 멤버 변수가 곧 백킹 필드 역할을 함
  //  - 백킹 필드 : 보이지 않는 뒤쪽에 필드를 말함

  // 파라미터의 이름 변경 가능
  // BodyParameterized(int _value); // 잘못된 작성법
  // BodyParameterized(int value): this._value = value; // 이게 정석
  // BodyParameterized({int value = 0}):this._value = value;

  // this가 붙으면 멤버 변수라고 보자 일단은.
  // int _value =0;  // private 멤버 변수

  // 모든 멤버 변수가 final 로 선언 되었을 때(생성 될 때 값이 결정 되고, 바뀌지 않음 => 상수)
  // 생성자 이름 앞에는 const 키워드 사용 가능
  // 상수 규칙 이해 : 컴파일 상수든, 런타임 상수든 선언 되고 초기화 되고 난 후에 값 수정 불가
  // 이런게 되는 경우
  // 값만 갖는 경우에 이렇게 사용됨
  //  => 실행 중도에 변경 없는 객체
  //      => 변경 하고 싶었 다면,재생성 되는 객체
  //           => 관용적 명칭의 메소드 : copyWith({ 변경가능한 파라미터 나열 })
//   const BodyParameterized(this.value);
//   final int value;
//   BodyParameterized copyWith({
//     int? value
// }) => BodyParameterized(
//     value ?? this.value // null이라면 this.value 객체의 값을 사용한다
//   );

  // // 플러터에서 주로 사용 되는 형태 : 위젯 클래스
  // const BodyParameterized({required this.value});
  // final int value;  // 값이 바뀌는 경우 사용할 수 없다.
  // BodyParameterized copyWith({
  //   int? value
  // }) => BodyParameterized(
  //     value : value ?? this.value // null이라면 this.value 객체의 값을 사용 한다
  // );
}

// 값만 가지고 있는 사람
class Person {
  // const : 이 클래스에 만들어진 객체는 값을 바꿀 수 없습니다. 라는 의미와 같음.
  // 같은 클래스에 생성자를 여러 개 생성하면 안된나요?
  //   => DART에서는 메소드 오버로딩을 지원하지 않아서, 생성자 또한 오버로딩 불가
  //  - 메소드 오버로딩 : 같은 이름을 가진 메소드를 여럭 개 선언하는 기능
  //  => 그러면 유사하게라도 어떻게 하면 되나요?
  //    명칭형 생성자를 사용 하거나, 옵션 값 처리(Nullable 처리)로 우회 사용 한다.
  const Person({
    required this.head, // 필수 값 : 머리는 반드시 외부에서 주세요. 라는 의미 이다.
    required this.body, // 필수 값 : 몸통도 반드시 외부에서 주세요. 라는 의미 이다.
    this.arms = 2, // 옵션 값 : 값을 지정 안하면, 팔은 2개 입니다. 라는 의미이다.(기본값 지정)
    this.legs = 2, // 옵션 값 : 값을 지정 안하면, 다리는 2개 입니다. 라는 의미이다. (기본값 지정)
  });

  // 값을 바꿀 수 없기 때문에 모든 멤버는 런타임 상수 입니다.
  final int head;
  final int body;
  final int arms;
  final int legs;

  // 값을 바꾸고 싶다면, copyWith 메소드로 객체를 재생성 하세요.
  // copyWidth 메소드가 없다면요?
  // => DART 언어의 모든 클래스에서 지원하는게 아니며,
  //     지원되는 경우에만 값을 변경할 수 잇음
  // 그래서 방법은 크게 2가지임 final을 사용하는 방법(const사용가능) 과 final이 아닌 방법
  Person copyWith({
    // 이런 식으로 기본 값 주는 것은 안됨 => 파라미터에서는 this 레퍼런스를 모르는 상태
    // int? head = this.head, // 여기선 this를 사용불가.
    int? head,
    int? body,
    int? arms,
    int? legs,
  }) {
    // 파라미터 값 가공 하기 => 만약 가공할 필요가 없을 경우 화살표('=>')로 copyWith 메소드 몸체 없어도 됨

    // 새 객체 생성
    return Person(
        // 파라미터가 null 이면, 현재 값 그대로 사용한다는 의미이다.
        //  => 변경할 값만 넣어서 변경 하고, 변경 업는 값은 그대로 사용 합니다.
        head: head ?? this.head,
        body: body ?? this.body,
        arms: arms ?? this.arms,
        legs: legs ?? this.legs);
  }
}

// const + final 케이스가 아닌 방식
// 이번엔 final 이 아닌 거
class Animal {
  // 이미 내부적으로 변경하는 값(덧셈 등)이 있기 떄문에 const 사용 불가
  Animal({
    this.head = 1,
    this.body = 1,
    int leftArm = 1,
    int rightArm = 1,
    int leftLeg = 1,
    int rightLeg = 1}):
        arms = leftArm + rightArm,
        legs = leftLeg + rightLeg
  // 여기를 기준으로 왼쪽은 생성 타임 //
  // 여기 밑쪽은 생성 타임 이후임 //
  {
          total = head + body + leftArm + rightArm + legs;
}

  int total = 0;
  int head = 0;
  int body = 0;
  int arms = 0;
  int legs = 0;
}

void main() {
  // 주는 값에 따라 초기 값을 변경해서 사용 가능
  Person person = Person(head: 1, body: 1);
  // 이렇게 ㅈㄴ 긴 이유. 메소드 오버로딩을 지원안하기 때문

  // 기본 값 까지 변경해서 생성
  person = Person(head: 1, body: 1, arms: 3);
  // 단, 생성 되고 난 후 동적으로 바꿀 수는 없음 -> final 로 고정될 것이라고 선언했기 떄문.
//   person.head = 2;

  // 재생성됬기 떄문에, 다시 원래 변수에 담아주는 과정이 필요(레퍼런스 값 변경과는 다름)
  person = person.copyWith(
    body: 2,
  );
  // 모든 값을 기본 값으로 쓰겠습니다. 라는 의미
  Animal animal = Animal(); // 이 구문이 끝날 때, 생성자 몸체까지 실행되었음
  print(animal.total);
}
/*
  void ~~
  >>> 전역함수 
  '{}' 명칭형 : 명칭형 파라미터
  '[]' 파라미터 : 위치형 파라미터
  //재귀 함순.
 */
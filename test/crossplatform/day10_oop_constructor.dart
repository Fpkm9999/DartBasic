import 'dart:ffi';

/**
 * - 접근 제한자(Visibility Modifier)
 *   다른 객체에게 노출 여부
 *   언더라인(`_`)이 있음 -> 비공개 -> 내부에서만 사용될 가능성이 다분함
 *   언더라인(`_`)이 없음 -> 공개
 *   DART : 파일 단위 / 비공개(private), 공개(public)
 *   타 언어 : 객체 단위 / 비공개(private), 상속(proteceted), 공개(public)
 *                      (JAVA) package-private
 *                      (KOTLIN) internal <- 프로젝트
 *
 * - 생성자(Constructor)
 *   객체를 생성하는 함수 -> 힙(Heap) 영역 배치
 */

class Default {
  /*
   * 생성자를 작성하지 않음 : 컴파일러가 자동으로 파라미터가 없는 생성자를 만들어줌
   */
  // Default() {}

  static void sample() {
    Default instance = Default();
  }
}

class NoneBodyDefault {
  // 몸체가 없는 생성자 => 생성 타임 직후 값에 대해 변형이 없음
  NoneBodyDefault();

  static void sample() {
    NoneBodyDefault instance = NoneBodyDefault();
  }
}

class BodyDefault {
  // 몸체가 있는 생성자 => 생성 타임 직후 값에 대해 변형이 있음
  BodyDefault() { }

  static void sample() {
    BodyDefault instance = BodyDefault();
  }
}

class NoneBodyParameterized {
  // 파라미터가 있는 생성자 =>

  // DART 전용 : 생성 타임에 초기화
  // 생성 타임 : `BodyParameterized()` 구문에서 생성되고 초기화 될 때까지

  // int _value = 0;// private 멤버 변수

  // 파라미터의 이름 변경 가능

  // 잘못된 작성법
  // NoneBodyParameterized(this._value);
  // static void createSample() {
  //   NoneBodyParameterized instance = NoneBodyParameterized(3478);
  // }

  // 파라미터의 이름 변경 가능 : 내부/외부 변수명이 다르게 사용
  // NoneBodyParameterized(int external): this._value = external;
  // static void createSample() {
  //   NoneBodyParameterized instance = NoneBodyParameterized(3478);
  // }

  // 오류 : Named parameters can't start with an underscore.
  // BodyParameterized({ this._value = 0 });
  // NoneBodyParameterized({ int value = 0 }): this._value = value;
  // static void createSample() {
  //   NoneBodyParameterized instance = NoneBodyParameterized(
  //     value: 3478
  //   );
  // }

  // 파라미터 이름과 멤버 변수의 이름이 같아야만 함
  //   => KOTLIN 같은 언어에선 내부적으로 백킹 필드(Backing Field) 추가
  //      DART 에서는 멤버 변수가 곧 백킹 필드 역할을 함
  //      - 백킹 필드 : 보이지 않는 뒤쪽에 필드
  // NoneBodyParameterized(this.value);
  // int value = 0;
  // static void createSample() {
  //   NoneBodyParameterized instance = NoneBodyParameterized(3478);
  // }

  // 모든 멤버 변수가 final로 선언되었을 때(생성될 때 값이 결정되고, 바뀌지 않음 => 상수)
  // 생성자 이름 앞에는 const 키워드 사용 가능
  // 상수 규칙 이해 : 컴파일 상수든 런타임 상수든 선언되고 초기화되고 난 후 값이 바뀔 수 없음
  // 값만 갖는 객체인 경우에 이렇게 사용됨
  //   => 실행 중도에 변경없는 객체
  //       => 변경하고 싶었다면, 재생성되는 객체
  //           => 관용적 명칭의 메소드 : copyWith({ 변경가능한 파라미터 나열 })
  // final int value;
  // const NoneBodyParameterized(this.value);
  // NoneBodyParameterized copyWith({
  //   int? value
  // }) => NoneBodyParameterized(
  //   value ?? this.value
  // );
  // static void createSample() {
  //   NoneBodyParameterized instance = NoneBodyParameterized(3478);
  //   instance = instance.copyWith(value: 123789);
  // }

  // 플러터에서 주로 사용되는 형태 : 위젯 클래스
  const NoneBodyParameterized({ required this.value });
  final int value; // 값이 바뀌는 경우 이렇게 사용하기 어려움...
  NoneBodyParameterized copyWith({
    int? value
  }) => NoneBodyParameterized(
      value: value ?? this.value
  );
  static void createSample() {
    NoneBodyParameterized instance = NoneBodyParameterized(
      value: 3478
    );
    instance = instance.copyWith(value: 123789);
  }
}

class BodyParameterized {
  // 일반적인 언어에서 생성할 때... (+ DART 에서도 지원)
  // `BodyParameterized()` 구문에서 객체 생성 > (생성 타임 직후)생성자 몸체에서 초기화
  // 파라미터가 있는 생성자 + 몸체가 있는 생성자
  // BodyParameterized(int value) {
  //   this.value = value;
  // }

  // 나머지는 위와 동일
}

// const + final 케이스인 방식
// 값만 갖고 있는 사람 객체
class Person {
  // 같은 클래스에 생성자를 여러 개 생성하면 안되나요?
  //   => DART 에서는 메소드 오버로딩을 지원하지 않아서, 생성자 또한 오버로딩 불가
  //      - 메소드 오버로딩 : 같은 이름을 가진 메소드를 여러 개 선언하는 기능
  //   => 그러면, 유사하게라도 어떻게 하면 되나요?
  //      명칭형 생성자를 사용하거나, 옵션 값 처리(Nullable 처리)로 우회 사용

  // const : 이 클래스에 만들어진 객체는 값을 바꿀 수 없습니다.
  const Person({
    required this.head, // 필수 값 : 머리는 반드시 외부에서 주세요.
    required this.body, // 필수 값 : 몸통은 반드시 외부에서 주세요.
    this.arms = 2, // 옵션 값 : 값을 지정 안하면, 팔은 2개 입니다.
    this.legs = 2, // 옵션 값 : 값을 지정 안하면, 다리는 2개 입니다.
  });

  // 값을 바꿀 수 없기 때문에 모든 멤버는 런타임 상수 입니다.
  final int head;
  final int body;
  final int arms;
  final int legs;

  // 값을 바꾸고 싶다면, copyWith 메소드로 객체를 재생성하세요.
  // copyWith 메소드가 없다면요?
  //   => DART 언어의 모든 클래스에서 지원하는게 아니며,
  //      지원되는 경우에만 값을 변경할 수 있음
  Person copyWith({
    // 이런 식으로 기본 값 주는 것은 안됨 => 파라미터에서는 this를 모르는 상태
    //int head = this.head,
    int? head,
    int? body,
    int? arms,
    int? legs,
  }) {
    // 파라미터 값 가공하기
    //   => 가공할 필요가 없을 경우 화살표(`=>`)로 copyWith 메소드 몸체없어도 됨

    // 새 객체 생성
    return Person(
      // 파라미터가 null 이면, 현재 값 그대로 사용
      //   => 변경할 값만 넣어서 변경하고, 변경없는 값은 그대로 사용합니다.
      head: head ?? this.head,
      body: body ?? this.body,
      arms: arms ?? this.arms,
      legs: legs ?? this.legs
    );
  }
}

// const + final 케이스가 아닌 방식
class Animal {
  // 이미 내부적으로 변경하는 값(덧셈 등)이 있기 때문에 const 불가
  Animal({
    this.head = 1,
    this.body = 1,
    int leftArm = 1,
    int rightArm = 1,
    int leftLeg = 1,
    int rightLeg = 1
  }): arms = leftArm + rightArm,
      legs = leftLeg + rightLeg
  // 여기를 기준으로 윗쪽은 생성 타임 //
  // 여기 밑쪽은 생성 타임 이후임    //
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
  // 기본 값까지 변경해서 생성
  person = Person(head: 1, body: 1, arms: 3);

  // 단, 생성되고 난 후 동적으로 바꿀 수는 없음 => final 로 고정될 것이라고 선언했기 때문
  //person.body = 2;

  // 재생성됬기 때문에, 다시 원래 변수에 담아주는 과정 필요(레퍼런스 값 변경과는 다름)
  person = person.copyWith(
    body: 2,
  );

  // 모든 값을 기본 값을 쓰겠습니다.
  Animal animal = Animal();// 이 구문이 끝날 때, 생성자 몸체까지 실행되었음
  print(animal.total);
}
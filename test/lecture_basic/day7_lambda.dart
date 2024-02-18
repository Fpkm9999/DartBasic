void main() {
  /**
   * - 고차 함수(Higher-Order Functions)
   *   함수에서 다른 함수를 전달 받는 기능
   *   고차 함수는 다른 함수를 인자로 받거나, 함수를 반환 하는 함수이다.
   *   이런 함수는 코드의 재사용성을 높이고, 더 유연한 코드 작성을 가능하게 한다.
   *
   * - 익명 함수(Anonymous Functions)
   *   익명 함수는 이름이 없는 함수로, 주로 일회성으로 사용되는 로직을 정의할 때 활용.
   *    Dart에서 익명 함수는 다음과 같은 형태를 가질 수 있습니다:
   */

  caller((p) {
    // 익명 함수(Anonymous Functions)
    print("NoNamed(int $p)");
  });
  caller(fn); // 미리 정의된 함수

  /**
   * - 익명함수?
   *   이름이 없는 함수 => 람다식(Lambda) 사용
   *
   * - 익명함수가  람다식(Lambda Expression)을 사용하는 주요 이유
   *   코드의 간결성, 표현력, 그리고 함수형 프로그래밍 패턴을 효과적으로 구현하기 위함
   *   그런 이유로 람다식은 이름이 없는 함수를 더 간단하고 직관적인 방식으로 표현할 수 있게 해주기 때문에 같이 사용하는 편이다.
   *
   * - 람다?
   *   함수의 형식을 축약해서 꼭 필요한 부분만 작성하는 것
   *   함수가 작동될 때, 입력 값인 매개변수(Parameter) + 몸체/연산 코드 + 결과 값인 반환형(Return)
   *
   *    // 익명 함수만 사용
   *     list.forEach((item) {
   *     print(item);
   *     });
   *
   *    // 람다식 사용
   *    list.forEach((item) => print(item));
      //  리스트의 각 항목을 출력하는 간단한 연산을 람다식을 통해 구현
   *
   *   - 함수 시그니처(Functions Signature) : 파라미터 + 결과값
   *   정의 : 함수의 정의에서 함수 이름, 매개변수 목록, 매개변수 타입, 반환 타입 등 함수를 구성하는 주요 요소들을 의미한다.
   *   즉 함수의 구조를 정의하는 표현식이다.
   *   함수 시그니처는 함수가 어떤 인자를 받고, 어떤 타입의 값을 반환하는지에 대한 정보를 제공한다.
   *
   *   함수 시그니처 기본 형태
   *
   *   반환타입 함수이름(매개변수타입 매개변수명, ...)
   *
   *   e.g ) JAVA 언어 기준
   *   public double multiply(double x, double y);
   *
   *   e.g ) DART 언어 기준
   *   void greet(String name) {
   *   print('Hello, $name!');
   *   }
   *
   *   함수/메소드 오버로딩(Overloading)
   *   (DART 미지원)동일한 함수명을 사용한 함수를 여러 개 선언하는 것
   *   대신 DART가 지원하는 것
   *   이름 있는 매개변수(named parameters)와 선택적 매개변수(optional parameters)를 제공 하여 함수 오버로딩의 부족함을 보완했다.
   *    >>> 명칭형 파라미터에 옵셔널/기본 값으로 사용
   *
   *
   *
   *
   * - 함수 vs 람다/익명함수
   *   함수와 동작은 완전히 같지만,
   *   함수는 정의가 된 것이고,
   *   람다는 변수화 되어서 정의된 것

   *   함수와 람다(익명 함수)의 주요 차이점
   *
   *   정의: 함수는 이름이 지정된 코드 블록으로, 재사용을 위해 프로그램 내의 여러 위치에서 호출될 수 있다
   *         반면, 람다(익명 함수)는 이름이 없으며, 주로 변수에 할당되거나 다른 함수의 매개변수로 전달됩니다.
   *   용도: 함수는 코드의 재사용성과 모듈화를 목적으로 사용됩니다. 람다(익명 함수)는 주로 일회성 함수, 콜백 함수, 또는 다른 함수에 전달될 짧은 코드 블록을 정의할 때 사용 된다.
   *   표현 방식: 람다는 Dart에서 화살표 구문(=>)을 사용하여 간결하게 표현할 수 있으며, 이는 함수 본문이 단일 표현식으로 구성될 때 유용합니다.
   *

   * - 람다 주사용처 : 주로 "리스너" 또는 "핸들러" 라고 말하는 콜백 시스템(Callback)에 많이 사용됨  todo 콜백함수
   *   예전에는 객체를 전달해줘서, 그 객체가 갖고 있는 메소드를 호출해줌
   *   현재 함수가 실행되고 난 후 결과물을 객체에 알려주는 역할
   *   => 원래는 객체 간에 상호작용을 위해 리스너나 핸들러를 주로 사용함
   *   => 람다가 되면서, 함수 간에 상호작용도 가능해짐
   *      함수 간 상호작용은 접근 가능한 곳에 함수가 있었어야만 했지만,
   *      그럴 필요가 없어짐 => 함수를 전달해줄 수 있기 때문에 가능(고차함수)
   *   -----> 1급 객체/2급 객체 : 함수를 전달 가능한가?(1급) 아닌가?(2급)
   */

  // 익명 함수의 예시 1
  // 이름이 아예 부여되지 않은 경우
  () {}; //  아무런 동작도 수행하지 않는 가장 간단한 형태의 익명 함수
  //  () : 매개변수의 목록을 나타냄
  //  {} : 는 함수의 본문을 나타냄
  //  이 경우, 함수는 아무런 매개변수도 받지 않고 (()), 함수의 본문에서도 아무런 작업을 수행하지 않습니다 ({})

  //  익명 함수는 다음과 같은 상황에서 유용하게 사용될 수 있다.

  //   1. 이벤트 핸들러나 콜백: UI 이벤트 처리나 비동기 작업의 콜백으로 익명 함수를 사용할 수 있습니다.
  //   2. 고차 함수의 인자: 다른 함수에 인자로 전달되는 함수가 일회성으로만 사용되는 경우, 익명 함수를 사용하여 인라인으로 정의할 수 있습니다.
  //   3. 임시 함수의 정의: 복잡한 연산을 위한 임시적인 함수가 필요한 경우, 익명 함수를 사용하여 짧고 간결하게 정의할 수 있습니다.

  // 이름이(만) 부여된 경우 : 변수명이 곧 함수 이름, 여기서는 anonymous 라는 이름의 함수
  // Null Function() anonymous
  var anonymous = (/*파라미터/함수 입력 값*/) {
    /* 코드 작성 */

    /* return 값/변수; */
  };
  // 호출은 main 메소드에서  anonymous();
  // 이 방식을 통해 익명 함수에 "이름"을 부여하는 것은 가능하지만, 기술적으로 이 함수에 직접적인 이름을 붙인 것은 아니다.
  // 대신, 함수를 참조하는 변수에 이름을 부여한 것입니다.
  // Dart에서 함수(익명 함수 포함)는 일급 객체로, 변수에 할당될 수 있고, 다른 함수의 매개변수로 전달되거나, 함수의 반환값으로 사용될 수 있다.

  // 매개변수를 받지 않음.
  void Function() anonymousTypedFunction = (/*파라미터/함수 입력 값*/) {
    /* 코드 작성 */

    /* return 값/변수; */ // 이 익명함수는 void므로 생략됨
  };


  // 람다(익명 함수)와 고차 함수(higher-order functions)를 사용하는 방법
  // 호출식까지 동일
  fnByLambda?.call(20);
  fn(20);
  fnByLambda?.call(20); // Callable 객체 형식
  fn.call(20); // Callable 객체 형식

  // 기본 함수를 선언하면 함수가 불필요할 때, 제거할 수 없지만,
  // 람다로 변수에 담겨진 함수는 null 처리를 할 수 있음
  fnByLambda = null;

  // 단, 정의된 함수를 변수에 담는 것은 제거하는 행위라고 볼 수 없음
  fnByLambda = fn; //담은 후
  fnByLambda = null; // null처리 한다고 해서 fn 함수가 제거되는 것은 아님. (연결고리만 끊어준 것)

  // 람다 연습용
  lambdaPractice();

} //  main 함수 끝

// 밑의 fn함수를 람다식으로 선언한 것 (여기서는 전역화된 것까지 동일)
void Function(int p)? fnByLambda = (int p) {};

// 전역으로 정의된 함수
void fn(int p) {
  print("fn(int $p)");
}

void caller(void Function(int p) notNull, [void Function(int p)? nullable = null]) {
  print("${nullable}");
  // 전달된 고차함수가 Nullable이 아닐 때 호출
  notNull(10);
  notNull.call(10);
  // 전달된 고차함수가 Nullable일 때 호출
  //nullable?(10); // 이렇게는 사용 불가x
  nullable?.call(10);
}

void lambdaPractice() {
  // num 타입 : int 또는 double 타입 (num 타입을 상속 받은 타입)
  // Dart가 실행 시점(runtime)에 변수에 할당된 값의 타입을 결정
  // 람다 기반 계산기
  num result = calculator(2, 2.0);
  print(result);
}

// calculator 함수는 람다(익명함수)와 고차 함수를 사용하여 간단한 사칙 연산 수행하는 계산기를 구현한 함수이다.
num calculator(num operand1, num operand2) {  // num 타입의 calculator 라는 이름의 함수 정의 매개변수로 num 타입 변수 2개를 받음 // num 타입이라 실수, 정수 둘다 입력을 받을 수 있다.
  final  plus = (num operand1, num operand2) => operand1 + operand2; // 더하기 연산 람다

  final num Function(num, num) minus = (operand1, operand2) { // 빼기 연산 람다
    return operand1 - operand2; //  명시적으로  타입을 가짐 <-- 빼도 무방함
  };                        // todo
  final minus2 = (num operand1, num operand2) => operand1 - operand2; // 이렇게 적어도 가능

  // 이렇게 하게 되면, dynamic Function(dynamic,dyanimc) 형식
  // final multiply = (operand1, operand2) =>
  num multiply(num operand1, num operand2) => operand1 * operand2;

  final division = (num operand1, num operand2) {
    return operand1 / operand2;
  };
  // 고차함수 호출(operator)
  return operator(
    operand1: operand1,
    operand2: operand2,
    onOperate: plus, // "변수명/함수명에 on 문자열이 붙으면, callback 함수다" 라는 것을 의미(관례) // 실제로 수행할 연산을 결정하는 콜백 함수
  );
}

// 콜백 함수 예시
num operator({
  required num operand1, // 입력1
  required num operand2, // 입력2
  required num Function(
    num operand1,
    num operand2,
  ) onOperate, // 처리기
}) {
  // 초기화
  num result = 0;
  // 연산 : 연산이 필요한 시점에 onOperate를 호출해줌
  result = onOperate.call(operand1, operand2);

  // 리턴
  return result;
}

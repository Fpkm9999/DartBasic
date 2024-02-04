void main() {
  /**
   * - 고차 함수(Higher-Order Functions)
   *   함수에서 다른 함수를 전달받는 기능
   */
  caller((p) { // 익명 함수(Anonymous Functions)
    print("NoNamed(int $p)");
  });
  caller(fn); // 미리 정의된 함수

  /**
   * - 익명함수?
   *   이름이 없는 함수 => 람다식(Lambda) 사용
   *
   * - 람다?
   *   함수의 형식을 축약 해서 꼭 필요한 부분만 작성하는 것
   *   함수가 작동될 때, 입력 값인 매개변수(Parameter) + 몸체/연산 코드 + 결과 값인 반환형(Return)
   *   함수 시그니처(Functions Signature) : 파라미터 + 결과값
   *   => 함수/메소드 오버로딩(Overloading) : (DART 미지원)동일한 함수명을 사용한 함수를 여러 개 선언하는 것
   *                                       -- 명칭형 파라미터에 옵셔널/기본 값으로 사용
   *
   * - 함수 vs 람다/익명함수
   *   함수와 동작은 완전히 같지만,
   *   함수는 정의가 된 것이고,
   *   람다는 변수화 되어서 정의된 것
   *
   * - 람다 주사용처 : 주로 "리스너" 또는 "핸들러" 라고 말하는 콜백 시스템(Callback)에 많이 사용됨
   *   예전에는 객체를 전달해줘서, 그 객체가 갖고 있는 메소드를 호출해줌
   *   현재 함수가 실행되고 난 후 결과물을 객체에 알려주는 역할
   *   => 원래는 객체 간에 상호작용을 위해 리스너나 핸들러를 주로 사용함
   *   => 람다가 되면서, 함수 간에 상호작용도 가능해짐
   *      함수 간 상호작용은 접근 가능한 곳에 함수가 있었어야만 했지만,
   *      그럴 필요가 없어짐 => 함수를 전달해줄 수 있기 때문에 가능(고차함수)
   *   -----> 1급 객체/2급 객체 : 함수를 전달 가능한가?(1급) 아닌가?(2급)
   */
  // 이름이 아예 부여되지 않은 경우
  (){ };
  // 이름이 부여된 경우 : 변수명이 곧 함수 이름, 여기서는 anonymous
  // Null Function() anonymous
  var anonymous = ( /*파라미터/함수 입력 값*/ ){
    /* 코드 작성 */

    /* return 값/변수; */
  };
  void Function() anonymousTypedFunction = ( /*파라미터/함수 입력 값*/ ){
    /* 코드 작성 */

    /* return 값/변수; */
  };

  // 호출식까지 동일
  fnByLambda?.call(20);
  fn(20);
  fnByLambda?.call(20); // Callable 객체 형식
  fn.call(20); // Callable 객체 형식

  // 기본 함수를 선언하면 함수가 불필요할 때, 제거할 수 없지만,
  // 람다로 변수에 담겨진 함수는 null 처리를 할 수 있음
  fnByLambda = null;

  // 단, 정의된 함수를 변수에 담는 것은 제거하는 행위라고 볼 수 없음
  fnByLambda = fn;//담은 후
  fnByLambda = null;// null처리 한다고 해서 fn 함수가 제거되는 것은 아님. (연결고리만 끊어준 것)

  // 람다 연습용
  lambdaPractice();
}
// 밑의 fn함수를 람다식으로 선언한 것 (여기서는 전역화된 것까지 동일)
void Function(int p)? fnByLambda = (int p){ };

// 전역으로 정의된 함수
void fn(int p) {
  print("fn(int $p)");
}
void caller(
  void Function(int p) notNull,
  [ void Function(int p)? nullable = null ]
) {
  print("${nullable}");
  // 전달된 고차함수가 Nullable이 아닐 때 호출
  notNull(10);
  notNull.call(10);
  // 전달된 고차함수가 Nullable일 때 호출
  //nullable?(10); // 이렇게는 사용 불가
  nullable?.call(10);
}

void lambdaPractice() {
  // num 타입 : int 또는 double 타입 (num 타입을 상속 받은 타입)
  // 람다 기반 계산기
  num result = calculator(2,2.0);
  print(result);
}
num calculator(num operand1, num operand2) {
  final plus = (num operand1, num operand2) =>
    operand1 + operand2;

  final num Function(num operand1,num operand2) minus =
      (operand1, operand2) {
        return operand1 - operand2;
      };
  // 이렇게 하게 되면, dynamic Function(dynamic,dyanimc) 형식
  // final multiply = (operand1, operand2) =>
  num multiply(num operand1, num operand2) =>
    operand1 * operand2;

  final division = (num operand1, num operand2) {
    return operand1 / operand2;
  };
  return operator(
    operand1: operand1,
    operand2: operand2,
    onOperate: plus, // "변수명/함수명에 on 문자열이 붙으면, callback 함수다" 라는 것을 의미(관례)
  );
}

num operator({
  required num operand1,// 입력1
  required num operand2,// 입력2
  required num Function(
    num operand1,
    num operand2,
  ) onOperate,// 처리기
}) {
  // 초기화
  num result = 0;
  // 연산 : 연산이 필요한 시점에 onOperate를 호출해줌
  result = onOperate.call(operand1, operand2);

  // 리턴
  return result;
}
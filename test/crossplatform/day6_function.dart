/**
 * - 함수(Functions)
 *   일련의 코드를 별도의 모듈로 작성하는 코드
 *   (분리가 목표임)
 *
 * - 함수의 기본 구성
 *   선언 시
 *   반환타입 함수이름( 입력타입 입력이름, ... ) {
 *      ...
 *      [ return 값/변수명; ] // 얕은 복사
 *   }
 *
 *   호출 시
 *   반환타입 반환변수명 = 함수이름(값/변수, ...);
 *
 *   반환타입/입력타입 : 값의 유형에 따라 작성
 *   반환값이 없을 경우 : 반환타입 위치에 void로 작성
 *                      return문 작성은 옵션
 *   입력의 수 : 쓰고 싶은 갯수만큼 작성(무제한)
 *
 * - 매개변수(Parameter)
 *   입력값
 *   전달방식 3가지
 *     값 전달(Pass-by-value) : 기본형 전달 시 값을 복사해서 전달
 *                             값을 바꾸더라도 원본은 바뀌지 않음
 *     포인터 전달(Pass-by-pointer) : 객체 전달 시 메모리 상의 주소 전달
 *                                   포인터라는 것은 객체의 크기만큼 필요
 *                                   DART에서는 미지원
 *                          e.g. 객체의 크기가 100이라면, 포인터도 100 크기가 필요
 *                               전달 시 메모리 상의 주소 10번지에 있다면, 10번지와 크기가 전달됨
 *     레퍼런스 전달(Pass-by-reference) : 객체 전달 시 레퍼런스 주소 전달
 *                                      객체가 힙(Heap) 영역에 존재할 때, 특정한 주소(레퍼런스 주소)가 부여됨
 *                                      레퍼런스 주소 복사를 통해 전달 => 레퍼런스 주소 == 가명/별칭(Alias)
 *                                      값을 바꾸면 원본도 바뀜
 *   외부 효과(Side-Effect) : 호출한 함수에 객체를 전달하면, 레퍼런스 전달로 함수에 전달됨
 *                           -> 함수에서 전달된 객체의 값을 바꾸면, 원본 값도 바뀌어버림
 *                           -> 의도했든 안했든 별로 좋은 방식이 아님
 *
 * - 함수를 깨끗하게 작성하기(Clean) => 순수 함수(Pure function) 작성 => 몸체 작성
 *   1. 초기화 작성
 *   2. 연산 작성
 *   3. 콜백(Callback)이 있을 경우 호출
 *   4. 반환
 *
 * - 가변 갯수 파라미터(Dynamic number of Parameter)
 *   호출 시에 전달되는 파라미터를 보고서,
 *   파라미터를 동적으로 컴파일러가 알아서 추가해주는 기능
 *   전달되는 파라미터의 타입이 모두 같아야 함 + 여러 개 전달된 파라미터들은 배열로 묶여서 전달됨
 *   (DART 미지원 : 리스트 같은 자료구조로 전달하기)
 *
 * - DART에서 함수 연습할 때 해야할 것
 *   명칭형 파라미터에 익숙해질 것 - Flutter 에서 자주 사용됨
 *   마지막 파라미터 작성 후 컴마(`,`) 작성하는 것에 익숙해질 것 - 자동줄맞춤 기능 사용 시 유용
 *
 *
 */
void main(List<String> args) {
  int param = 30;
  // 함수 호출
  int value = plus(10, param); // 30
  dynamicNumberOfParameter(["A", "B", "C"]);
}

// 1. 문법적 부분 작성 하기 : void f() {}
// 2. 내용 채우기 : 입력값 결정, 반환값 결정 => 타입 결정
//                 함수 이름 결정 => 누가봐도 보면 바로 알 수 있게
//                 루틴 작성
//                 반환 시기 결정 => return 문
int plus(int src, int dest) {
  // 호출 시
  // 전달된 10 값은 src에 담겨있음
  // 전달된 param 변수는 dest에 담겨있음
  // 그러면... `dest = 50;` 이렇게 실행한다면? 바뀌지 않음, 값 복사 전달
  //

  // 인라인 연산 후 즉각 리턴
  // return src + dest;

  // 루틴 작성 후, 리턴 별도 작성 => 권장 => 디버깅 용이
  // 초기화
  int result = 0;
  // 연산
  result = src + dest;
  // 반환
  return result;
}

// 몸체 생략하기 : 작성할 코드가 한줄인 경우에만 사용 가능
int sub(int src, int dest) =>
    src - dest;

// 가변 갯수 파라미터
void dynamicNumberOfParameter(List<String> params) {
  for (int i = 0; i < params.length; i++) {
    // ... CODES ...
  }
}

// 위치형 파라미터
void positionedParameter(
  int essential,
  [
    int optional = 0, // 기본 값 0 사용
    int? nullable, // 기본 값 NULL 사용
  ]/* 아무것도 전달해주지 않을 경우 기본 값 사용 */
) {
  // optional 기본 값 사용
  // nullable 기본 값 사용
  namedParameter(10, labelEssential: 100);

  // 이런 경우는 아무 문제 없음
  namedParameter(10, optional: 10, nullable: 20, labelEssential: 100);

  // optional 값 전달 생략
  // 필수 값도 전달
  namedParameter(10, nullable: 20, labelEssential: 100);
}

// 명칭형 파라미터
void namedParameter(
  int essential,
  /* 명칭형 파라미터(Named Parameter) 사용 시 블럭 외부에 작성할 경우 DART 스타일이 아님 */
  {
    int optional = 0, // 기본 값 0 사용
    int? nullable, // 기본 값 NULL 사용
    required int labelEssential // 필수 값으로 요구
  }/* 아무것도 전달해주지 않을 경우 기본 값 사용 + 파라미터의 이름에 라벨(Label) 사용 */
) {
  // optional 기본 값 사용
  // nullable 기본 값 사용
  positionedParameter(10);
  positionedParameter(10, 10, 20);// 이런 경우는 아무 문제 없음
  positionedParameter(10, 0, 20);// optional 값만 기본으로 쓰고, nullable만 지정 불가

  outer();
  //inner(); // 불가능
}

// 외부 함수
void outer() {
  // 내부 함수 : 외부 함수 코드 블럭 내에서만 존재
  void inner() { /* ... */ }
  inner(); // 가능
}

/**
 * - 메모리 공간에 대한 이해 ( 영역 4가지 )
 * https://user-images.githubusercontent.com/49153756/95016525-769c2780-068e-11eb-9c04-22da6a232278.png
 * 스택(Stack) 영역 : 함수, 지역변수(함수 안에서 선언되는 변수), 잠시 사용되는 유형들 등 상주(임시 공간, 장기적 보관 X)
 * 힙(Heap) 영역 : 객체, 프로그래머가 임의로 선언한 변수 등 상주(임시 공간, 프로그래머가 삭제하기를 원할 때까지 장기 보관 O)
 *               => C언어 : free 함수 호출 시 제거
 *               => 현대언어 : GC를 통해 메모리 관리
 *                  JAVA 언어 : 가비지 컬렉터(Garbage Collector)가 제거 => NULL 처리
 *                             세대 관리(Generation)
 *                  DART 언어 : 가비지 컬렉터(Garbage Collector)가 제거 => NULL 처리
 *                             캐니 알고리즘(Caney's Algorithm) -> 스캐빈저(Scavenger)
 * 데이터(Data) 영역 : 전역 변수, 정적 변수 등 상주(프로그램이 종료될 때까지, 중간에 제거 불가)
 * 텍스트/코드(Text/Code) 영역 : 소스코드 상주(프로그램이 종료될 때까지, 중간에 제거 불가)
 *
 * - 변수의 생존 범위(Scope)
 * 전역 변수(Global Variable)
 * 외부 변수(External Variable)
 * 지역 변수(Local Variable)
 *
 * - 렉시컬 스코프/스태틱 스코프(Lexical Scope/Static Scope)
 * 모든 변수는 선언될 때 그 생존 범위가 이미 결정된다.
 */

void caller() {
  // fn == void Function(int) fn
  void Function(int x)? plus1 = func();
  void Function(int x)? plus2 = func();
  plus1(100); // local == 100 => 내부함수 변수마다 다른 공간을 가짐
  plus1(100); // local == 200 => 내부함수 변수마다 다른 공간을 가짐
  plus2(100); // local == 100 => 내부함수 변수마다 다른 공간을 가짐
  plus2(100); // local == 200 => 내부함수 변수마다 다른 공간을 가짐
  plus1 = null;// 이렇게해서 가비지 컬렉션이 잘 수행되도록 하면 문제 없음
  plus2 = null;// 이렇게해서 가비지 컬렉션이 잘 수행되도록 하면 문제 없음
}

// 전역 변수 : 프로그램이 종료될 때까지 존재 => 데이터 영역
int global = 10;
void Function(int x) func() {
  // 지역 변수 : 함수가 실행되는 동안 존재 => 스택 영역
  int local = 10;

  // 내부 함수
  void inner() {
    // 지역 변수 : 함수가 실행되는 동안 존재 => 스택 영역
    int innerLocal = 10;

    innerLocal = 0;
    local = 0; // 외부 변수 : 내부 함수에서 외부함수의 변수를 지칭하는 용어
    global = 0;
  }

  // innerLocal = 0; // 불가능
  local = 0;
  global = 0;

  // 내부 함수 : 외부 변수를 사용하지 않음
  int sub(int x, int y) {
    return x - y;
  }

  // 클로저(Closure) : 외부 변수를 사용 => 메모리 누수 가능성
  //                  잘 모르겠을 경우 외부 변수 사용 자제
  void plus(int x) {
    local += x; // 외부 변수 사용 => 변수 포착(Capture)
  }
  return plus;
}

/// - 린트(Lint)
///   프로그래머 코드 작성 > 문법을 틀릴 수 있음 > 체크하는 기능
///
///   언어 개발자가 린트에서 틀린 부분을 가리킬 수 있도록
///   특정한 메타 데이터(Meta data)를 넣어두고,
///   프로그래머가 빌드 직전에 코드를 체크하도록 해줌
///
///   우리는 아직 실행을 안했으니, 빌드를 안했는데요?
///   IDE에서 자동적으로 프로그래머가 작성을 마치면, 체크하도록 하고 있음

void fn(
  // 파라미터 시작은 항상 필수 값이 먼저!
  //{ namedOptional = 20 },

  // int essential = 0 // 필수 값인데, 기본 값(Default Value) 형태 사용 불가
  int essential,
  // [
  //   int optional, // 순서/위치형 파라미터에서는 기본 값 생략 불가
  // ]

  // 위치형 + 명칭형 형태는 사용 불가
  // { namedOptional = 20 },
  // [ int optional = 10 ]

  {
    typeOptionalByInference = 0, // 타입이 추론된 옵션 값
    int typedOptionalByUser = 0, //
    // required essentialValue = 0, // required 키워드 사용 시 기본 값 사용 불가
    // required 사용 시 호출 측에서 이 값에 파라미터를 넣도록 강제함

    required dynamicTypedEssential, // dynamic 타입
    required int typedEssential, // int 타입
  }
) {
  // dynamic 타입 : 아무 타입, 타입을 지칭하지도 않음

  // int 타입이라고 예상해야 되지만, dynamic은 타입에 자유로움
  dynamic dynamicVar = 10;
  dynamicVar = "10"; // 여기서는 이렇게 전혀 다른 타입을 할당하는게 이상하지 않음

  var inferVar = "10"; // 여기서 타입 결정되어버림
  //inferVar = 10; // 바꿀 수 없음

  // 타입이 지정되지 않았기 때문에(dynamic 타입 특성)
  // 문자열인지 알 수 없음 => 문자열 함수 호출 불가
  //dynamicVar.
  // var 키워드로 타입 추론을 했고, 타입이 결정되었기 때문에
  // 문자열인지 알 수 있음 => 문자열 함수 호출 가능
  //inferVar.length;

  /**
   * - 정적 타이핑 vs 동적/구조적 타이핑
   *   정적 타이핑 : 클래스명에 클래스 구분 의존
   *               (대부분 언어에서 구분하는 방법)
   *   동적/구조적 타이핑 : 클래스가 가진 멤버 존재 여부에 클래스 구분 의존
   *                     (JavaScript, TypeScript, ... 등 스크립트 언어들)
   * - 스크립트 vs 언어
   *   스크립트 : 인터프리터(Interpreter), 특정 구문을 읽어서 명령어 실행
   *   언어 : 컴파일되어서 기계어로 실행
   */

  // 정적 타이핑 형식으로 타입 확인
  // dynamic 키워드에 대한 타입 확인(상속 관계까지 같이 확인)
  if(dynamicVar is String) {
    dynamicVar.length;
  }

  // 정적 타이핑 형식으로 타입 확인
  // 타입이 정확히 String 타입인지 확인(상속 관계는 확인 안함)
  if(dynamicVar.runtimeType == String) {
    final str = dynamicVar as String;
  }

  // Kotlin/Swift 같은 트렌드에 맞춘 최신 언어들 문법 : DART에서는 안됨
  // final str = dynamicVar as? String;
  // var s = if(dynamicVar is String) {
  //   dynamicVar as String;
  // } else {
  //   null;
  // }

  // 구조적 타이핑 형식으로 타입 확인
  // 특정 함수를 포함하고 있는지 여부로 판단
  if(dynamicVar.length) {
     int s = dynamicVar.length;
  }

  // 위에처럼 코드를 작성하는 이유 : 리플렉션 기능 따라하기
  // 리플렉션 : 호출측에서 전달해준 객체의 코드를 유추하는 기능

  // Object 타입 : 최상위 타입
  // dynamic과의 차이 : dynamic은 타입이 무엇인지 모르는 상태 => 컴파일러가 타입 체크 안함
  //                   Object는 최상위 타입으로 바꿔놓은 것 뿐임 => 컴파일러가 타입 체크함
  Object objectVar = 10; // 최상위 타입
  objectVar = "10";
  // 타입을 체크하기때문에 dynamic처럼 함수 존재 여부 기능은 사용 불가
  // if(objectVar.length) {
  //   int s = objectVar.length;
  // }
}

void dynamicNumberOfParameter(List<String> arguments) {
  dynamicNumberOfParameter(["A", "B", "C"]);
}
void dynamicNumberOfParameterByMap(Map<String, String> arguments) {
  dynamicNumberOfParameterByMap({
    "Name1":"A",
    "Name2":"B",
    "Name3":"C"
  });
}
void main(){
  dynamicNumberOfParameter('a' as List<String>);

}
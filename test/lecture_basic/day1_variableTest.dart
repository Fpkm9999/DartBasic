///
/// - 코드 스타일(원 단어 e.g. hello world)
/// 낙타(Camel) 형식 : helloWorld - Dart 코드 선호 형식
/// 뱀(Snake) 형식 : hello_world - Dart 파일명 한정 선호 형식
/// - 코드 스타일2
/// K&R :
/// ```
/// if(...) {
/// }
/// else {
/// }
/// ```
///
/// ? : Dart 코드 선호 형식
/// if(...) {
/// } else {
/// }
/// - 코드 자동 포맷팅 (설정에 따라 다를 수는 있음)
/// 기본 : Ctrl + Alt + L
///
/// - 빌드 단계(코드 작성 단계 > 컴파일 > 링크 단계) > 실행 프로그램 전달
///   우리가 알아들을 수 있는 코드 작성
///   > 기계어로 변환
///   > (런타임으로 갈 때) 변환된 것 복사 ------- 컴파일 타임
///   > 사용자는 복사된 것을 실행해서 사용 => 런 타임
///
/// - 컴파일 타임 vs 런 타임
///
/// - 컴퓨터란?
///   연산 기계
///
/// - 컴퓨터의 각 부분
///   중앙 처리 장치(CPU : Central Processing Unit)
///      - 산술 논리 장치(ALU : Arithmetic Logical Unit) : 계산 전용
///      - 임시 기억 장치(Register)
///      - 프로그램 카운터(PC : Program Counter) : 실행줄번호 기억
///                                             중요 : 함수쯤 가면 더 중요
///      +@ MCU, ECU
///   주 기억 장치(Main Memory)
///      - CPU에서 계산된 것을 기억
///      - 휘발성 : 전기가 있을 때까지만 기억
///      - 성능 빠름
///      +@ RAM : Random Access Memory
///   보조 기억 장치(Secondary Memory)
///      - 영구적 기억
///      - 비휘발성 : 전기가 없어도 기억
///      - 하드디스크 : 물리적으로 녹이거나 복원하거나 하는 행위로 저장 - 암(Arm) 접근 시간 필요
///      - SSD 정적 저장 장치 : RAM과 유사하게 동작 - 전기에 의존 - 즉각 접근 가능
///      +@ HDD/SSD
///   그래픽 전용 CPU(GPU : Graphic Processing Unit)
///      - 화면 계산 전용
///      - ALU(+ 일부 메모리)만 부착되어있는 장치
///      +@ Graphic
///   네트워크 인터페이스 카드(NIC : Network Interface Card)
///      - 외부 통신 전용
///      - 무선은 언제든지 끊길 수 있음, 느림
///   기타 유선 통신 장치
///      - USB : 유선 시리얼 통신
///
/// - (모바일 전용) 일반적으로 모바일 장치에 들어있는 것들
///   센서 : 온도, 자기장(방향), GPS, UWB   +@ 가상 센서
///   통신 : Bluetooth(Classic/LE), NFC, Cellular, WiFi   +@ ZigBee
///         Ethernet
///   USB : 5 Pin, A/B/C-Type, 애플
///
/// - 프로그래머가 하는 일
///   CPU와 메모리를 다룰 수 있도록 코드를 작성하고 기계어로 번역하는 직업
///   (수학적인 내용을 알고 있어야 함)
///
/// - 단위
///   비트(Bit)? 전기가 한 번 들어왔다가 나감
///   8 Bit == 1 Byte
///   1024 씩 증가, Killo, Mega, Giga, Tera
///
/// - 2^5 = 32 bit / 2^6 = 64 bit
///   32 비트 컴퓨터 = 메모리 공간 사용량 = 숫자 표현 가능 범위
///   64 비트 컴퓨터 = 메모리 공간 사용량 = 숫자 표현 가능 범위
///
/// - 변수/상수
///   변수 : 변하는 수(수학적 정의) => 변하는 메모리 공간
///   상수 : 변하지 않는 수(수학적 정의) => 변하지 않는 메모리 공간
///
/// - 데이터 타입과 리터럴 값
///   정수 int : 기본 값 0
///   부동소수점 double : 기본 값 0.0
///   문자열/문자 String : 기본 값 ""
///   판별 bool : 기본 값 false
///
///   +@ 리터럴(Literal) : 고유한 값(상수)
///
/// - 늦은 초기화 - 비추천
///   late 키워드
///
/// - 널 가능(Nullable) - 추천
///   물음표(`?`) / 느낌표(`!`)
/// - 선언과 초기화 타이밍
///   선언 후 나중 초기화 - 널 가능 / 늦은 초기화
///   선언과 동시에 초기화 - 기본 값을 주기
void main() {
  // 변수
  // 타입 추론(Type inference) 방식으로 정의) : 누가 봐도 이 타입이 될 때
  var varInteger1 = 0;

  // 타입 애노테이션(Type annotation) 방식으로 정의 - 추천
  int varInteger2 = 0;

  // 상수
  // 런타임 상수 - 타입 추론 방식으로 정의
  final runTimeConstant1 = 0; // int로 타입 추론이 됨
  // 런타임 상수 - 타입 애노테이션 방식으로 정의
  final int runTimeConstant2 = 0;

  // 컴파일타임 상수 - 타입 추론 방식으로 정의
  const compileTimeConstant1 = 0;
  // 컴파일타임 상수 - 타입 애노테이션 방식으로 정의
  const int compileTimeConstant2 = 0;

  // 비추천
  late int l;
  // l.bitLength;

  // 널 가능한 변수
  int? s = null; // null;
  print(s);

  // 방법1. 호출전에 NULL 인지 아닌지 검사
  s?.bitLength;
  print(s?.bitLength);
  int? intValue1 = 10;
  print(intValue1.bitLength); // int 자료형을 저장하기 위한 최소 비트수

  // 방법2. 호출전에 NULL 인지 아닌지검사
  if (s != null){
    s.bitLength;
  }
   // 방법3. 연속적으로 NUllable 변수 사용하는 경우
  if (s != null){
    s.bitLength;
    s.isEven;
    s.isEven;
  }
  // 방법1. Nullable 일 떄 초기 값 주는 방법 (아래처럼 변환됨)
  s?.bitLength ?? 0;
  // 방법2. Nullable 일 때 초기값 주는 방법
  if (s != null){
    // 이런 식으로 늘상 사용하는 코드 : 보일러플레이트 코드
    s.bitLength;
  } else {
    0;
  }

  // 데이터 타입 + 리터럴 값 테스트
  var integer1 = 0;
  int integer2 = 0;

  //var floating1 = 0;// 기대한 타입 : double > 결정된 타입 : int
  var floating1 = 0.0;
  double floating2 = 0; // 기대한 타입 : double > 결정된 타입 : double

  var chars1 = "";
  String chars2 = "";

  var boolean1 = true;
  bool boolean2 = false;
}

/// - 액세서(Accessor)
///  : 다트에서 액세서(Accessors)는 클래스의 멤버 변수에 대한 접근을 제어하는 메커니즘.
///   외부에서 내부 멤버변수(private member)에 접근할 수 있도록 제공
///   TIP. 전부 그냥 공용 멤버변수(public member)로 하면 안되나요?
///        내가 의도한대로 명확하게 동작하려면, 외부의 간섭 최소화 필요
///
///   접근자(Getter)/설정자(Setter) 두개로 나뉨
///       +@ private member(`_`)
///       +@ 행동에 대한 추가 기능 제공 가능
///
/// - 속성(Property)
///   내부 변수 + 액세서 결합
///
/// - 스마트 캐스팅(Smart Casting)
///   묵시적으로 특정 타입으로 변환해주는 기능
///   dynamic > [타입] 변환
class Building {
  // 생성자를 통해 초기화

  Building({
    required int window,
  }): _window = window, _observer = null;
  // : 는 초기화 리스트
  int? _window; // 생성자를 통해 값 저장

  // JAVA 예시에서의 접근자(Getter)/설정자 => 보일러플레이트 코드 : get~, set~
  // 호출 시 `building.getWindow()` / `building.setWindow(10)` => 함수 호출하는 느낌
  // int getWindow() {
  //   return _window;
  // }
  // void setWindow(int newValue) {
  //   _window = newValue;
  // }

  // 액세서 - 접근자 : 값을 배출하는 일
  // 호출 시 `int window = building.window` => 변수를 호출하는 느낌
  //
  // 형태1. 단순 값 반환하고 싶을 때 => 축약문
  //int get window => _window ?? 0;
    // get windows로 불러오는데 _window 가 null 이면 0 반환
  // 형태2. 반환 전후에 어떤 처리를 병행하고 싶었을 때 => 몸체 필요
  int get window {
    int result = 0;
    // -값 반환 전 처리
    // 내부 멤버가 NULL이거나, 가져오기 직전에 처리
    // => 함수 호출 등을 할 수 있음

    result = _window ?? result;
    // -값 반환 직전 처리
    // 값 반환 전 가공 e.g. 다른 타입으로의 변환 등
    // _window가 null 이 아니라면 result에 넣음,
    // _window가 null 이면 result 현재 값을 유지(0임)
    return result ;
  }
  // _window 필드의 값을 문자열로 반환하는 접근자(getter)를 정의.
  String get windowAsString {
    int window = _window ?? 0;
    // null 이 아니라면 window에 저장사용
    // 타입 변환
    String result = window.toString();
    return result;
  }

  // 액세서 - 설정자 : 값을 설정하는 일
  // 호출 시 `building.window = 10` => 변수를 호출하는 느낌

  // _window 필드에 새로운 값을 설정하는 설정자(setter)를 정의
  // 형태1. 단순 값 설정하고 싶을 때 => 축약문
  //set window(newValue) => this._window = newValue;
  // 형태2. 설정 전후에 어떤 처리를 병행하고 싶었을 때 => 몸체 필요
  set window(newValue) { // == void set window(newValue)
    // 원하는 값이 아닐 때 중단 처리
    if(newValue <= 0) {
      return;
    }

    // -값 설정 전 처리
    // -값 변경 확인
    // 새로운 값(newValue)이 _window 필드의 값과 다른지 확인한다.
    // 값이 변경되었는지 여부를 isChanged에 불린값으로 저장
    bool isChanged = newValue != this._window;

    if(isChanged) { // 값이 변경되었으면 true이므로 newValue값을 _window 에 할당한다.
      this._window = newValue;
    }
    // -값 설정 후 처리

    // -값 변경이 되었을 때 콜백 처리
    if(isChanged) {
      notify();
    }
    /*
        값이 변경되었다면 notify() 메소드를 호출하여 관련된 처리를 수행합니다.
        이는 옵저버 패턴의 일부로, 값 변경을 다른 객체에 알릴 수 있습니다.
     */
  }

  // 응용 : window 값이 변경되었을 때 듣는 객체
  Observer? _observer; // Observer? 타입의 _observer 선언
  Observer? get observer => _observer;
  set observer(newValue) => _observer = newValue;

  void notify() { // setter에서 사용됨. 값이 바뀔때 호출당함
    // 자기자신의 접근자 호출 => 가공된 최종 값을 받을 수 있음
    this._observer?.notify(window);
  }
}

// 옵저버 패턴
class Observer {
  Observer({ required this.onNotify });
  final void Function(int value) onNotify;
  void notify(int value) {
    onNotify(value);
  }
}

void main() {
  Building building = Building(window: 100);
  // window 값이 바뀌는 것에 대한 것만 관심있는 객체
  Observer observer = Observer(onNotify: (int value) {
    // 값이 바뀌었을 때만 이 메소드가 호출될 것임
    // 그 시점에 같이 처리가 필요한 사항들
    print(value);
  });
  building.observer = observer;
  //building._window = 10;// 클래스의 파일이 달라지면, 안보임(private)

  // set window(newValue) 호출함
  building.window = 10;

  // int get window 호출함
  int window = building.window;
  print(window);

  // String get windowAsString 호출함
  String windowString = building.windowAsString;
}
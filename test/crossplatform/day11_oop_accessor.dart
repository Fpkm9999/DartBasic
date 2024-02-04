/**
 * - 액세서(Accessor)
 *   외부에서 내부 멤버변수(private member)에 접근할 수 있도록 제공
 *   TIP. 전부 그냥 공용 멤버변수(public member)로 하면 안되나요?
 *        내가 의도한대로 명확하게 동작하려면, 외부의 간섭 최소화 필요
 *
 *   접근자(Getter)/설정자(Setter) 두개로 나뉨
 *       +@ private member(`_`)
 *       +@ 행동에 대한 추가 기능 제공 가능
 * 
 * - 속성(Property)
 *   내부 변수 + 액세서 결합
 * 
 * - 스마트 캐스팅(Smart Casting)
 *   묵시적으로 특정 타입으로 변환해주는 기능
 *   dynamic > [타입] 변환
 */
class Building {
  Building({
    required int window,
  }): _window = window, _observer = null;

  int? _window;

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
  // 형태2. 반환 전후에 어떤 처리를 병행하고 싶었을 때 => 몸체 필요
  int get window {
    int result = 0;
    // -값 반환 전 처리
    // 내부 멤버가 NULL이거나, 가져오기 직전에 처리
    // => 함수 호출 등을 할 수 있음
    result = _window ?? result;
    // -값 반환 직전 처리
    // 값 반환 전 가공 e.g. 다른 타입으로의 변환 등
    return result ;
  }
  String get windowAsString {
    int window = _window ?? 0;
    // 타입 변환
    String result = window.toString();
    return result;
  }

  // 액세서 - 설정자 : 값을 설정하는 일
  // 호출 시 `building.window = 10` => 변수를 호출하는 느낌
  //
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
    bool isChanged = newValue != this._window;

    this._window = newValue;
    // -값 설정 후 처리

    // -값 변경이 되었을 때 콜백 처리
    if(isChanged) {
      notify();
    }
  }

  // 응용 : window 값이 변경되었을 때 듣는 객체
  Observer? _observer;
  Observer? get observer => _observer;
  set observer(newValue) => _observer = newValue;
  void notify() {
    // 자기자신의 접근자 호출 => 가공된 최종 값을 받을 수 있음
    this._observer?.notify(window);
  }
}

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

/*
todo 옵저버 패턴에 대해 배워라

 */
import 'package:flutter/material.dart';
// ignore_for_file: slash_for_doc_comments

/**
 * ===========================================================
 * fileName       : day11
 * date           : 2024-02-03
 * description    :
 * - DART에서의 함수 오버로딩 유사 구현 :
 *
 *
 *
 * DART에서는 둘ㄷ ㅏ지원 안함
 * - 중첩클래스 : 외부 클래스 멤버 변수에 접근 불가
 * - 내부 클래스 : 외부 클래스 멤버 변수에 접근 가능
 *  >>> 이것조차 혼동이 올 수 있기 떄문에 그럼
 * ===========================================================
 */

/*
  - 액세서(Accessor)
    외부에서 내부 멤버변수(private member) 에 접근할 수 있도록 제공
    TIP. 전부 그냥 공용멤버변수(public member)로 하면 안됨?
    >>> 내가 의도한대로 명확하게 동작하려면, 최대한의 외부적 값 변경을 최소화 해주는게 좋음. => 외부의 간섭 최소화
    필요한 곳에만 값을 오픈하겠다.

    액세서는 그래서
    (접근자)Getter/ (설정자)Seter 라고도함.
    액세서는 여기서 +a 로 private member('_') 포함해서 한세트라 보면됨.
    +a 해옫ㅇ에 대한 추가 기능 제공 가능

    -속성 (property)
    내부변수 + 액세서 결합

    - 스마트 캐스팅(smart casting)
      묵시적으로 특정 타입으로 변환해주는 기능
      dynamic -> [타입] 변한

 */
class Building {
  // 생성자를 통해 초기화
  Building({required int window}) : _window = window;

  // 무조건 값을 주도록
  int? _window = 0;

  // 액세서 - 접근자 : 값을 외부에 제공 하는게 주 목표
  // 형태1. 단순 값 변환 => 축약문
  int get Window => _window ?? 0; // 축약형

  // 형태2. 반환 전후에 어떤 처리를 병행하고 싶었을 때 => 몸체 필요
  int get windows {   // 가장 기본적인 형태
    int result = 0;
    // 값 반환 전에 가공을 할 수있도록 한 형태
    // 내부 멤버가 NULL 이거나, 가져오기 직전에 처리
    // => 함수 호출 등을 할 수 잇음
    result = _window ?? result;
    // 값 반환 전 가공 e.g 다른 타입으로의 변환 등
    return result;
  }
  String get windowsAsString {
    int window = _window ?? 0;
    // 멤버 변수의 타입 변환
    String result = window.toString();
    return result;
  }
  // 액세서 - 설정자 : 값을 설정하는 게 주 목표
  // 호출 시 'buliding.windows' => 변수를 호출하는 느낌
  set windows(newValue) { // 반환타입이 없으면 void set windows(newValue) 와 같음  // 여기는 스마트 캐스팅으로 알아서 타입을 지정해줌

    // 원하는 값이 아닐 때 중단 처리
    if(newValue <= 0){

      return;
    }
    // 설정 전 처리
    // 값 설정 후 처리
    // - 값 변경이 되었을 때 콜백 처리가 가능하다 여기서
    // if(newValue != this._window){
    //   notify();
    // }
    this._window = newValue; // todo newValue 타입이 없으면  dynamic

  }
    // dart는 set,get~~ 으로 하는것보다 building.windows=4; 처럼 직접 변수에 값을 대입하는것처럼 보이게 함 get set 을
  // void notify(){
  //   this.listener.notify();
  // }
}
/*
  todo 보일러플레이트 코드
 */



void main() {
  Building building = Building(window: 100);
  building._window = 10;  // 지금은 언더라인이 보이는데 클래스 파일이 달라지면, 안보임(private 특성임)  // set호출해준거임  // set window() 호출함
  print(building._window);

  int windows = building.windows; // int get window 호출함
  print(windows);

  // String get building 호출함
  String windowString = building.windowsAsString;
}
// todo  obserber
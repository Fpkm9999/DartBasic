/// ===========================================================
/// fileName       : function00
/// date           : 2024-02-17
/// description    :
/// Parameter란
/// Dart 프로그래밍 언어에서 파라미터(매개변수)는 함수나 메서드를 정의할 때 사용되며,
/// 이를 통해 외부로부터 값을 받아 해당 함수나 메서드 내에서 사용할 수 있다.
///
/// Dart에서는 다양한 종류의 파라미터를 지원하며, 이를 통해 함수의 유연성과 재사용성을 높일 수 있습니다.
/// ===========================================================

// 1. 필수 파라미터(Required Parameters)
// 필수 파라미터는 함수를 호출할 때 반드시 제공해야 하는 파라미터입니다.
// Dart에서는 함수나 메서드의 정의에서 파라미터를 나열함으로써 필수 파라미터를 지정할 수 있습니다.
void greet(String name) {
  print('Hello, $name!');
}

// 2. 선택적 위치 파라미터(Optional Positional Parameters)
// 선택적 위치 파라미터는 대괄호([])로 묶어서 정의하며,
// 이를 통해 함수 호출 시 해당 파라미터를 생략할 수 있습니다.
void greet2(String name, [String? suffix]) {  //  [String? suffix] 은 생략이 가능하다.
  if (suffix != null) {
    print('Hello, $name $suffix');
  } else {
    print('Hello, $name');
  }
}

// 3. 이름 있는 파라미터(Named Parameters)
// 이름 있는 파라미터는 중괄호({})로 묶어서 정의하며,
// 함수를 호출할 때 파라미터의 이름을 명시하여 값을 전달할 수 있습니다.
// 모든 이름 있는 파라미터는 기본적으로 선택적입니다.
void greet3({String? name, String? suffix}) { // named parameter 는 옵셔널 포지셔널 파라미터처럼 선택적이다.
  if (name != null) {
    print('Hello, $name ${suffix ?? ''}');
  } else if (suffix != null){
    print('Hello, $suffix');

  }
}

// 4. 필수 이름 있는 파라미터(Required Named Parameters)
//
// Dart 2.12부터는 `required` 키워드를 사용하여 이름 있는 파라미터를 필수로 만들 수 있다.
// 이렇게 하면 호출자가 해당 파라미터를 생략할 수 없습니다.
void greet4({required String name, String? suffix}) {
  print('Hello, $name ${suffix ?? ''}');
}

// 5. 기본값을 가진 파라미터(Default Parameter Values)
//
// 함수의 파라미터는 선택적으로 기본값을 가질 수 있으며, 이는 호출 시 해당 파라미터가 생략되었을 때 사용됩니다. 기본값은 = 연산자를 사용하여 지정할 수 있습니다.
void greet5(String name, {String suffix = '님'}) {
  print('Hello, $name$suffix');
}

// 파라미터 사용 예시
void main() {
  greet('John'); // "Hello, John!"
  greet2('John', 'Doe'); // "Hello, John Doe" (선택적 위치 파라미터 사용)
  greet3(name: 'John', suffix: 'Doe'); // "Hello, John Doe" (이름 있는 파라미터 사용)
  greet3(name: 'John'); // "Hello (이름 있는 파라미터 사용)
  greet3(); // "Hello (이름 있는 파라미터 사용)
  greet4(name: 'John'); // "Hello, John " (필수 이름 있는 파라미터 사용)
  // Dart에서 파라미터를 사용하는 방법은 매우 다양하며, 이를 통해 함수와 메서드를 더 유연하고, 읽기 쉽게 만들 수 있습니다.
  greet5('JohnSep');
}

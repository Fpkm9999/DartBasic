void main() {
  // variable
  var name = '갤럭시 S24';
  print(name);

  var antennaDiameter = 3.7;
  print(antennaDiameter);

  name = '플러터 프로그래밍'; // 값을 변경
  print(name);

  // 코드는  위에서 아래로 순서대로 실행된다.
  // 안되는거
  // var name = 'fpkm999';
  /*
  ERROR : 이미 위에서 선언한 동일한 변수를 선언할 수 없다.
  The name 'name' is already defined. (Documentation)
  The first definition of this name (basic01.dart:3).
   Try renaming one of the declarations.
   */

  // 변수 타입
  // 정수
  // integer
  int number1 = 10;
  // int number_ = '10'; // 이런 문자열 10이다.
  print(number1);
  int number2 = 15;
  print(number2);
  int number3 = -20;
  print(number3);
  int number4 = 2;
  int number5 = 4;

  print(number4 + number5); // 6
  print(number4 - number5); // -2
  print(number4 / number5); // 0.5
  print(number4 * number5); // 8
  print(number4 % number5); // 2

  // 실수
  // double
  double number6 = 2.5;
  double number7 = 0.5;
  print(number6 + number7); // 3.0
  print(number6 - number7); // 2.0
  print(number6 / number7); // 5.0
  print(number6 * number7); // 1.25
  print(number6 % number7); // 0.0

  // 맞다 / 틀리다
  // Boolean
  bool isTrue = true; // 'true'는 글자 true. 이건 불린값 true // true
  bool isFalse = false; // false

  print(isTrue);
  print(isFalse);

  // 글자 타입
  // String

  String name2 = '구글크롬';
  String name3 = '코드팩토리';

  print(name2);
  print(name3);

  // var String
  var name4 = '블랙핑크'; // 컴파일러가 자동으로 타입을 유추해줌  // Type: String
  var number8 = 20; // Type: int

  print(name4.runtimeType); // String
  print(number8.runtimeType); // int

  // 실제로 var 라는 타입은 존재하지 않음

  Map<String, Map<int, List<double>>> testType = {};
  var testType1 = {}; // 위 코드와 동일하다.
  // 이럴 때는 var 사용하는게 좋음.
  // 왠만하면 타입을 명시해주는게 좋음

  print(name2 + name3); // 글자 사이에 + 연산자만 올 수 있다.
  print(name2 + ' ' + name3);

  //print 안에 변수 사용
  print('${name2} ${name3}'); // 기본형태
  print('$name2 $name3'); // 생략가능함. // 변수 1개만 쓴다면사용가능
  print('${name2.runtimeType} ${name3}'); // 괄호안에 넣어야지 가능
  print('$name2.runtimeType $name3'); // 이렇게 하면 그냥 글자로 인식한다.

  // 다이나믹 dynamic
  dynamic name5 = '코드팩토리'; // 다이나믹도 var처럼 아무거나 올 수 있다.
  print(name5);
  dynamic intValue = 1;
  print(intValue);

  var strVar1 = '블랙핑크';
  print(strVar1);

  // 둘의 차이점
  print(name5.runtimeType); // String
  print(strVar1.runtimeType); // String

  name5 = 2; // 다이나믹은 추후 타입변환됨  // 타입변환이 자유로움
  // strVar1 = 5; var타입은 한번 선언하면 선언한 타입으로 고정된다.
  name5 = 5; // 가능 var 타입은 못함
  print(name5);

  print(name5.runtimeType); // int
  print(strVar1.runtimeType); // String

  // nullable - null이 될 수 있다.
  // non-nullable - null이 될 수 없다.
  // null - 아무런 값도 있지 않다.
  String name6 = '코드팩도리';
  print(name6);
  // name6 = null; // null이 들어갈 수 없는 String 타입인데 null을 넣으려고 해서 오류뜸

  String? name7 = '코드팩토리';
  name7 = null;
  print(name7);

  // 반대로 절대로 null 이 아니라고 해주는 것은 !
  String? name8 = '코드팩토리';
  print(name8!); // 느낌표를 넣으면 해당 변수는 절대 null 이 아니라는 의미
  // nullable 변수에 !를 붙이면 현재 이 변수는 null 이 아니라는 의미가 됨

  // final, const
  final String name9 = '코드팩토리';
  print(name9);
  // name9 = '갤럭시';  // final 로 선언하면 변수의 값을 한번 선언 한뒤로 변경 불가

  const String name10 = '코드팩토리';
  print(name10);
  // name9 = '갤럭시'; // const 로 선언하면 변수의 값을 한번 선언 한뒤로 변경 불가

  // final, const 는 타입도 생략이 가능함
  final name11 = '코드팩토리';
  print(name11);

  const name12 = '갤럭시S24';
  print(name12);

  // final, const의 차이를 알기 전에 DateTime을 알아야함

  DateTime now = DateTime.now();
  print(now); // Run을 하고 DateTime.now() 코드가 실행될 때의 시간이 저장됨

  final DateTime now2 = DateTime.now(); // final 은 됨
  print(now2);

  // const DateTime now3 = DateTime.now(); // const 는 오류
  // const 타입의 경우 빌드 타임의 값을 알고 있어야 함
  // 반대로 final 의  경우 빌드 타임의 값을 알고 있지 않아도 된다.

  // Operator
  int number9 = 2;

  print(number9);
  print(number9 + 2);
  print(number9 - 2);
  print(number9 * 2);
  print(number9 / 2);

  print('------------------');
  print(number9 % 2);
  print(number9 % 3);

  print(number9);
  print('------------------');
  number9++; // number9 ++을 하고 출력 하니까 1이 더해짐

  print(number9);

  number9--;
  print(number9);

  double number10 = 4.0;
  print(number10);

  number10 += 1;
  print(number10);
  number10 -= 1;
  print(number10);

  number10 *= 2;
  print(number10);
  number10 /= 2;
  print(number10);

  // null
  double? number11 = 4.0;
  print(number11);

  number11 = 2.0;
  print(number11);

  number11 = null;

  print(number11);

  number11 ??= 3.0; // ?? : 해당 변수가 `null`이면 오른쪽 값으로 바꿔라라는 뜻
  print(number11);

  print('------------');
  int number12 = 1;
  int number13 = 2;

  print(number12 > number13);
  print(number12 < number13);
  print(number12 >= number13);
  print(number12 <= number13);
  print(number12 == number13);
  print(number12 != number13);

  int number14 = 1;
  print('111');
  print(number14 is int);
  print(number14 is String);

  print(number14 is! int); // !믐 not
  print(number14 is! String);

  // && - and 조건
  // || - or 조건

  bool result = 12 > 10 && 1 > 0;
  print(result);
  bool result2 = 12 >10 && 0 >1;
  print(result2);

  bool result3 = 12 > 10 || 1 > 0;

  print(result3);

  bool result4 = 12 > 10 || 0 > 1;

  print(result4);

  bool result5 = 12 < 10 || 0 > 1;

  print(result5);

  // 컬렉션
  // List
  // 리스트
  List<String> blackPink = ['제니','지수','로제','리사'];
  List<int> numbers = [1,2,3,4,5];
  print(blackPink);
  print(numbers);

  // 원하는 값 가져오기
  // index
  // 순서
  // 0부터 시작
  print(blackPink[0]);
  print(blackPink[1]);
  print(blackPink[2]);
  print(blackPink[3]);
  // print(blackPink[4]); // Invalid value: Not in inclusive range 0..3: 4

  print(blackPink.length);
  print(blackPink.runtimeType);
  blackPink.add('코드팩토리');
  print(blackPink);
  blackPink.remove('코드팩토리');
  print(blackPink);
  print(blackPink.indexOf('로제')); // 2

  // Map
  // Key / Value
  Map<String, String> dictionary = {
    'Harry Potter' : '해리포터',  // Key, Value
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저',
  };
  print(dictionary);

  Map<String,bool> isHarryPotter = {
    'Harry Potter' : true,
    'Ron Weasley' : true,
    'Ironman' : false,
  };
  print(isHarryPotter);

  isHarryPotter.addAll({
    'Spiderman' : false,
  });
  print(isHarryPotter);

  print(isHarryPotter['Ironman']);  // 원하는 Key 값을 입력해 value 반환

  isHarryPotter['Hulk'] = false; // 이런식으로도 추가가 가능함.
  print(isHarryPotter);

  isHarryPotter['Spiderman'] = true;
  print(isHarryPotter);

  // 삭제 하는 법
  print(isHarryPotter);
  isHarryPotter.remove('Harry Potter');
  print(isHarryPotter);

  print(isHarryPotter.keys);  // 키만 가져오기
  print(isHarryPotter.values); // 값만 가져오기

  // Set - 중복 처리
  final Set<String> names5 = {
    'Code Factory',
    'Flutter',
    'Black Pink',
    'Flutter',
  };
  print(names5);
  print('112');
  names5.add('Jenny');
  print(names5);

  names5.remove('Jenny');
  print(names5);

  print(names5.contains('Flutter'));  // true




  int x = 10;
  int fromDouble = 10.1234.toInt();
  double y = 15.4321;
  double fromInt = 10.toDouble();

  print(x);
  print(fromDouble);
  print(y);
  print(fromInt);
}

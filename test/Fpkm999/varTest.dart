void main(){
  var name = '갤럭시 S24';
  var year = 2024;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(name);
  print(year);
  print(antennaDiameter);
  print(flybyObjects);
  print(image);

  print('================');
  // 정수
  // integer
  int number1 = 10;
  print(number1);

  int number2 = 15;
  print(number2);
  int number3 = -20;
  print(number3);
  print('================');
  int number4 = 2;
  int number5 = 4;

  print(number4 + number5);
  print(number4 - number5);
  print(number4 / number5);
  print(number4 * number5);
  print(number4 % number5);

  print('================');
  // 실수
  // double
  double number6 = 2.5;
  double number7 = 0.5;
  print(number6 + number7);
  print(number6 - number7);
  print(number6 / number7);
  print(number6 * number7);
  print(number6 % number7);

  print('================');
  // 맞다 / 틀리다
  // Boolean
  bool isTrue = true; // 'true'는 글자 true. 이건 불린값 true
  bool isFalse = false;

  print(isTrue);
  print(isFalse);

  print('================');
  // 글자 타입
  // String
  String name2 = '레드벨벳';
  String name3  = '코드팩토리';

  print(name2);
  print(name3);

  print('================');
  // var String
  var name4 = '블랙핑크';
  var number8 = 20;

  print(name4.runtimeType);
  print(number8.runtimeType);

  Map<String, Map<int, List<double>>> testType = {};
  var testType1 = {}; // 위 코드와 동일하다.

  print('================');
  // 글자 타입
  // String
  print(name2+name3); // 글자 사이에 + 연산자만 올 수 있다.
  print(name2+' '+name3);

  //print 안에 변수 사용
  print('${name2} ${name3}');
  print('${name2.runtimeType} ${name3}');
  print('$name2.runtimeType $name3'); // 이렇게 하면 그냥 글자로 인식한다.

  print('================');
  // 다이나믹 dynamic
  dynamic name5 = '코드팩토리';  // 다이나믹도 var처럼 아무거나 올 수 있다.
  print(name5);
  dynamic intValue = 1;
  print(intValue);
  var strVar1 = '블랙핑크';
print(strVar1);
  // 둘의 차이점
  print(name5.runtimeType);
  print(strVar1.runtimeType);

  name5 = 2;  // 다이나믹은 타입변환됨  // 타입변환이 자유로움
  // strVar1 = 5; var타입은 한번 선언하면 선언한 타입으로 고정된다.

  int x = 10;
  int fromDouble = 10.1234.toInt();
  double y = 15.4321;
  double fromInt = 10.toDouble();

  print(x);
  print(fromDouble);
  print(y);
  print(fromInt);
}
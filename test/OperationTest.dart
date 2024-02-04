void main() {
  int number = 2;
  print(number);
  print(number + 2);
  print(number - 2);
  print(number * 2);
  print(number / 2);
  print(number % 2); //2를 2로 나누면 몫은 0
  print('-----------------------');
  print(number % 3);

  print(number); // 값은 변하지않았음
  print('----------------------');
  number++;
  print(number);
  number--;
  print(number);

  double number2 = 4.0;
  print(number2);
  number2 += 1;
  print(number2);
  number2 -= 1;
  print(number2);

  number2 *= 2;
  print(number2);

  // null 조건 연산자
  double? number3 = 4.0;
  print(number3);
  number3 = 2.0;
  print(number3);
  number3 = null;
  print(number3);

  number3 ??= 3.0; // 만약 number 값이 값이 널이면 오른쪽 값으로 바꿔라 // null 이 아니면 바꾸지 않음
  print(number3);

  //
  int value1 = 1;
  int value2 = 2;
  print(value1 > value2);
  print(value1 < value2);
  print(value1 >= value2);
  print(value1 <= value2);
  print(value1 == value2);
  print(value1 != value2);

  // 타입 비교
  int number4 = 1;
  print(number4 is int);
  print(number is String);

  print(number4 is! int);
  print(number4 is! String);

  bool result = 12 > 10 && 1 > 0;
  print(result);

  bool result2 = 12 > 10 && 0 > 1;
  print(result2);

  bool result3 = 12 > 10 || 1 > 0;
  print(result3);

  bool result4 = 12 > 10 || 0 > 1;
  print(result4);

  bool result5 = 12 < 10 || 0 > 1;
  print(result5);


}

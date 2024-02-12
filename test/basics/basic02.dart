// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : basic02
 * date           : 2024-02-11
 * description    :
 * ===========================================================
 */
void main() {
// if 문

  int number = 2;

  if (number % 2 == 0) {
    print('값이 짝수입니다.');
  } else {
    // if 문이 맞지 않는 경우
    print('값이 홀수입니다.');
  }

  int number2 = 3;
  if (number2 % 3 == 0) {
    print('나머지가 0입니다.');
  } else if (number % 3 == 1) {
    print('나머지가 1입니다.');
  } else {
    print('나머지가 2입니다.');
  }
  // switch 문
  int number3 = 3;
  switch (number3 % 3) {
    case 0:
      print('나머지가 0입니다.');
      break;
    case 1:
      print('나머지가 1입니다.');
      break;
    default:
      print('나머지가 2입니다.');
      break;
  }
  // for loop
  for (int i = 0; i < 10; i++) {
    print(i);
  }
  int total = 0;
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  for (int i = 0; i < numbers.length; i++) {
    total += numbers[i];
  }
  print(total);
  for (int number in numbers) {
    print(number);
  }
  total = 0;
  for (int number in numbers) {
    total += number;
  }
  print(total);

  // while loop
  total = 0;
  while (total < 10) {
    total += 1;
  }
  print(total);

  total = 0;
  do {
    total += 1;
  } while (total < 10);
  print(total);

  total = 0;
  while (total < 10) {
    total += 1;
    if (total == 5) {
      break;
    }
  }
  print(total);

  total = 0;
  for (int i = 0; i < 10; i++) {
    total += 1;
    if (total == 5) {
      break;
    }
  }
  print(total);

  print('============');
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    print(i);
  }

}

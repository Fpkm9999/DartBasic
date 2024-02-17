import 'dart:math';

void main() {
  multiplicationTables(3);

  int nextValueFromSequential = inferNextNumber([ 1,2,3,4 ]);
  int nextValue = inferNextNumber([ 2,4,8 ]);

  addFractions(1,2,3,4); // 1/2 + 3/4 = ?
  addFractions(9,2,1,3); // 9/2 + 1/3 = ?
}

void multiplicationTables(int n) {
  // 함수에 특정 N단을 지정해주면 N단을 출력하는 함수를 작성
  // 9개 호출해서, N단 출력 (2~9단까지만 입력 가능)
  // e.g. 2단 => 2x1 ~ 2x9까지 출력
  //            2x1=2  2x2=4  ...  2x9=18

  // 2~9단 범위 잡기 1. 범위를 벗어나면 함수를 중단시키는 방법 => if + return
  //                  반환이 있다면? 결과물이 될 수 없는 값을 반환
  //                               (불가사의한 값)
  if(n < 2 || n > 9) {
    return;
  }

  // 2~9단 범위 잡기 2. 어쨌든 무조건 동작을 시키는 방법 => min()/max()
  //                  값 < 최소 값 ? 최소 값으로 지정
  //                  값 > 최대 값 ? 최대 값으로 지정
  int rangeN = max(min(n, 9), 2);

  // 구구단 중 N단 출력
  String mulStr = "";
  for(int i = 1; i <= 9; i++) {
    mulStr += "$mulStr  ${rangeN}x$i=${rangeN*i}";
  }
  print(mulStr);
}

int inferNextNumber(List<int> values) {
  // 함수에서 마지막 원소 다음으로 올 숫자를 유추해서
  // 결과물을 반환하며, 출력하시오. => 함수, 리스트 활용
  // [ 1,2,3,4 ] = ?
  // [ 2,4,8 ] = ?
  // 숫자의 규칙성 : 등차/등비 수열
  bool isSequential =
      (values[0] - values[1]).abs()
          == (values[1] - values[2]).abs();

  int base = isSequential ?
  (values[1] - values[0]).abs() :
  (values[1] ~/ values[0]);

  return isSequential ? values.last + base : values.last * base;
}

List<int> addFractions(
  int numer1,// 분자1
  int denom1,// 분모1
  int numer2,// 분자2
  int denom2,// 분모2
) {
  // 기약분수 덧셈

  // 기약분수가 무엇인가?
  // 어떻게 덧셈을 하는지?
  // 계산결과 값 리턴!

  // 최대 공약수 계산
  // 유클리드 호제법 : https://ko.wikipedia.org/wiki/%EC%9C%A0%ED%81%B4%EB%A6%AC%EB%93%9C_%ED%98%B8%EC%A0%9C%EB%B2%95
  num gcd(num a, num b) {
    while (b != 0) {
      num temp = b; // temp?
      b = a % b;
      a = temp;
    }
    return a.abs();
  }

  // 최소 공배수 계산
  // 최소공배수 : https://ko.wikipedia.org/wiki/%EC%B5%9C%EC%86%8C%EA%B3%B5%EB%B0%B0%EC%88%98
  int lcm(int a, int b) {
    return (a * b).abs() ~/ gcd(a, b);
  }

  List<int> answer = [0,0];

  // 분수의 덧셈 : 분모 맞춰준 후 > 바뀌어진 분모의 분자에 곱셈 > 나누어주기

  // 최소 공통 분모 구하기
  int commonDenominator = lcm(denom1, denom2);

  // 분자 계산
  double sumNumer = numer1 * (commonDenominator / denom1) + numer2 * (commonDenominator / denom2);

  // 최대 공약수 계산
  num gcdValue = gcd(sumNumer, commonDenominator);

  // 기약 분수로 만들기
  answer[0] = sumNumer ~/ gcdValue;
  answer[1] = commonDenominator ~/ gcdValue;

  return answer;
}

// 문자열 뒤집기 : https://school.programmers.co.kr/learn/courses/30/lessons/120822
// "abcd" -> "dcba"
String reverseString(String str) {
  // join : 개별적인 요소를 차례대로 결합
  List<String> indivisual = str.split('');
  return indivisual.reversed.toList().join();

  // 재생성
  return List.generate(str.length, (index) => str[index]).join();

  // 재생성 직접 하는 방법
  List<String> result = [];
  for(int i = 0; i < str.length; i++) {
    result[i] = str[str.length - i - 1]; // -1 == 문자열의 마지막 위치를 가리키도록
  }
  return result.join();
}








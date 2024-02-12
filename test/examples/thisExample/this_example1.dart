// ignore_for_file: slash_for_doc_comments

/**
 * ===========================================================
 * fileName       : this_example1
 * date           : 2024-02-13
 * description    :
 * 간단한 계산기 클래스를 this를 활용한 예시
 * 각 메서드는 현재 객체를 반환 하여 메서드 체이닝을 가능하게 한다.
 *
 * ===========================================================
 */
class Calculator { // Calculator 클래스를 정의
  //  value 라는 멤버 변수와 add 및 multiply 라는 두 가지 메서드 생성
  int value = 0;

  Calculator add(int x) { // add 메서드는 주어진 값을 현재 value에 더함
    this.value += x;
    return this; // 현재 객체를 반환 하여 메서드 체이닝 가능
  }

  Calculator multiply(int x) {  // multiply 메서드는 주어진 값을 현재 value에 곱함
    this.value *= x;
    return this;
    // this 단독으로 쓰일 떄는 현재 객체를 반환 하도록 한다.
    // return Calculator;
  }
}

void main() {
  Calculator calc = Calculator(); // Calculator 객체 생성
  calc.add(5).multiply(2);  // add(5)를 호출한 다음 multiply(2)를 호출하여 값을 수정
  print(calc.value); // 출력 결과: 10

  Calculator calc2 = Calculator();
  calc2.add(6);
  calc2.multiply(2);
  print(calc2.value);
}

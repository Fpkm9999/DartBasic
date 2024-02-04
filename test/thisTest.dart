/**
 * ===========================================================
 * fileName       : thisTest
 * date           : 2024-02-04
 * description    :
 * ===========================================================
 */
class Calculator {
  int value = 0;

  Calculator add(int x) {
    this.value += x;
    return this; // 현재 객체를 반환하여 메서드 체이닝 가능
  }

  Calculator multiply(int x) {
    this.value *= x;
    return this;
    // this 단독으로 쓰일 떄는 현재 객체를 반환 하도록 한다.
    // return Calculator;
  }
}

void main() {
  Calculator calc = Calculator();
  calc.add(5).multiply(2);
  print(calc.value); // 출력 결과: 10
}

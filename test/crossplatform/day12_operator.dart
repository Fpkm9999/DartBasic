/**
 * - 연산자 오버로딩(Operator Overloading)
 *   객체 간 연산자에 대해 처리를 원하는대로 바꾸는 기능
 *   e.g. [ 객체 A + 객체 B ]를 했을 때, 결과 값 만들기
 */

// 계산기 객체 = +, -, *, /, % 를 계산해주는 객체
class Value {
  const Value(this.value);

  // num == int/double
  final num value;

  int get intValue => value.toInt();
  double get doubleValue => value.toDouble();

  // 일반적으로는 자기 자신 클래스로 다시 재배출
  Value operator +(Value other) {
    return Value(this.value + other.value);
  }
  // 이렇게도 작성 가능하다는 것
  // num operator +(Value other) {
  //   return this.value + other.value;
  // }

  Value operator -(Value other) {
    return Value(this.value - other.value);
  }
  Value operator *(Value other) {
    return Value(this.value * other.value);
  }
  Value operator /(Value other) {
    return Value(this.value / other.value);
  }
  Value operator %(Value other) {
    return Value(this.value % other.value);
  }

  @override
  String toString() {
    //return super.toString();// 기본으로 정의된 값을 출력
    return this.value.toString();
  }
}

void main() {
  var v1 = Value(10);
  var v2 = Value(20);
  Value v3 = v1 + v2;
  Value v4 = v1 - v2;
  Value v5 = v1 / v2;
  Value v6 = v1 * v2;
  Value v7 = v1 % v2;
  Value v8 = v1 + v2 * v3; // (v2 * v3) + v1
  print(v8);
  print(v8.doubleValue);
  print(v8.intValue);
}







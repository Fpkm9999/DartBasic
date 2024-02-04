// ignore_for_file: slash_for_doc_comments

/**
 * ===========================================================
 * fileName       : day12_operator
 * date           : 2024-02-04
 * description    :
 * ===========================================================
 */
/*
  연산자 오버로딩(Operation Overloading)
   객체 간 연산자에 대해 처리를 원하는 대로 바꾸는 기능
   e.g. 객체 A + 객체 B 를 했을 때, 결과 값 만들기

 */
class Value {
  // const Value(this.intValue);
  const Value(this.value);

  // final int intValue;

  // final num intValue; // int, double 의 상속 num. num은 부모 클래스임 한방에 쓸 수 있다
  final num value; // int, double 의 상속 num. num은 부모 클래스임 한방에 쓸 수 있다

  int get intValue => value.toInt();  // 외부로 int로 변환해서 줄 때

  double get doubleValue => value.toDouble(); // 외부로 double타입으로 변환해서 줄 때

  // 일반적으로는 자기 자신 클래스로 다시 재배출함
  Value operator +(Value other) {
    return Value(this.value + other.value);
    // Value라는 클래스 객체와 +라는 객체를 합쳐서 새로운 객체를 만듬
  }

  // 이렇게도 작성 가능하다는 점
  // int  operator +(Value other){  //반환값이 int
  //   return this.intValue + other.intValue;
  //   // Value라는 클래스 객체와 +라는 객체를 합쳐서 새로운 객체를 만듬
  // }

  Value operator -(Value other) {
    return Value(this.value - other.value);
    // Value라는 클래스 객체와 +라는 객체를 합쳐서 새로운 객체를 만듬
  }

  Value operator *(Value other) {
    return Value(this.value * other.value);
    // Value라는 클래스 객체와 +라는 객체를 합쳐서 새로운 객체를 만듬
  }

  Value operator /(Value other) {
    return Value(this.value / other.value);
    // Value라는 클래스 객체와 +라는 객체를 합쳐서 새로운 객체를 만듬
  }

  Value operator %(Value other) {
    return Value(this.value % other.value);
    // Value라는 클래스 객체와 +라는 객체를 합쳐서 새로운 객체를 만듬
  }

  @override
  String toString() {
    // 지금 내가 가지고 있는 값을 문자열로 출력 해라
    // return 'Value{value: $value}';  // 기본으로 정의된 값을 출력
    return this.value.toString(); // 현재 가지고 있는 값을 출력  // num 타입도 문자열로 변환해서 출력
  }
}

void main() {
  var v1 = Value(10);
  var v2 = Value(20);
  var v3 = v1 + v2; // v3 타입 : Value  / 아래 opertaor +는 int 타입
  var v4 = v1 - v2;
  var v5 = v1 / v2;
  var v6 = v1 * v2;
  var v7 = v1 % v2;
  var v8 = v1 + v2 * v3;  // 어짜피 타입은 Value 임
  // 연산자 우선 순위를 따라가서 실행됨
  Value v9 = v1 + v2 * v3; // 이렇게도 가능
  print(v8); // 문자열
  print(v8.doubleValue); // double
  print(v8.intValue); // 정수

  Value v10 = v1 + v2 * v3 / v4;
  print(v9);
  print(v10);
}

// 계산기 = +, -, *, /, % 를 계산 해주는 객체

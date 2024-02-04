import 'package:flutter/physics.dart';

/**
 * ===========================================================
 * fileName       : var_dynamic_01
 * date           : 2024-02-02
 * description    :
 * var 나 dynamic 은 타입을 유추하거나 모든 타입의 데이터를 대입할 수 있는 변수를 선언
 * 할 때 사용한다.
 * ===========================================================
 */
void main(){
  var data1 = 10;
  dynamic data2 = 10;

  print(data1);
  print(data2);
  var no = 10;
  no = 20;
  // no = 30.0; // no 변수의 타입은 정수(int)로 이다. 다른 데이터 타입을 대입하면 오류.
  // var 알 수 있는 점
  // var 로 선언한 변수는 초깃값을 댕비하면 그 값의 타입으로 결정된다.
  // dynamic
  // 선언과 동시에 값을 대입하지 않으면 dynamic 타입으로 선언된다.
  var no2;
  no2 = 10;
  print(no2);
  no2 = 'hello';
  print(no2);
  no2 = true;
  print(no2);
  // var로 선언하면서 초기화하지 않았으므로 여러 타입 선언 가능

  // dynamic
  // 변수에 타입 대신 dynamic 을 사용하면 모든 타입의 데이터를 대입할 수 있다.

  // dynamic 타입으로 선언
  dynamic data = 10;
  data = 'hello';
  data = true;
}

import 'package:flutter/material.dart';

/**
 * ===========================================================
 * fileName       : list01
 * date           : 2024-02-02
 * description    :
 * 리스트 타입
 * - List
 *  데이터를 여러 개 저장하고 인덱스값으로 데이터를 이용하는 컬렉션 타입의 클래스.
 *  리스트를 선언하면서 초기화 할 때는 대괄호([])를 이용한다.
 *
 * ===========================================================
 */

void main() {
  List list1 = [10, 'hello', true];
  list1[0] = 20;
  list1[1] = 'world';
  print('${list1[0]} ${list1[1]} ${list1[2]}');
  print('List : ${list1[0]}, ${list1[1]}, ${list1[2]}');
  print('Lists : ${list1[0]}, ${list1[1]}, ${list1[2]}');

  // 특정한 타입의 데이터만 저장한느 리스트를 선언할 때는 해당 데이터 타입을 제네릭으로 명시한다.
  List<int> list2 = [10, 20, 30];
  // list2[0] = 'hello'; // 오류
  print(list2);
  // 리스트를 선언할 때 초기화한 데이터에서 더 추가하거나 제거하려면
  // add() 나 removerAt() 함수를 이용한다.
  list2.add(40);
  list2.add(460);
  print(list2);

  list2.removeAt(3); // 해당 인덱스 값 삭제
  print(list2);
  /*
     리스트 타입
      List는 데이터를 여러 개 저장하고 인덱스값으로 데이터를 이용 하는 컬렉션 타입의 클래스.

   */
  // filled(), gnerate() 라는 함수를 사용함.
  // filled(), generate()는 List 클래스에 선언된 생성자임.
  var list3 = List<int>.filled(3,0);  // filled(a,b) a는 리스트의 크기, b는 초깃값
  print(list3); // [0, 0, 0]
  var list4 = List<int>.filled(3, 1);
  print(list4);
  // list3.add(40); list3은 크기가 3이므로 4번째 데이터를 추가하면 런 타임 때 오류가 발생함.
  // 리스트를 선언할 때 크기를 지정하면 그 크기만큼만 데이터를 추가할 수 있다.
  // 만약 처음에 지정한 크기보다 많은 데이터를 저장할 수 있도록 허용하려면 filled() 생성자에
  // growable 매개변수를 true로 지정해 주어야 한다.

  var list5 = List<int>.filled(3, 0, growable: true);
  print('list5 : $list5');

  list5[0] = 10;
  list5[1] = 20;
  list5[2] = 30;
  // list5[3] = 40;
  print(list5);

}

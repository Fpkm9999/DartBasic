/// ===========================================================
/// fileName       : list_example3
/// date           : 2024-02-17
/// description    :
/// ===========================================================

/*
  리스트를 초기화할 때 특정한 로직으로 구성된 데이터를 지정할 수 있다.
  generate() 생성자가 그런 기능을 제공함.
  - generate() 생성자의 두 번째 매개변수를 (index) => index * 10 로 헀는데
  이것은 다트에서 함수를 선언하는 기법임
 */
void main(){
  var list1 = List<int>.generate(3, (index) => index * 10, growable: true);
  print(list1); // [0, 10, 20]

}
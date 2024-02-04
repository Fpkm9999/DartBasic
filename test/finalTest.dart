void main() {
  final String name = '코드팩토리';
  print(name);

  // name = '블랙핑크';
  // final로 선언하면 값을 변경할 수 없다.

  const String name2 = '블랙핑크';
  print(name2);
  // name2 = '코드팩토리'; // const도 마찬가지다.

  // todo final, const에서 변수 타입생략
  // 타입을 지우면 된다.
  // final name = '코드 팩토리';
  print(name);

  DateTime now = DateTime.now();
  print(now); // 누르고 나서 코드가 실행되는 순간이 측정시간

  final DateTime now2 = DateTime.now();
  print(now2);

  // const DateTime now3 = DateTime.now();
  // const는 안된다.
  // 여기서 차이점이 발생 하는데 const는 빌드 타입의 값을 알고 있어야 됨
  // final 은 몰라도 실행에 문제 없음
  //지금 코드를 작성하는 순간 코드의 값을 알 고 있어야 const를 사용할 수 있는데
  // 이건 언제 실행할지 알 수 없으므로 const를 사용할 수 없다.
  
}
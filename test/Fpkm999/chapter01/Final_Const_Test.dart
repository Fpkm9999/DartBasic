void main() {
  // String name = '갤럭시';

  // name = '아이폰';
  // print(name); // 값 변경 가능
  // 위 코드를 기계가 읽는 01010으로 변환하는 과정 == 컴파일

  // 값을 변경 하지 못하도록 할려면
  // final String name1 = '갤럭시'; // 런타임에 지정되어 있음
  // const String name2 = '갤럭시'; // 컴파일에 지정되어 있음
  // print(name1);
  // print(name2);

  DateTime now = DateTime.now(); // 실행 되는 순간의 시간 저장

  print(now);

  Future.delayed(
      // 1초 뒤에 이줄의현재의 시간을 출력해라
      Duration(milliseconds: 1000), () {
    DateTime now2 = DateTime.now();
    print(now2);
  });
}
/*
const의 경우 컴파일 하기 전에 값이 지정되어 있어야한다.

 */

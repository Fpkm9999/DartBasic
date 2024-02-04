/**
 * ===========================================================
 * fileName       : var_string_01
 * date           : 2024-02-01
 * description    : 데이터타입_문자열01
 * 다트언어에서 모든 변수는 객체이다.
    int, double등 모든 변수는 다트에서 객체이다.
    int 타입 변수는 객체이므로 null을 대입할 수 있으며 int 클래스에 선언된 변수와 함수를 이용 할 수 있다

    bool : true, false
    double : 실수
    int : 정수
    num : 숫자 (double과 int의 상위 클래스)
    String : 문자열
    ByteData : 바이트
 * ===========================================================
 */
void main() {
  // 문자열 표현법
  String data1 = 'galaxy';
  String data2 = 'iphone';
  String data3 = '''
  hello
  world
  ''';
  String data4 = """
  hello
  world
  """;
  print(data1);
  print(data2);
  print(data3);
  print(data4);

  // 문자열 비교
  String str1 = 'hello';
  String str2 = 'hello';

  // 두 문자열이 같은지 비교
  print(str1 == str2);

  // 문자열에 동적인 결과를 포함하는 것을 문자열 템플릿이라고 한다
  // 이때 $ 기호를 사용해서 어떤 변수를 문자열에 포함시키려면 `$변수명` 형태로 작성한다.
  // 실행문의 결과로 포함할 때는 `${}` 형태로 작성한다.

  // 문자열 템플릿
  int no = 10;
  String name = 'sktt1';

  String myTeam() {
    return 'Faker';
  }
  print('no : $no, name : $name, 10 + 20 : ${10 + 20}, myTeam() : ${myTeam()}');
}

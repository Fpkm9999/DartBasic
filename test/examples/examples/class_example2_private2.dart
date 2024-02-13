import 'class_example2_private.dart' as Test11;
// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : class_example2_private2
 * date           : 2024-02-13
 * description    : 외부 파일에서 클래스 접근
 * ===========================================================
 */
// import 'test1.dart' as Test1;

void main() {
  // no1. 30; // 오류 // 별칭을 설정했으면 그 별칭으로 이용해야 한다
  Test11.no1 = 3; // 정상
  // Test11.no1을 통해 class_example2_private.dart 파일에서 가져온 변수 no1에 접근한다.
  // no1은 Test11 별칭을 사용하여 정상적으로 접근

  Test11.sayHello1(); // Test11 별칭을 사용해 class_example2_private.dart의 함수 실행
  Test11.User1 user1 = Test11.User1(); // Test11.User1 클래스를 사용하여 User1 클래스의 객체를 생성
  print('${user1.name}'); // null // 따로 초깃값을 주지않아서 null 출력됨
  print('${user1.runtimeType}');  // User1 // 타입 

  // print(user1._address); // 접근 불가능함
}
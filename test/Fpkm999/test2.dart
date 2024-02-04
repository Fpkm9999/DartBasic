import 'test1.dart' as Test1;

void main() {
  // no1. 30; // 오류 // 별칭을 설정했으면 그 별칭으로 이용해야 한다
  Test1.no1 = 3; // 정상

  Test1.sayHello1();
  Test1.User1 user1 = Test1.User1();
}

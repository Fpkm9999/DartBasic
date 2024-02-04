int no1 = 10;
int no2 = 20;

void sayHello1() {}

void _sayHello2() {}

class User1 {
  String? name;
  String _address = 'seoul';
}

class _User2 {}

void main() {
  no1 = 20;
  no2 = 30;

  sayHello1();
  _sayHello2();

  User1 user1 = User1(); // User1 객체 생성
  _User2 user2 = _User2(); // User2 객체 생성

  user1.name = 'kkang';
  user1._address = 'busan';

  print(user1.name);
  print(user1._address);
  /*
  _로 선언된 것들은 같은 파일에서는 아무 상관없이 사용할 수 있지만.
  외부 파일에서 접근할 때는 접근할 수 없다.
   */

  // 식별자에 별칭 정의 하기 - as

}

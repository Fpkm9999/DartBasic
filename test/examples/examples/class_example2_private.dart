/**
 * ===========================================================
 * fileName       : class_example2_private
 * date           : 2024-02-13
 * description    :
 * ===========================================================
 */
int no1 = 10; //  no1,no2 변수 각각 10,20 정수값으로 초기화
int no2 = 20;

void sayHello1() {
  print('sayHello1');
} // 공개 함수 선언

void _sayHello2() {}  // 비공개 함수 선언

class User1 {
  String? name; // nullable 한 String 변수 선언
  String _address = 'seoul'; // 비공개 String 변수
}

class _User2 {} // 비공개 클래스로 선언

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
  외부 파일에서는 접근할 수 없다.
   */

  // 식별자에 별칭 정의 하기 - as

}

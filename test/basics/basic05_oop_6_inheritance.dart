/**
 * ===========================================================
 * fileName       : basic05_oop_6inheritance
 * date           : 2024-02-16
 * description    :
 * ===========================================================
 */
void main() {
  print('---------Idol-------------');
  Idol apink = Idol(name: '에이핑크', membersCount: 5);

  apink.sayName();
  apink.sayMembersCount();
  // apink.sayMale(); // 부모클래스에서는 자식클래스에서 선언한 메소드를 사용할 수 없다.

  print('--------BTS------------------');
  BoyGroup bts = BoyGroup('BTS', 7);
  bts.sayMembersCount();
  bts.sayName();
  bts.sayMale();

  print('--------Girl Group----------------');
  GirlGroup redVelvet = GirlGroup('Red Velvet', 5);
  redVelvet.sayMembersCount();
  redVelvet.sayName();
  redVelvet.sayFemale();
}

// 상속 - inheritance

// 상속을 받으면 부모 클래스의 모든 속성을
// 자식 클래스가 부여받는다.
class Idol {
// 이름
  String name;

// 멤버 숫자
  int membersCount;

  Idol({
    // named parameter
    required this.name,
    required this.membersCount,
  });

  void sayName() {
    print('저는 ${this.name}입니다.');
  }

  void sayMembersCount() {
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }
}

class BoyGroup extends Idol {
  // 부모클래스로부터 모든 멤버를 물려 받는다.
  BoyGroup(
    String name,
    int membersCount,
  ) : super(name: name, membersCount: membersCount);

  void sayMale() {
    print('저는 남자입니다.');
  }
}

class GirlGroup extends Idol {
  // 부모 클래스로부터 모든 멤버를 물려 받는다.
  GirlGroup(
    String name,
    int membersCount,
  ) : super(name: name, membersCount: membersCount);
  void sayFemale(){
    print('저는 여자입니다.');
  }
}

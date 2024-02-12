/**
 * ===========================================================
 * fileName       : basic05_2_OOP
 * date           : 2024-02-11
 * description    :
 * ===========================================================
 */
void main() {
  Idol blackPink = Idol(
    // 포지셔널 파라미터
    '블랙핑크',
    ['지수', '제니', '리사 ', ' 로제 '],
  ); // 다트언어에서는 new 자동생략이 가능함
  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();

  Idol bts = Idol(
    'BTS',
    ['RM', '진', '슈가', ' 제이홉', ' 지민 ', ' 뷔 ', ' 정국'],
  );

  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();

  Idol bts2 = Idol.fromList([
    ['RM', '진', '슈가', ' 제이홉', ' 지민 ', ' 뷔 ', ' 정국'],
    'BTS',]
  );
  bts2.name;
  bts2.members;
  bts2.sayHello();
  bts2.introduce();
  // print(bts2.runtimeType);
}

// Idol class
// name (이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수

// constructor (생성자)

class Idol {
  String name;
  List<String> members;

  // case1. 기본 constructor
  Idol(this.name, this.members); // 간결해진 생성자. 바로 this를 사용해도 가능함 // 여기까지가 포지셔널 파라미터

  // case2. Named constructor
  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce() {
    print('${this.members}가 있습니다.');
  }
}

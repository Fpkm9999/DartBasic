// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : basic05_OOP_3
 * date           : 2024-02-13
 * description    : immutable 프로그래밍
 * ===========================================================
 */

void main() {
  Idol blackPink = Idol(
    '블랙핑크',
    ['지수', '제니', ' 리사 ', ' 로제 '],
  );

  Idol bts = Idol.fromList([
    ['RM', '진', '슈가', ' 제이홉', ' 지민 ', ' 뷔 ', ' 정국'],
    'BTS',
  ]);
  print(blackPink.firstMember); // getter 첫번째 멤버 가져옴
  print(bts.firstMember);

  blackPink.firstMember = '코드팩토리'; // 바꾸고 싶은값
  bts.firstMember = '아이언맨';
  print(blackPink.firstMember);
  print(bts.firstMember);

  // 왜 getter, setter 을 사용 하는가?
  // 뉘앙스으 차이가 있다.
}

// getter / setter
// 데이터를 가져올때 / 데이터를 설정할때
class Idol {
  final String name;
  final List<String> members;

  Idol(this.name, this.members);

  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce() {
    print('${this.members}가 있습니다.');
  }

  String getFirstMember() {
    return this.members[0];
  }

  // 위와 아래는 사실 차이가 없다.
  // 뉘앙스의 차이.둘이 어떻게 다른지는 하다 보면 알게됨
  String get firstMember {
    return this.members[0];
  }

// setter - 값을 지정
  set firstMember(String name) {
    this.members[0] = name;
  }
// final 타입이여도 list 타입은 특이하게도 값 변경이 가능함.
// 그래서 요즘 프로그래밍에서는 set을 잘 사용 안함
}

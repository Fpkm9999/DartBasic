/**
 * ===========================================================
 * fileName       : basic05_OOP_3
 * date           : 2024-02-13
 * description    : immutable 프로그래밍
 * ===========================================================
 */

void main() {
  // Idol blackPink = const Idol(
  //   // 포지셔널 파라미터
  //   '블랙핑크', // 빌드 타임의 값을 알 수 있음. const 가능
  //   ['지수', '제니', '리사 ', ' 로제 '],
  // ); // 다트언어에서는 new 자동생략이 가능함
  // // blackPink.name= '코드'; final 키워드를 이용해 변경을 막음

  Idol blackPink = Idol(
    '블랙핑크',
    ['지수', '제니', ' 리사 ', ' 로제 '],
  );
  Idol blackPink2 = Idol(
    ' 블랙핑크',
    ['지수', '제니', ' 리사 ', ' 로제 '],
  );

  print(blackPink == blackPink2);

  // 여기서 const 로 객체를 선언한다면?
  // const constructor 를 써서 생성을 하게되면
  // 같은 인스턴스가 된다.. 모든 멤버의 내용도 동일할 경우가 조건.
  Idol blackPink3 = const Idol(
    '블랙핑크',
    ['지수', '제니', ' 리사 ', ' 로제 '],
  );

  Idol blackPink4 = const Idol(
    '블랙핑크',
    ['지수', '제니', ' 리사 ', ' 로제 '],
  );
  print(blackPink3 == blackPink4);

  Idol bts2 = Idol.fromList([
    ['RM', '진', '슈가', ' 제이홉', ' 지민 ', ' 뷔 ', ' 정국'],
    'BTS',
  ]);
  bts2.name;
  bts2.members;
  bts2.sayHello();
  bts2.introduce();
}

// Idol class
// name (이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수

// constructor (생성자)
// immutable 프로그래밍
class Idol {
  final String name;
  final List<String> members;

  // case1. 기본 constructor
  const Idol(this.name,
      this.members); // 간결해진 생성자. 바로 this를 사용해도 가능함 // 여기까지가 포지셔널 파라미터

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

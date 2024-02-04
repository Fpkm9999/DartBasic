import 'package:flutter/widgets.dart';

/**
 * - 명칭형 생성자(Named constructor)
 *   생성자 함수라는 것은 동일, 함수의 규칙을 그대로 따라감
 *   의미가 부여된 생성자 함수
 *   생성자 = 클래스명과 동일   <- 여기까지는 같음
 *   `생성자명.메소드명`으로 이름을 붙여줌
 *   명칭형 생성자를 사용할 때 파라미터의 일부가 내부적으로 결정할 때도 있음
 */
class Computer {
  // 일반적인 생성자
  // Computer(): this.touch = false;
  //
  // DART에서는 명칭형 파라미터를 사용했다고 해서, 생성자를 생략해주지 않음.
  //   => DART에서는 기본형태의 생성자가 없을 경우는 허용되지 않음
  //      그래서, 접근 제한자에서 private 규칙을 활용해서 기본형태 생성자 숨길 수 있음
  //      => 여기서는 명칭형이 아닌 기본 형태 생성자는 없다는 것을 의미
  // 여기서, 추가적으로 가능한 것은 초기화를 한 곳으로 가져올 수 있음
  //   => 표준 컴퓨터 초기화, 터치 컴퓨터 초기화를 여기로 가져온 것
  Computer._({
    required bool touch,
  }): touch = false {
    /* 생성 직후 초기화 내용 */
  }

  // 표준 컴퓨터 형태의 생성자
  //Computer.standard(): this._(touch: false);
  Computer.standard(): touch = false;

  // 터치형 컴퓨터 형태의 생성자
  Computer.touch(): this._(touch: true);

  final bool touch;
}

void main() {
  // 우리가 Computer._ 으로 기본 생성자를 숨겼기 때문에 이렇게 생성 불가
  // Computer commonConstructor = Computer();
  Computer standardComputer = Computer.standard();
  Computer touchComputer = Computer.touch();

  // 대표적인 예시

  // 10개를 가진 리스트를 생성하지만, 값에 대해서 변환 생성을 함
  List list1 = List.generate(10, (index) => index);
  // 동일한 문법
  list1 = [
    for(int i = 0; i < 10; i++)
      i
  ];
  // 비어있는 리스트를 생성
  list1 = List.empty();
  // 값을 바꿀 수 없는 리스트 생성
  list1 = List.unmodifiable(list1);
}

// 명칭형 파라미터 보강
void named({ // `{}` 파라미터 : 명칭형 파라미터
  required int a, // 필수 값 : required
  int b = 0,
  required int c, // 필수 값 : required
}) {
  // 명칭형 파라미터에 의해서 파라미터 라벨링에 따라 값을 집어넣어주게 됨
  named(c: 20, a: 10);
}

void positioned([// `[]` 파라미터 : 위치형 파라미터
  int a = 0,
  int b = 0,
  int? c,
]) {
  // 명칭형 파라미터에 의해서 파라미터 라벨링에 따라 값을 집어넣어주게 됨
  positioned(10,20,30);
}
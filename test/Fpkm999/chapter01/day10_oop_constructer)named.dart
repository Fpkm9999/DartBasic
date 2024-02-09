/*
  명칭형 생성자(Named constructor)
    생성자 함수라는 것은 동일, 함수의 규칙을 그대로 따라감
    의미가 부여된 생성자 함수
    생성자 = 클래스명과 동일 <- 여기까지는 같음
    `생성자명.메소드명` 으로 이름을 붙여줌
    Dart에서는 직관적이게 생성자명.이름을 붙여서 생성자 사용가능. 이후 규칙은 파라미터규칙과 동일함.
     명칭형 파라미터를 사용할 때 파라미터의 일부가 내부적으로 결정할 때 도 있음
 */
class Computer {
  // Computer() : this.touch  = false;
  // 일반적인 생성자
  // DART에서는 명칭형 파라미터를 사용햇다고 해서, 기본형 생성자를 생략해주지 않음.
  // => DART에서는 기본형태의 생성자가 없을 경우는 허용 되지 않음
  //    그래서, 접근 제한자에서 private 규칙을 활용해서 기본형태 생성자를 숨길 수 있음
  // Computer._(): touch = false;
  // 여기서, 추가적으로 가능한 것은 초기화를 한 곳으로 가져올 수 있다는 것이다.
  //  => 표준 컴퓨터 초기화, 터치 컴퓨터 초기화를 여기로 가져온 것
  Computer._({
    required bool touch,
  }) : touch = false {
    /* 생성 직후 초기화 내용*/
  }

  // 표준 컴퓨터 형태의 생성자
  // Computer.standard() : this.touch = false;
  Computer.standard() : this._(touch: false);
  // 터치형 컴퓨터 형태의 생성자
  // Computer.touch() : this.touch = true;
  Computer.touch() : this._(touch: true);

  final bool touch;
}

void main() {
  Computer standardComputer = Computer.standard();
  Computer touchComputer = Computer.touch();

  // 10개를 가진 리스트를 생성하지만, 값에 변환 생성을 함
  List list1 = List.generate(10, (index) => index);
  // 동일한 문법
  list1 = [
    for(int i = 0; i< 10; i++)
      i
  ];
  // 비어있는 리스트를 생성
  list1 = List.empty();
  // 값을 바꿀 수 없는 리스트 생성
  list1 = List.unmodifiable(list1);
  // todo 위젯이 뭔가.
  // todo :
  // todo {()}
  // todo 매개변수에 함수 add() 자체를 넣는건가?
  // 일단 언더라인이 붙으면 외부에서 일단 관련(호출등)을 할 수 없음.

}
/*

 */
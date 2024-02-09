void main() {
  print('Hello, World!'); // 화면에 'Hello, World' 를 출력 ( 작은 따옴표 사용)
  print('Hello, World!');

  int no = 10; // 정수형 변수 no로 선언 하고 값을 10으로 초기화

  void sayHello() {
    // sayHello 함수를 정의 ( 함수 선언)
    print('Hello, $no'); // 화면에 'Hello, 10' 을 출력
  }

  sayHello(); // sayHello 함수를 호출
  /*
  다트는 pulbic, private 와 같은 접근제한자를 제공하지 않는다.
  기본적으로 구성 요소를 선언하면 public 상태가 된다.
  식별자 이름 앞에 밑줄을 추가하면 이파일에서만 사용할 수 있도록 접근을 제한
  (private) 할 수 있다.
 */
}

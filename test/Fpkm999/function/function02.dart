/**
 * ===========================================================
 * fileName       : function02
 * date           : 2024-02-03
 * description    :
 * ===========================================================
 */

void some1(var a){  // dynamic 타입이 됨
  a = 20;
  a = 'world';
  a = true;
  a = null;
}
void some2(a) { // dynamic 타입
  a = 20;
  a = 'world';
  a = true;
  a = null;
  // 매개변수의 타입을 생략하면 var 로 선언한 것과 같다 => dynamic 타입임

  //void 의 경우 반환타입이 없는 경우도 dynamic 타입이 된다.
}

void printUser1(){
  print('hello world');
}
void printUser2() => print('hello world'); // 화살표 함수
void main(){
  // some1();  // 매개변수에 값을 전달하지 않아서 오류
  some1(10);
  some1('hello');
  /*
  함수에 매개변수가 대입되는 시점은 이 함수를 호출할 때이므로 컴파일 시점에는 타입을 유추할 수 없다.
  그래서 함수의 매개변수를 var로 선언하면 dynamic 타입이 된다.
   */
  // some2();  // 오류
  some2(10);
  printUser1();
  printUser2();

}
/// ===========================================================
/// fileName       : optional_positional_parameter_01
/// date           : 2024-02-03
/// description    :
/// 선택적 위치 파라미터(optional positional parameters) 연습-1
/// ===========================================================
void some( int arg1, [String arg2 = 'hello', bool arg3 = false]){
  print('$arg1, $arg2, $arg3');
}
// arg1 : 필수 파라미터이다. 함수를 호출할 때 반드시 제공해야한다.
// arg2, arg3 : 선택적 위치 파라미터로 대괄호 `[]` 로 묶여 있다. 이는 함수를 호출 할 때
//              이 파라미터를 제공 할 수도 있고, 생략 할 수도 있다
//              그리고 arg2, arg3에는 각각 기본값이 설정되어 있다. 이 파라미터를 생략하면 기본값이 사용된다.
void main(){

  // some(); // 오류
  some(10);// 성공
  // some(10, arg2:'world', arg3: true); // 오류
  some(10, 'world',true); // 성공
  // some(10, true,'world'); // 오류
  some(10,'world'); // 성공
  // some(10, true); // 오류

}
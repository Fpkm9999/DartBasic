/**
 * ===========================================================
 * fileName       : function03
 * date           : 2024-02-03
 * description    : 명명된 매개변수
 *
 * ===========================================================
 */

/*
  다트에서는 함수의 매개변수를 선택적으로 지정하는 옵셔널(optional)을 지원한다.
    - 명명된 매개변수(named parameter)
    - 옵셔널 위치 매개변수(optional positional parameter)
 */
String myFun({String data = 'hello'}){
  return data;
}
someFun({required int arg1}){
  print('someFun().. arg1 : $arg1');
}

void main(){
  print('myFun() result : ${myFun()}'); // myFun() result : hello
  print('${myFun()}');

  // someFun();  // 오류
  someFun(arg1: 10); // 성공
}
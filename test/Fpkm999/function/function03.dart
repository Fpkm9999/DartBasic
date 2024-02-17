/// ===========================================================
/// fileName       : function03
/// date           : 2024-02-03
/// description    : 명명된 매개변수
///
/// ===========================================================

/*
  다트에서는 함수의 매개변수를 선택적으로 지정하는 옵셔널(optional)을 지원 한다.
    - 명명된 매개변수(named parameter)
    - 옵셔널 위치 매개변수(optional positional parameter)
 */
// 기본값을 가진 네임드 파라미터
String myFun({String data = 'hello'}){
  return data;
}
// required 키워드를 이용한 필수 네임드 파라미터
someFun({required int arg1}){
  print('someFun().. arg1 : $arg1');
}

// 오류 케이스1
// required 가 붙은 매개변수는 기본값을 가질 수 없다. 기본값을 주면 오류가 뜬다. required 를 제거 하던가 기본값을 빼야 한다.
// someFun2({required int arg1= 10}){
//   print('someFun().. arg1 : $arg1');
// }
// required 키워드를 이용한 필수 네임드 파라미터

// 오류는 아닌 정상적으로 실행 되는 케이스1
// required 키워드가 붙은 변수에 nullable 을 사용한다면

// required int? arg1를 사용하는 경우,
// arg1 파라미터는 반드시 함수 호출 시 명시되어야 하지만, null 값을 가질 수 있다.
//
// >>> required 키워드는 호출자가 해당 파라미터를 제공해야 함을 의미하며, int? 타입은 이 값이 null일 수 있음을 나타낸다.
//
// 즉, someFun3 함수를 호출할 때 arg1 파라미터를 명시해야 하지만, 그 값으로 null을 전달할 수 있다.
someFun3({required int? arg1}) {
  print('someFun().. arg1 : $arg1');
}
void main(){
  print('myFun() result : ${myFun()}'); // myFun() result : hello // 기본값인 hello가 출력되었다.
  print('${myFun()}');

  // someFun();  // 오류 required 키워드가 사용된 변수의 경우 반드시 값을 주어야 한다.
  someFun(arg1: 10); // 성공

  someFun3(arg1: null); //
}
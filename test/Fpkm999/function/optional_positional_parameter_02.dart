/**
 * ===========================================================
 * fileName       : optional_positional_parameter_02
 * date           : 2024-02-03
 * description    :
 * ===========================================================
 */
// import 'dart:io';
import 'dart:core';
// 함수를 이용한 예
int plus(int no){
  return no + 10;
}
int multiply(int no){
  return no * 10;
}
Function testFun(Function argFun){
  print('argFun : ${argFun(20)}');
  return multiply;
}

void main(List<String> args){
  var result = testFun(plus);
  print('result : ${result(20)}');
}
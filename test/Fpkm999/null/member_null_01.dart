/**
 * ===========================================================
 * fileName       : member_null_01
 * date           : 2024-02-03
 * description    :
 * ===========================================================
 */

void main(){
  String? str = "hello";

  print(str?.isEmpty);
  // str.isEmpty;

  int? no1 = 10;
  bool? result1 = no1?.isEven;
  print('result 1 : $result1');

  no1 = null;
  bool? result2 = no1?.isEven;
  print('result 2 : $result2');


  List<int>? list = [10,20,30];
  print('list[0]: ${list?[0]}');
  list = null;
  print('list[0]: ${list?[0]}');

  String? data4 = 'hello';
  String? result = data4 ?? 'world';
  print('result : $result');

  data4 = null;
  result = data4 ?? 'world';
  print('result : $result');
}
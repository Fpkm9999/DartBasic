/**
 * ===========================================================
 * fileName       : dynamic_null_01
 * date           : 2024-02-02
 * description    :
 * dynamic 타입의 널 안전성
 * dynamic 타입에는 물음표를 추가할 수 있지만 dynamic 타입으로
 * 선언하는 자체가 널을 허용하는 것이라 의미는 없다.
 * ===========================================================
 */
void main(){
  dynamic a1 = 10;
  dynamic a2;
  dynamic? a3;

  a1 = null;
  a2 = null;
  a3 = null;

  int a4 = 10;
  int? a5 = 20;


    a4 = a5 as int;
    print("a4: $a4, a5: $a5");

    int? a6 = 30;
    a6 = a5 as int?;
    print("a5: $a5, a6: $a6");
}
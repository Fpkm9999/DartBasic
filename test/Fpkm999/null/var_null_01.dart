/**
 * ===========================================================
 * fileName       : var_null_01
 * date           : 2024-02-02
 * description    :
 * ===========================================================
 */
void main() {
  var a1 = 10; // int
  var a2 = null; // dynamic
  var a3; // dynamic

  testFun() {
    a1 = 20;
    // a1 = null;  // 오류

    a2 = 20;
    a2 = "hello";
    a2 = null;

    a3 = 20;
    a3 = "hello";
    a3 = null;
    /*
    var 타입에 null 이나 초깃값을 입력하지 않으면 dynamic 타입으로 결정된다.
     */
  }
}

/**
 * ===========================================================
 * fileName       : optional_positional_parameter_01
 * date           : 2024-02-03
 * description    :
 * ===========================================================
 */
void some(int arg1, [String arg2 = 'hello', bool arg3 = false]){}

void main(){

  // some(); // 오류
  some(10);// 성공
  // some(10, arg2:'world', arg3: true); // 오류
  some(10, 'world',true); // 성공
  // some(10, true,'world'); // 오류
  some(10,'world'); // 성공
  // some(10, true); // 오류

}
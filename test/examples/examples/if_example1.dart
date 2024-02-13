// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : if_example1
 * date           : 2024-02-13
 * description    : if 연습 1
 * ===========================================================
 */

void main() {
  // if 문
  int number = 2;
  // if (number % 2 ==0){
  //   print('값이 짝수입니다.');
  // } else{
  //   print('값이 홀수입니다.');
  // }

  if (number % 3 == 0) {
    print('나머지가 0입니다.');
  } else if (number % 3 == 1) {
    print('나머지가 1입니다.');
  } else {
    print('나머지가 2입니다.');
  }
}

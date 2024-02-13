// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : switch_example1
 * date           : 2024-02-13
 * description    : switch 문 연습1
 * ===========================================================
 */
void main() {
  // switch 문

  int number = 1;
  switch (number % 3) {
    case 0: // number 를 3으로 나눴을 때 나머지 값
      print("나머지가 0입니다");
      break;
    case 1:
      print('나머지가 1입니다.');
      break;
    default: // else  와 같음
      print('나머지가 2입니다.');
      break;
  }
}

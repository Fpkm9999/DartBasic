void main() {
  // switch 문

  int number = 1;
  switch (number % 3) {
    case 0:
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

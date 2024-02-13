// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : if_example2
 * date           : 2024-02-13
 * description    :
 * ===========================================================
 */

void main(){
  var year = 2024;
  var flybyObjects = [1,2,3];

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {  // if 문이 틀린 경우 검사
    print('20th century');
  }

  for (final object in flybyObjects) { // flybyObjects의 각 요소에 대해 반복하여 출력
    print(object);
  }
  print(' ');

  for (int month = 1; month <= 12; month++) { // loop : 1부터 12까지 월을 출력하는데 사용
    print('$month 월'); // 1월 부터 2월까지 출력
  }

  while (year < 2016) {
    year += 1;
  }

  while (year > 2019){
    print('S24');
    break;
  }
}
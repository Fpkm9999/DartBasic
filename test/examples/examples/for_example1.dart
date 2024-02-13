// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : for_example1
 * date           : 2024-02-13
 * description    : for 문 연습 1
 * ===========================================================
 */

void main() {
  // for loop
  for (int i = 0; i < 10; i++) {  // loop : 0 에서 9 까지 숫자를 출력.
    print(i);
  }

  int total = 0;
  List<int> numbers = [1,2,3,4,5,6];

  print('\n');
  for(int i =0; i < numbers.length;i++){  // 리스트에 있는 각 숫자를 합산하여 출력
    total += numbers[i];
  }
  print(total);

  print('------------');
  total = 0;
  for(int number in numbers){ // for-in loop
    total += number;  // 리스트에 있는 각 요소를 number로 가져와서 합산
  }
  print(total);
}

void main() {
  // List
  // 리스트                // 대괄호로 배열을 저장함.
  List<String> blackPink = ['제니', '지수', '로제', '리사']; //String 만 값을 넣을 수 있음
  List<int> numbers = [1, 2, 3, 4, 5, 6]; // 타입을 꼭 지켜야 한다.
  print(blackPink);
  print(numbers);

  // index
  // 순서
  // 0부터 시작
  print(blackPink[0]);
  print(blackPink[1]);
  print(blackPink[2]);
  print(blackPink[3]);
  // print(blackPink[4]);1
  print(blackPink.length); // 길이는 1부터 시작 아무것도없으면 0
  blackPink.add('코드팩토리');
  print(blackPink);

  blackPink.remove('코드팩토리');
  print(blackPink);
  print(blackPink.indexOf('로제'));
}

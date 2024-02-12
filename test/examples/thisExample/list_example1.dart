// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : list_example1
 * date           : 2024-02-13
 * description    : 리스트(List) 생성 및 기능 예제
 * ===========================================================
 */

void main() {
  // List
  // 리스트                // 대괄호로 배열을 저장함.
  List<String> blackPink = ['제니', '지수', '로제', '리사']; //String 만 값을 넣을 수 있음
  List<int> numbers = [1, 2, 3, 4, 5, 6]; // 타입을 꼭 지켜야 한다.
  print(blackPink);
  print(numbers);

  // 리스트 원소 출력 하는 방법
  // case1
  // index
  // 순서
  // 0부터 시작
  print(blackPink[0]);
  print(blackPink[1]);
  print(blackPink[2]);
  print(blackPink[3]);
  // print(blackPink[4]);

  // 리스트 크기
  print(blackPink.length); // 길이는 1부터 시작 아무것도없으면 0

  // 리스트 원소 추가
  blackPink.add('코드팩토리');
  print(blackPink);

  // 리스트 원소 삭제
  blackPink.remove('코드팩토리');
  print(blackPink);

  // 리스트의 특정 원소의 인덱서를 출력
  print(blackPink.indexOf('로제'));

  print(blackPink.runtimeType);
}

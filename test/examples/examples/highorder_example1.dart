/// ===========================================================
/// fileName       : highorder_example1
/// date           : 2024-02-18
/// description    :
/// 콜백 함수를 고차 함수에서의 사용하는 예시
///
/// 콜백 함수(callback function)는 다른 함수에 인자로 전달되는 함수
/// ===========================================================
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // 'forEach' 메소드에 콜백 함수를 전달하여 리스트의 각 요소를 출력
  numbers.forEach((number) {
    print(number);
  });

  numbers.forEach((element) {
    print(element);
  });
}

/// ===========================================================
/// fileName       : CallBack_example2
/// date           : 2024-02-18
/// description    :
/// ===========================================================
void performOperation(int a, int b, Function operation) {
  print(operation(a, b));
}

void add(int a, int b) {
  print('Add result: ${a + b}');
}

void main() {
  // 'add' 함수를 'performOperation'의 콜백으로 전달
  performOperation(5, 3, add);  // 함수에 인자로 함수를 실행시킴 == 가장 기초적인 콜백 함수
}
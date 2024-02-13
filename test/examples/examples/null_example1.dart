// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : null_example1
 * date           : 2024-02-13
 * description    :
 * Dart에서는 변수가 nullable인지 non-nullable인지를 명시할 수 있다.
 * Nullable 변수는 해당 변수가 null 값을 가질 수 있음을 나타내며, 타입 이름 뒤에 ?를 붙여서 표시
 * Non-nullable 변수는 null 값을 가질 수 없음을 의미
 * ===========================================================
 */
void main() {
  // nullable - null 이 될 수 있다.
  //  non-nullable - null 이 될 수 있다.
// null - 아루런 값도 있지 않다
  String name = '코드팩토리'; // 해당 변수가 non-nullable 하므로 null 값을 할당할 수 없음
  print(name);
// name = null;  null 이 들어갈 수 없는데 넣어서 오류

  String? name2 = '블랙핑크'; // 어떤 타입이든 타입에 `?`가 붙으면 null이 들어갈 수 있도록 선언할 수 있다.
// name2 = null;
  print(name2);

// print(name2!);  // !표시는 null이 절대 아니라는 표시
  String? name3;
  name3 = null ?? 'chzzk'; // name3 변수가 null인 경우에만 'chzzk' 값을 할당
  print(name3); // chzzk
  print(name3!);  // Null 단언 연산자(!)
  // Dart 에서 `!` 연산자를 사용하여 null 이 아님을 선언할 수 있다.

  // Dart에서 nullable 및 non-nullable 변수 선언, null 체크 연산자, 그리고 null 단언 연산자 등의 개념을
  // 도입하여 null safety가 강화되어 코드의 안정성과 신뢰성을 높이는 데 도움을 주고 있다.
}

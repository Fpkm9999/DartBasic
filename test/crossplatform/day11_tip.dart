/*
 * - 함수 오버로딩 -> DART에서 지원안함
 *   동일한 이름의 메소드를 여러 개 정의하는 것
 *
 * 두 문자열을 붙여서, 하나의 문자열로 만들어준다.
 * - JAVA에서의 함수 오버로딩
 *  String concat(String str1, String str2)
 *  String concat(char[] str1, char[] str2)
 *  String concat(char[] str1, String str2)
 *  String concat(String str1, char[] str2)
 *
 * - DART에서의 함수 오버로딩 유사 구현 : 선택1 : 네이밍을 바꾼다.
 * String concatWithString(String str1, String str2)
 * String concatWithCharacters(List<char> str1, List<char> str2)
 * - DART에서의 함수 오버로딩 유사 구현 : 선택2 : 명칭형 파라미터 사용
 *   이 방식이 조금 더 DART스러움
 * String concat({
 *     String? str1, String? str2,
 *     List<char>? str1, List<char>? str2
 * })
 *
 * - 중첩/내부 클래스 - DART에서 미지원
 *   중첩 클래스 : 클래스 안에 다른 클래스를 선언(외부 클래스 멤버변수에 접근 불가)
 *   내부 클래스 : 클래스 안에 다른 클래스를 선언(외부 클래스 멤버변수에 접근 가능)
 *               => 문제: 내부와 외부가 서로 레퍼런스가지고 있기 때문에
 *                  내부에서 외부의 멤버변수에 접근 가능 => 메모리 누수 가능성
 *   중첩 클래스와 내부 클래스 공통 문제 : 같은 클래스를 중복적으로 가지고 있을 가능성
 *
 *   이러한 형태의 두 클래스가 없기때문에 일어나는 문제
 *   1. 클래스의 이름에 의존한 클래스 분리
 *   2. 클래스의 이름의 길이가 길어질수 있음
 *   => 이름을 명확하게 잘 분류해서 적어주는 연습 필요
 */

class MyApple {
  MyApple(MyAppleDecoration decoration) {}
}
class MyAppleDecoration {
  MyApple build() {
    return MyApple(this);
  }
}

void main() {
  MyAppleDecoration decoration = MyAppleDecoration();
  // 꾸미는 값
  // 의도한 형태
  MyApple myApple1 = decoration.build();

  // 의도하지 않은 형태 : 직접 생성해버림
  MyApple myApple2 = MyApple(decoration);
}
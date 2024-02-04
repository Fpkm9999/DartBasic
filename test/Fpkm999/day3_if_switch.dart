/**
 * ===========================================================
 * fileName       : day3_if_switch
 * date           : 2024-02-01
 * description    :
 *  - if문
 *   조건식 - 관계 / 논리 결과물(= bool값 또는 bool변수 또는 bool상수)만 들어갈 수 있음
 *   if문은 한개 블럭이 코드블럭(`{ ... }`)
 *
 * - switch문
 *   리터럴 변수와 기호상수 비교
 *   switch문은 콜론과 break 키워드(`: ... break;`)
 *
 *   코드 블럭이 다른 이유 todo
 *   : 전통적 switch문에서는 다음 구문 실행(Fall-through) 기능이 있음
 *     DART 등 현대 언어에서는 이 기능은 막혀있음
 *     폴-스로우 기능은 의도적일수도 아닐수도 있음
 * ===========================================================
 */
void main() {
  const SPRING = 10;
  const SUMMER = 11;
  const FALL = 12;
  const WINTER = 13;

  // x 가 가을인가? 아닌가?
  int x = 1;

  // 방법1. 인라인 코드(Inline code)로 관계식 작성
  if (x == FALL) {
    /*.... */
  }
  // 방법2. 변수로 분리해서 관계식 결과물 작성
  final bool isFall = (x == FALL);
  // final : 이후 값 바꾸지 않을 때 => 결과물 상수화
  if (isFall) {
    /* ... */
  }
  // isFall = false; // 상수일 때는 값 변경 불가
  print(isFall); // false

  // TIP. 코드를 조금 더 빨리 치는 방법?
  // 문법적인 부분을 먼저 작성 > 내용 채우기

  // x가 가을과 겨울인가? 아닌가?
  if (x == FALL && x == WINTER) {
    // 인가? 그렇다면, ...
    // "문자${ } 열" 에서 `${ }` 은 한 개 코드 블럭/루틴으로 생각하면 됨
    print("FALL($FALL}) or WINTER(${WINTER})");
  } else if (x == SPRING) {
  } else {
    // 아닌가? 그렇다면, ...
    print("NO FALL and NO WINTER");
  }
  // else 키워드 : 앞의 if문에 연결을 지어서 1개 세트로 만들어줌
  // if-else 중 하나를 실행 해야 하지만, 부가코드도 실행을 해야할 때 유리
  // if() { /*... */ }
  // else { /* ... */ }
  // /* 부가코드 */ / 여기도 실행됨

  // 사계절("봄","여름","가을","겨울")을 출력하시오.
  String? message = "";
  print(message);

  // if() { }
  // else if() { }
  // else if() { }
  // else if() { }
  // /*display:*/

  // 상수 비교 시 비권장
  // if(x == SPRING) {
  //
  // } else if(x == SUMMER) {
  //
  // } else if(x == FALL) {
  //
  // } else if(x == WINTER) {
  //
  // }
  // // display

  switch (x) {
    case SPRING:
      message = "봄 - ${SPRING}";
      //break;
      continue display; // 라벨(Label)

    case SUMMER:
      message = "여름 - ${x}";
      //break;
      continue display; // 라벨(Label)

    case FALL:
      message = "가을 - ${FALL}";
      //break;
      continue display; // 라벨(Label)

    case WINTER:
      message = "겨울 - ${x}";
      //break;
      continue display; // 라벨(Label)

    display: // default 구문에 라벨을 지정해줌 (case 구문에도 이렇게 가능)
    default:
      // 봄/여름/가을/겨울 케이스에 안걸렸을 경우
      // message에 대한 기본 값 처리
      if (message?.isEmpty ?? true) {
        // 메시지가 없었을 경우 빈 값인 것 처럼 취급
        message = "모르겠음 - ${x}"; // 빈 값일 경우 초기 값
      }

      // switch 구문에서 처리 후 할 코드들
      print(message);
      break;
  }
  // 숫자 최소/최대 값 찾기
  // 변수 3개 중 가장 큰 값과 가장 작은 값을 출력하시오.
  int a = 10;
  int b = 5;
  int c = 8;
  int max = a, min = a;

  if (b > max) {
    max = b;
  }
  if (c > max) {
    max = c;
  }
  if (b < min) {
    min = b;
  }
  if (c < min) {
    min = c;
  }
  print(max);
  print(min);
}

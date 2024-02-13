// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : day2_operator
 * date           : 2024-02-01
 * description    :
 * ===========================================================
 */
/*
 * - 연산자
 *    산술(int, double => 결과물 int, double) :
 *      정수 vs 소수점수 결합으로 계싼한 결과 == 소수점수
 *      정수 vs 정수 결합으로 계산한 결과 == 정수
 *      소수점수 vs 소수점수 결합으로 계산한 결과 == 소수점수
 *      C = A + B
 *      C = A - B
 *      C = A * B
 *      C = A / B
 *      C = A % B
 *      C = ~A
 *      C = A ~/ B (DART 전용) todo
 *   관계(int, double => 결과물 bool) :
 *      C = A > B
 *      C = A < B
 *      C = A >= B
 *      C = A <= B
 *      C = A == B
 *      C = A != B
 *   논리(bool => 결과물 bool) :
 *      관계 연산을 하나로 묶어 주는 역할
 *      C = A && B
 *      C = A || B
 *      C = !A
 *   할당(우측값을 좌측으로 준다.) : C = K
 *   기타 : 초기값 지정(??)
 *
 * - 2진수(Binary), 8진수(Octet), 10진수(Decimal), 16진수(Hex)
 *       0b10
 *       0o10
 * (기본)   10
 *       0x10
 *
 * 2진수(0, 1)
 * 8진수(0, 1, 2, 3, 4, 5, 6, 7)
 * 10진수(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
 * 16진수(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F)
 *
 * 진법 간 숫자 범위
 * 2진수   10진수   16진수
 *    0        0       0
 *    1        1       1
 *   10        2       2
 *   11        3       3
 *  100        4       4
 *  101        5       5
 *  110        6       6
 *  111        7       7
 * 1000        8       8
 * 1001        9       9
 * 1010       10       A
 * 1011       11       B
 * 1100       12       C
 * 1101       13       D
 * 1110       14       E
 * 1111       15       F
 *
* 0001 0101 0101 -  2진수
 *    1    5    5 - 16진수
 *
 * AND 3 & 4
 *      011
 *    & 100
 *    -----
 *      000
 *
 * OR  3 | 4
 *      011
 *    | 100
 *    -----
 *      111
 *
 * XOR 3 ^ 4
 *      011
 *    ^ 100
 *    -----
 *      111
 *
 * INVERSE ~3
 *      011
 *  ~ -----
 *      100
 *
 * Left-Shift
 *      011
 * << 2 ----
 *     1100
 *
 * Right-Shift
 *      011
 * >> 2 ----
 *      000
 *
 * Unsigned Right-Shift
 *      011
 * >>> 2 ---
 *     1100
 */
void main() {
  // 임의의 숫자 두 개 X, Y를 더하고,
  // 그 결과물을 C라는 변수에 담아서
  // 이전의 변수 X 보다 큰지 비교 하시오.
  int X = 10;
  int Y = 20;
  int C = X + Y;
  bool cBiggerThanX = C > X; // 틀린건 아님 : X < C;

  print(cBiggerThanX);

  bool cLessThanY = C < Y; // false
  print(cLessThanY);
  print('cLessThanY : $cLessThanY');
  bool isTrueBoth = !(cBiggerThanX && cLessThanY);

  print(isTrueBoth);

  int? notNull = null;
  print(notNull);

  // 초기 값 방법 1. ?? 사용 (축약)
  int initialized = notNull ?? 10;

  // 초기 갑 방법 2. if 사용
  if (notNull != null) {
    initialized = notNull;
  } else {
    initialized = 10;
  }

  // 좌측 쉬프트 한 번씩 할 때마다 X2 = 10진수 규칙
  const int bin1 = 1 << 0; // 1 = 0001
  const int bin2 = 1 << 1; // 2 = 0010
  const int bin3 = 1 << 2; // 4 = 0100
  const int bin4 = 1 << 3; // 8 = 1000
  const int bin5 = 1 << 4; // 16 = 0001 0000
  print(bin5);

  // AND : A & B
  // OR : A | B
  int ten = 10; // 1010

  // 2번째 비트가 1인가? => AND
  bool isSet = ten & bin2 == bin2; // 1010 & 0010 = 0010
  bool isSet2 = ten & 7 == 7; // 1010 & 0111 = 0010
  //  1110 1010
  //& 0110 0110
  //= 0110 0010

  // isSet 함수
  bool isSetTest(int src, int test) {
    return src & test == test;
  }

  bool isSetResult = isSetTest(ten, bin2); // 1010 , 0010

  print(isSetResult);
  print(10 & 2);

// 3번째 비트를 1로 만드시오. => OR
  int N = ten | bin3; // 1010 | 0100 = 1110
  //  1110   1010
  //| 0110   0110
  //= 1110   1110
  print(N);

  // 마스킹(Masking) : 특정 갯수 비트만 남기고, 나머지는 0으로 만드는 기술
  // e.g. 만약, 4개 비트만을 취급하고 싶다.
  // 나머지는 무의미하다. 4개 비트만 골라내시오.
  int value = 89; // 0101 1001
  int mask1 = bin4 + bin3 + bin2 + bin1;  // 1111 => 각 비트가 서로 겹치지 않을 때
  int mask2 = bin4 | bin3 | bin2 | bin1;; // 1111 => 각 비트가 서로 겹쳐질 때 + 각 비트가 서로 겹치지 않을 때
  int masked =  value & mask2; // 0101 1001 & 0000 1111 = 0000 1001
  //  0101 1001
  //& 0000 1111
  //= 0000 1001

  // !!비트 연산시 중요하상!!
  // - 비트 기호 상수로 계산식 처리할 것 (e.g. 그 비트가 1인지 아닌지 등)
  // - 기호 상수의 이름을 명확하게 지을 것

  // 리터럴 vs 기호상수
  // - 리터럴(Literal, 단순상수)
  //    : 단순숫자, 단순문자열 인 상수 => 의미가 바뀌지도 않고, 의미하는 바도 없음
  // - 기호상수 (의미상수)
  //    : 상수 선언 시 상수이름에 우리가 단어들로 부여함

  // 자연수 +1씩 시키는 행위로 상수 선언한 경우 : 비트와 연관 시킬 필요 없음
  const SPRING = 0; // 00
  const SUMMER = 1; // 01
  const FALL = 2;   // 10
  const WINTTER = 3;  //11
  // 쉬프팅같은 문법들이 보이는 경우 : 각 비트를 연관 시켜야 함
  // (+옵션은 옵션인데, 두 가지 이상을 한번에 의미를 해야할 경우)
  const SPRING_BIT = 1 << 0;    // 0001
  const SUMMER_BIT = 1 << 1;    // 0010
  const FALL_BIT = 1 << 2;      // 0100
  const WINTTER_BIT  = 1 << 3;  // 1000

  int springFallSeason = SPRING_BIT | FALL_BIT;
  int allSeason = SPRING_BIT | SUMMER_BIT | FALL_BIT | WINTTER_BIT;

  print('springFallSeason : $springFallSeason'); // 0101
  print('allSeason : $allSeason'); // 0000 1111
}

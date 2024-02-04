// 임포트 사용 방법
// 입출력 관련 모음
// stdout.write() 줄바꿈없이 출력
import 'dart:io';
import 'dart:math';
/**
 * DART로 프로그래머스 문제 : https://school.programmers.co.kr/learn/challenges
 */
void main() {
  // 나이 출력 : https://school.programmers.co.kr/learn/courses/30/lessons/120820
  // 머쓱이는 40살인 선생님이 몇 년도에 태어났는지 궁금해졌습니다.
  // 나이 age가 주어질 때, 2022년을 기준 출생 연도를 return 하는 solution 함수를
  // 완성해주세요.
  // 나이 age, 40살 => 2022년을 기준 출생 연도
  // r = x + y
  // 2022 = 40 + y
  // 2022 - 40 = y
  int age = 40; // 선언
  int result = 2022 - age + 1; // 선언과 동시에 초기화 + 연산
  age = 40;
  result = 2022 - age + 1;

  // 배열의 평균값 : https://school.programmers.co.kr/learn/courses/30/lessons/120817
  // 정수 배열 numbers가 매개변수로 주어집니다.
  // numbers의 원소의 평균값을 return하도록 solution 함수를 완성해주세요.
  // 배열 : 1, 2, 3, 9, 5, 6, 7, 8, 9, 10
  // 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = SUM, SUM / COUNT = AVERAGE

  //초기화
  List<int> list = [
    for (int i = 0; i < 10; i++)
      // 여기에서 코드블럭(`{ ... }`)을 사용하면, 코드블럭이 아니라
      // Set 자료구조를 사용하는 것으로 이해
      // 1. {}
      // 2. Set.from([i])
      // 3. <int>{ i }
      i
  ];

  // 합계
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    // == sum += list[i];
    sum = sum + list[i];
  }

  // 평균 값
  // int/double 일 때(num 타입) 나누게되면, double 타입 결과물
  //   => 자연스러움, 왜? 소수점도 데이터라서 중요함
  // 그 결과물을 int로 얻고 싶었다 => toInt() 호출하게 될 것임
  //   => 축약 문법으로 나눈 후 정수화(`~/`) 연산자 사용
  int average = sum ~/ list.length; //(sum / list.length).toInt();

  // N의 배수 : https://school.programmers.co.kr/learn/courses/30/lessons/181937
  // 문제 변형 : N의 배수를 20개를 배열에 담아서 출력 => 당연히 중복없음

  // 초기화 방법 1
  // index는 0부터 시작되므로, index + 1 값으로 초기화 => 1~20
  List<int> multiples = List.generate(20, (index) => index + 1);
  int N = 8;
  for (int i = 0; i < multiples.length; i++) {
    multiples[i] = multiples[i] * N;
  }

  // 초기화 방법 2
  multiples = [];
  for (int i = 0; i < 20; i++) {
    // Index 예외발생 : 지금 초기화된 리스트는 완전히 비어있는 상태
    // multiples[i] = i * N;
    multiples.add(i * N);
    // 값 삽입 : List.insert(index, value);
    // 값 추가(리스트의 끝에) : List.add(value);
  }

  // 일반적인 다른 언어의 방법
  for (int i = 0; i < multiples.length; i++) {
    print("${multiples[i]} ");
  }
  // DART 에서는 변수를 주면 문자열로 출력
  print(multiples);

  // 구구단 출력
  // 2X1=?  3X1=?  ... 9X1=?
  // ...    ...    ... ...
  // 2X9=?  3X9=?  ... 9X9=?
  //
  // 방법1. import 'dart.io'; + stdout.write 함수 사용
  //       std : 표준(Standard) , out : 출력 => 모니터가 표준출력
  //       std : 표준(Standard) , in : 입력 => 키보드가 표준입력
  //       표준 입력/출력이라는 것이 있더라...
  for (int i = 1; i <= 9; i++) {
    String printMesssage = "";

    // 중첩 for문 : 바깥 for문이 1번 수행될 때, 안쪽 for문은 N번 수행
    for (int j = 1; j <= 9; j++) {
      // 1X1
      // 1X2
      // 1X3 ...
      // print("${ j }X${ i }=${ i*j }");

      // 1X1
      // 2X1
      // 3X1 ...
      //print("${ j }X${ i }=${ i*j }");

      // print 함수의 특성은 ENTER(`\n`) 자동 추가
      // 그래서, 문자열 결합으로, 문자열을 일단 구성
      printMesssage += "${j}X${i}=${i * j} ";
    }
    // 안쪽 for문이 빠져나올 때 출력
    print(printMesssage);
  }

  // 랜덤한 수 출력
  // import 'dart:math'; 필요
  Random random = Random();
  int rand1 = random.nextInt(1000); //-1000 ~ 1000
  // 2^53 : RangeError (max): Must be positive and <= 2^32: Not in inclusive range 1..4294967296: 9007199254740992
  int rand2 = random.nextInt(pow(2, 32).toInt()) % 1001; // 위의 값과 범위가 같음
  // 범위 조정 시 알아야할 필수 규칙
  // 나머지(`%`) 연산자의 규칙 : 나누는 수(N)를 넘지 않음 => 0 ~ N-1
  // 나머지 연산자에 덧셈(`+`) 연산자 사용 : 쉬프팅 연산이 됨
  //                                     (A+S ~ B+S)
  rand1 = rand1.abs(); // 무조건 양수로 만들기 => 절대값 abs 함수

  // 위키피디아 에라토스테네스의 체 : https://ko.wikipedia.org/wiki/%EC%97%90%EB%9D%BC%ED%86%A0%EC%8A%A4%ED%85%8C%EB%84%A4%EC%8A%A4%EC%9D%98_%EC%B2%B4
  List<int> eratosthenes = [for (int i = 1; i <= 100; i++) i];
  // 소수판별 및 출력 => 소수인 것만 출력
  for (int i = 0; i < eratosthenes.length; i++) {
    final value = eratosthenes[i];

    // 조건식 관리가 어려움
    // 문제 발생 시 조건식들을 모두 확인해야 함
    // if( ... ) { print(eratosthenes[i]); }

    // 필터링(Filtering) : 내가 원하지 않는 값들을 제외 => 조건 관리가 쉬워짐
    // if( ... ) { continue; }
    if (value == 1) {
      continue;
    }
    // A % N => A를 N나누었을 때 나머지 값이 있는가?
    //       => 0~N-1까지만 범위
    //       => 0이 되는 시점 == N의 배수일 때
    //          0아닌 경우가 되는 시점 == N의 배수가 아님
    if (value != 2 && value % 2 == 0) {
      continue;
    }
    if (value != 3 && value % 3 == 0) {
      continue;
    }
    if (value != 5 && value % 5 == 0) {
      continue;
    }
    if (value != 7 && value % 7 == 0) {
      continue;
    }
    // 짧은 조건 확인(Short-Predication)
    //   : 논리연산으로 묶었을 때 이전의 조건이 관계연산에서부터 틀렸다면,
    //     뒤의 관계연산 확인은 생략됨
    print(value);
  }

  // 삼각형 출력 : 정방향 삼각형, 역방향 삼각형
  // 정방향 => (통과시) 역방향
  for (int i = 0; i < 5; i++) {
    // + : 연결 의미
    String star = "";
    for (int j = i; j >= 0; j--) {
      // print(star * i);
      star += "*";
    }
    print(star);
  }
  // 역방향
  // ++i, --i : 전치 덧셈/뺄셈(1만큼만) => 덧셈/뺄셈하고 난 후 다음 줄로 감 => 현재 행부터 값 바뀜
  // i++, i-- : 후치 덧셈/뺄셈(1만큼만) => 다음 줄로 간 다음 덧셈/뺄셈 => 현재 행에서는 값 동일
  for (int i = 5; i > 0; i--) {
    // + : 연결 의미
    String star = "";
    for (int j = i; j >= 0; j--) {
      // print(star * i);
      star += "*";
    }
    print(star);
  }

  // 삼각형 그리기 분석
  // / 0 1 2 3 4  -- +1 열 => 안쪽 for구문
  // 0 V V V V V   | (0,0) (0,1) (0,2) (0,3) (0,4)
  // 1 V V V V 0   | (1,0) (1,1) (1,2) (1,3) (1,4)
  // 2 V V V 0 0   | (2,0) (2,1) (2,2) (2,3) (2,4)
  // 3 V V 0 0 0   | (3,0) (3,1) (3,2) (3,3) (3,4)
  // 4 V 0 0 0 0   | (4,0) (4,1) (4,2) (4,3) (4,4)
  // 행           +1 => 바깥쪽 for구문
  //
  // ====> 각 위치의 규칙 유추하기
  // 정수를 나선형으로 배치하기 : https://school.programmers.co.kr/learn/courses/30/lessons/181832
  // 2차원 배열
  const int row = 5;
  const int column = 5;
  var matrix = List.generate(
    row,// 1개가 있을 때
        (index) => List.generate(
      column, // y개 들어 있음
          (index) => 0,
    ),
  );
  // 접근 - 값 가져오기 : [x][y] 라고 할 때, x가 1개당 y개 있음
  // var first = matrix[0][0];
  int value = 1;
  int top = 0,// 상단 위치
      bottom = row - 1,// 하단 위치
      left = 0, // 좌측 위치
      right = column - 1;// 우측 위치

  // /	 0	 1	 2	 3	 4
  // 0	 1	 2	 3	 4	 5 => 1씩 증가
  // 1	16	17	18	19	 6 |
  // 2	15	24	25	20	 7 |
  // 3	14	23	22	21	 8 |
  // 4	13	12	11	10	 9 |
  //   1씩 감소         1씩 증가
  while(top <= bottom && left <= right) { // 우측하단 위치에 도달했을 경우
    // 좌측 > 우측 방향 : 상단 채우기
    for(int i = left; i <= right; i++) { // 1씩 증가
      matrix[top][i] = value++;
    }
    top++; // 상단을 한칸 안쪽으로 이동

    // 상단 > 하단 방향 : 우측 채우기
    for(int i = top; i < bottom; i++) { // 1씩 증가
      matrix[i][right] = value++;
    }
    right--; // 우측을 한칸 안쪽으로 이동

    // 우측 > 좌측 방향 : 하단 채우기
    for(int i = right+1; i >= left; i--) { // 1씩 감소
      matrix[bottom][i] = value++;
    }
    bottom--;

    // 하단 > 상단 방향 : 좌측 채우기
    for(int i = bottom; i >= top; i--) {
      matrix[i][left] = value++;
    }
    left++;
  }

  for(int i = 0; i < row; i++) { // 1씩 증가
    String printMessage = "";
    for(int j = 0; j < column; j++) {
      // padLeft : 2 => 2자리수, '0' => 자리수가 모자랄 때 문자 0으로 채움
      // 01 02 03 ...
      printMessage += "${ matrix[i][j].toString().padLeft(2, ' ') } ";
    }
    print(printMessage);
  }

}

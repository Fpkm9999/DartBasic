// ignore: slash_for_doc_comments
/**
 * ===========================================================
 * fileName       : enumExample1
 * date           : 2024-02-13
 * description    : 간단한 열거형 예제
 * ===========================================================
 */
enum Status {
  approved, // 승인
  pending, // 대기
  rejected, // 거절
}
// String으로 하면 이거 말고도 할 수 있음.
// 열거형으로 하면 위 3가지 값만 존재 하도록 정의함(강제함)

void main() {
  Status status = Status.approved; // status 변수를 Status.approved 로 초기화
// String status = 'approved'; 이것도 됨
  if (status == Status.approved) {
    print('승인입니다.');
  } else if (status == Status.pending) {
    print('대기입니다.');
  } else {
    print('거절입니다ㅏ.');
  }
  print(status.runtimeType);  // Status 타입
}

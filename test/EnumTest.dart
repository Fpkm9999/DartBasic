enum Status{
  approved, // 승인
  pending,  // 대기
  rejected, // 거절
}// String으로 하면 이거말고도할수있음. enum은 이 3개만 존재하도록 정의함(강제함)

void main() {
  Status status = Status.approved;
// String status = 'approved'; 이것도 됨
  if (status == Status.approved) {
    print('승인입니다.');
  } else if (status == Status.pending) {
    print('대기입니다.');
  } else {
    print('거절입니다ㅏ.');
  }
}
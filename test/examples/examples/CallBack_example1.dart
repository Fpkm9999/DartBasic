/**
 * ===========================================================
 * fileName       : CallBack_example1
 * date           : 2024-02-18
 * description    :
 * ===========================================================
 */

// 타이머를 구현하고 타이머가 완료되었을 때 호출되는 콜백 함수
void timerCallback() {
  print('타이머가 완료되었습니다!');
}

void startTimer(int seconds, Function callback) {
  print('$seconds 초 후에 타이머가 시작됩니다.');
  Future.delayed(Duration(seconds: seconds), () {
    // 주어진 시간(seconds) 후에 콜백 함수를 호출합니다.
    callback();
  });
}

void main() {
  // 3초 후에 타이머가 시작되고, 타이머가 완료되면 timerCallback 함수가 호출됩니다.
  startTimer(3, timerCallback);
  print('타이머 시작');
}
/*
 startTimer 함수는 주어진 시간(초)이 지난 후에 콜백 함수를 호출하는 비동기적인 타이머를 설정합니다. timerCallback 함수는 타이머가 완료되었을 때 호출됩니다. 이렇게 하면 주어진 시간이 경과된 후에 특정 작업을 실행할 수 있습니다.

startTimer 함수를 호출할 때 timerCallback 함수를 인수로 전달하여 콜백 함수로 사용합니다. 그리고 startTimer 함수 내에서는 Future.delayed를 사용하여 주어진 시간이 경과한 후에 콜백 함수를 호출합니다.

이러한 방식으로 콜백 함수를 사용하면 특정 조건이나 시간에 도달했을 때 원하는 작업을 실행할 수 있습니다.
 */

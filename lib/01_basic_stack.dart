import 'package:flutter/widgets.dart';

// Stack : 겹쳐서 좌표로 표시 하는 위젯
// 자식을 겹침
class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 이 위젯을 호출 하는 쪽에서 크기가 지정된 경우:
    //  > 그 떄는 여기서 크기 지정할 필요 없음
    //  > 위젯 스스로가 크기를 결정하지 않을 때, 즉, 영역을 부여 받을 때
    // 이 위젯을 호출 하는 쪽에서 크기를 지정 하지 않은 경우 :
    //  > 이 떄는 여기서 크기 지정을 해줘야 함
    //  > 위젯 스스로가 크기를 결정할 때

    return Stack(
      children: [
        Positioned(
          // left, top : 기본 지정 => X,Y 좌표
          // (left, top ) + (right, bottom) : 모든 점마다 절대 좌표
          // (left, top ) + (width, height) : 끝나는 지점을 상대 좌표
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0xFF, 0xFF, 0x0, 1.0),
            ),
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 50,
          // left, top : 기본 지정 => X,Y 좌표
          // (left, top ) + (right, bottom) : 모든 점마다 절대 좌표
          // (left, top ) + (width, height) : 끝나는 지점을 상대 좌표
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0xFF, 0x0, 0xFF, 1.0),
            ),
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';

import 'typography.dart';

class ContainerPage extends StatelessWidget {
  // // 필수 값 처리 방식
  // const BasicPage({
  //   super.key,
  //   required this.title,
  // });
  //
  // final String title;
  //
  // // 기본 값 사용 방식
  // const BasicPage({
  //   super.key,
  //   this.title = '',
  // });
  //
  // final String title;

  // Nullable 사용 방식
  const ContainerPage({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    /* 해상도 크기 단위
     * pixel(px) : 절대적 최소 단위, 스크린의 한 개 셀(R/G/B)
     * point(pt) : 상대적 최소 단위, N개 pixel은 1 point
     * 인치당 픽셀(ppi) : 인쇄 쪽에서 많이 쓰는 단위
     * 밀도(dpi) : 밀도 단위
     * local point(lp) : 디스플레이의 고유 단위
     **/

    final size = MediaQuery.of(context).size; //스크린의 전체 크기
    final width70 = size.width * 0.7; // 가로 크기의 70% 위치 값

    // 비율
    final one = 1 / 100; // 1%
    final two = 0.02; // 2%
    // 비례식으로 특정 해상도 고정하는 방법
    // 현재화면에 보이던게 1920x1080 화면에서 보여질 크기
    final widthRatioFromScreenWidth = 1920 / size.width; //width 100이라면, 결과 19.2
    final heightRatioFromScreenWidth = 1080 / size.height;
    // 1920x1080 화면에서 보여지던게 현재화면에서 보여질 크기
    final widthRatioFrom1920 = size.width / 1920;
    final heightRatioFrom1080 = size.height / 1080;

    // Container 위젯 = StatelessWidget으로 구성됨, 상수 생성자 없음
    //                 레이아웃에 대한 기본 처리들 복합 속성 위젯
    //                 (padding, margin, background/foreground, border, child)
    //
    return Container(
      // 상수 리터럴 숫자 : 고정 크기 값
      // double.infinity : 무제한 -> 특정하지 않음 -> 알아서 출력
      width: double.infinity,
      height: double.infinity,

      // 없을 경우 튀어나간 부분 그대로 노출
      decoration: BoxDecoration(
        // 박스형 장식 위젯
        color: Color.fromRGBO(0xFF, 0x0, 0x0, 1.0), //배경 빨강
        border: Border.fromBorderSide(
          // 보더 각 면 설정
          BorderSide(
            width: 1, // 보더의 선 굵기
            color: Color.fromRGBO(0x0, 0x0, 0x0, 1.0), //색상
          ),
        ),
        // 보더 라운딩 : 박스 자체를 자르는 방법
        // borderRadius: BorderRadius.all(Radius.circular(100)),
      ),

      // borderRadius 속성과 함께 사용되는 속성
      // clipBehavior: Clip.hardEdge,
      //
      // // 단일 멤버변수를 출력 방법
      // //child: Text('Hello, World $title'),
      // // 속성 출력 방법 (위의 경우든 아니든 중요한 것은 Nullable 기본 값)
      // child: Text(
      //   'Hello, World ${this.title ?? ''}\n한글\n1234',
      //   style:
      //       TextDecorator.medium().style, //TEXT_MEDIUM.copyWith(height: 1.028),
      // ),

      // ClipRRect : 자식을 직접적으로 자르는 방법
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Text(
          'Hello, World ${this.title ?? ''}\n한글\n1234',
          style:
              TextDecorator.medium().style, //TEXT_MEDIUM.copyWith(height: 1.028),
        ),
      )
    );

    // 크기만 지정하는 위젯
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Text(
        'Hello, World ${this.title ?? ''}\n한글\n1234',
        style:
        TextDecorator.medium().style, //TEXT_MEDIUM.copyWith(height: 1.028),
      ),
    );

    // 크기만 지정하는 위젯(명칭형 생성자로 위젯 사용)
    return SizedBox.fromSize(
      size: Size(0, double.infinity),
      child: Text(
        'Hello, World ${this.title ?? ''}\n한글\n1234',
        style:
        TextDecorator.medium().style, //TEXT_MEDIUM.copyWith(height: 1.028),
      ),
    );
  }
}










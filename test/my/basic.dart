import 'dart:html';

import 'package:dart_basic/typography.dart';
import 'package:flutter/widgets.dart'; // 가장 기본적인 widgets

class BasicPage extends StatelessWidget {
  const BasicPage(
      {super.key,
      // required this.title, // case1.필수값 방식 :  이 클래스를 불러올떄 title을 무조건 받도록 요구할려면 required
      // this.title = '',  // case2.기본값 방식 :  또 다른 방법으로 기본값을 사용하는 방법이 있다. '' 은 빈값이다.
      this.title // case3. Nullable 방식
      });

  // case 1, 2번 방식
  // final String title; // 이 변수는 변형이 가능한 상태였는데 final 을 붙여서 런타임 상수화시킴
  // 왜 const가 아닌 final 임? 이 클래스의 입장에선 값이 바뀔 수 있기 때문에 final임
  // main.dart 입장에서 title는 const 임

  // case 3번 방식
  final String? title;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder(); <- 여기에 위치될 꺼라는 표시만 해주는거라 매번 지워주면됨
    /*
     * 해상도 크기 단위
     * pixel(px) : 절대적 최소 단위, 스크린의 한 개 셀(R/G/B)
     * point(pt) : 상대적 최소 단위, N 개의 px은 1개의 point 취급
     * 인치 당 픽셀(ppi) : 인쇄 쪽에서 많이 쓰는 단위
     * 밀도(dpi) : 밀도 단위 *스마트폰이 보급화되면서 쓰이기 시작한 용어
     * local point(lp) : 디스플레이의 고유 단위 <-- 300x300 우리가 지정한게 lp가 기본값임
     */

    final size = MediaQuery.of(context).size; // 스크린의 전체 크기
    // https://m.blog.naver.com/chandong83/221890678439
    final width70 =
        size.width * 0.7; // 가로 크기의 70 % 위치 값. 스크린 크기의 70%만 사용할려면 이 변수를 사용하면 됨.

    // 비율
    final one = 1 / 100; //  1%
    final two = 0.02; // 2%

    // 가로랑 세로를 정확하게 할려면
    // 비례식으로 특정 해상도를 고정하는 방법 => 현재 화면에 보이던게 1920x1080 화면에서 보여질 크기
    final widthRatioFromScreenWidth = 1920 /
        size.width; // 만약 width 100 이라면, 결과는 19.2 -> 1920 기준으로 할려면 19.2배로 해야된다.
    final heightRatioFromScreenWidth = 1080 / size.height;

    // 반대로도 가능함 (이걸 더 많이 사용함)
    // 1920x1080 화면에서 보여지던게 현재화면에서 보여질 크기를 결정하는 방법
    final widthRatioFrom1920 = size.width / 1920;
    final heightRatioFrom1080 = size.height / 1080;

    // Container 위젯 = stateless 위젯으로 구성됨, 상수 생성자가 없음
    //                  레이아웃에 대한 기본 처리들 복합 속성 위젯
    //                  (padding, margin, background/foreground, child,border)
    return Container(
        // 상수 리터럴 숫자 : 고정 크기값을 주는 거임
        // double.infinity : 무제한 크기를 주겠다는 거임. -> 크기를 특정하지 않겠다 -> 알아서 출력해라라는 의미
        // e.g) width: double.infinity,
        // -> 다만 스크롤 뷰와 같은 상대적인 값이 필요한 경우는 사용할 수 없음.
        // 300x300 에 해당 텍스트를 그린다. 근데 기본 크기단위를 지정하지 않았는데 단위가 무엇일까? lp다
        // width: , : 가로
        // margin: , : 이 컨테이너의 바깥쪽 여백
        // padding: , : 이 컨테이너의 안쪽 여백
        // decoration: , : color 외에 추가적으로 꾸밀때
        // width: 300,
        // height: 300,
        width: double.infinity,
        height: double.infinity,
        // clipBehavior: Clip.hardEdge,
        // 튀어나온 글자를 안보이게 // 없을 경우 튀어 나간 부분 그대로 노출됨
        decoration: BoxDecoration(
          // 박스형 장식 위젯
          color: Color.fromRGBO(0x9F, 0xEC, 0xA7, 1.0), // 배경은 빨강색 // 배경 빨강
          border: Border.fromBorderSide(
            // 보더 각 면 설정
            BorderSide(
              width: 1, // 보더의 선 굵기
              color: Color.fromRGBO(0x00, 0xFF, 0xFF, 1.0), // 보더의 색상
            ),
          ),
          // 보더의 라운딩
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        // 멤버변수를 출력 하는 방식으로 제목을 가져오는 방식이 있다.
        // 단일 멤버변수를 출력 방법
        // child: Text('Hello, world $title '),
        // case2. 속성 출력 방법 (위의 경우든 아니든 중요한 것은 Nullable 기본 값)
        child: Text(
          'Hello, world ${this.title ?? ''} ',
          style: TEXT_MEDIUM,
          // TextStyle( //이렇게도 가능하나 클래스하나 파서 설정된값을 import해서 사용하는 경우가 대다수임
          //   color: Color.fromRGBO(0xFF, 0xFF, 0x0, 1.0),
          //   decoration: TextDecoration.none,
          // ),
          // ), // null은 0이 아닌 null이라는 객체가 들어있는거임. title변수가 null상태라면 null이라는 문자열이 여기에 찍히게 됨 그래서 기본값 ''을 해줘야 함
          //   child: ClipRect(
          //     borderRaidus: BorderRadius.all(Radius.circular(100))
          //     child: Text(
          //   'Hello world ${this.title ?? ''}\n한글\n1234',
          //     style:
          //     TextDecorator
          //         .medium()
          //         .style,
          //   ),
          // )
          // ); // 여기에 치는
          // widget 트리에 반영된다.
        ));
    // return SizedBox.fromSize(
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: Text(
    //     'Hello world ${this.title ?? ''}\n한글\n1234',
    //     style:
    //     // TextDec,
    //
    //   ),
    // )
    // return SizedBox.fromSize(
    //   size: Size(0,double.infinity),
    //   child: Text(
    //     style:
    //     TextDetector.medium().style,
    //   ),
    // );
  }
}

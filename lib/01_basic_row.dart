import 'package:dart_basic/typography.dart';
import 'package:flutter/widgets.dart';
import '01_basic_first_section.dart';
// import '01_basic_second_section.dart';
// import '01_basic_third_section.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 이 화면에서 전역적 계산
    final size = MediaQuery.of(context).size; //스크린의 전체 크기
    final height70 = size.height * 0.7; // 가로 크기의 70% 위치 값

    // 여기에 const 키워드로 상수 처리해버린다면,
    // 내부 속성을 모두 상수여야만 한ㅁ
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        // 주축(Main Axis) : 가로 방향
        // 부축(Cross Axis) : 세로 방향
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 영역 나누니 : 파일로 별도 분리해주는 방법
          //  -> 위젯이 좀 비대하다 싶을때
          //  -> 이 위젯이 재사용될 때 (복사해서 재사용 안함) -> 템플릿 사용
          FirstSection(),
          // 영역 나누기 : 한 개 파일에서 메소드로 위젯을 분리해주는 방법
          // Expanded(child: FirstSection()), // 펼친다
          Expanded(child: secondSectinon),
          // Expanded(child: ThirdSection()),
          Expanded(
            child: thirdSectinon(
              context: context, // 지역적 계산
              parameter: "전달 값",
            ),
          ),
          // Text('1번'),
          // Text('2번'),
          // Text('3번'),
        ],
      ),
    );
  }

  // 파일로 따로 분리하기가 부담스러울 때 분리 방식
  Widget get secondSectinon {
    // 이 화면에서 지역적 계산
    return Container(
      // 현재 이녀석은
      color: Color.fromRGBO(0x40, 0xFF, 0x00, 1.0),
      child: Text(
        '2번',
        style: TextDecorator.medium().style,
      ),
    );
  }
}

// 파일로 따로 분리하기가 부담스러울때 분리 방식
// +@ 파라미터도 전달해주고 싶을 때
Widget thirdSectinon( // 강사스타일 :
    // BuildContext 를 파라미터로 받아주고, Widget을 반환해서
    // 위젯 생성
    {
  required BuildContext context,
  String parameter = "기본 값",
}) {
  return Container(
    // 현재 이녀석은
    color: Color.fromRGBO(0x40, 0x00, 0xFF, 1.0),
    child: Text(
      '3번 ${parameter}',
      style: TextDecorator.medium().style,
    ),
  );
}

// class FirstSection extends StatelessWidget {
//   const FirstSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Color.fromRGBO(0xF8, 0x34, 0x34, 1.0),);
//   }
// }
// class SecondSection extends StatelessWidget {
//   const SecondSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Color.fromRGBO(0x40, 0xFF, 0x00, 1.0),);
//   }
// }
// class ThirdSection extends StatelessWidget {
//   const ThirdSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Color.fromRGBO(0x56, 0x00, 0xFF, 1.0),);
//   }
// }

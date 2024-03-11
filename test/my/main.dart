import 'package:flutter/material.dart';

import 'basic.dart';

void main() {
  // 모든 프로그램의 시작
  runApp(const MyApp()); // MyApp()의 인스턴스를 시작

//   runApp(
//     Container(
//       color: Colors.amber,
//     )
//   ); // 이렇게 하면 흰 화면만 나옴. 라우팅기능이나 여러가지 기본적인 기능도 없어 만들어줘야함. 기본앱이나 머터리얼등은 다 있음 <- widgets.app 위에 추가된것들임
// }
}


// 트리 :
// => 위젯 트리 : 뷰를 그리기 전에 만들어 놓은 트리이다.
// stateless 위젯의 특징 : 대부분의 생성자가 const를 가짐 -> 생성되고 나면 상수가됨. + 멤버는 모두 상수멤버임
class MyApp extends StatelessWidget {
  // 위젯에는 바뀌지 않는 값만 들어있다. state 객체에 값이 변하는 녀석들만 들어있다.
  // StatelessWidget 을 상속받은 클래스 : 이 클래스에서는 바뀌는 값이 없는 클래스 , final, const는 가질 수 잇다. int member1= 20 그런 수는 있을 수 없다
  const MyApp({super.key}); // 여기도 const가 붙는 이유가 됨

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 화면렌더링할때 build를 호출하여 위젯틀을만듬
    // MaterialApp을 리턴하는게 다임.
    // build가 실행되면 위젯틀이 생성됨(화면을 어떻게 그려라는 그런 동작들)
    return MaterialApp(
      // MaterialApp 가 리턴되는거봐선 머테리얼앱을 쓰는구나
      title: 'Flutter 1111',
      // 이 title는 어디에든 다 있음 // e.g // widgets / Material / Cupertino
      // title, theme,colorscheme,usematerial3가 머테리얼앱의 속성임 <-- ㅈㄴ 많아서 외우진 마셈. 자주 쓰이는건 알아두면 좋음 거의 쓰는것만 씀

      // Material / Cupertino
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      // Widghets . material / Cupertino
      home: const BasicPage(
          title:
              'Flutter Demo Home Page:999'), // 이건 셋다 있다. // 화면을 navigate 할 떄 최초로 뜨는 화면
      // home: 는 실행할때 가장 처음으로 뜰거를 여기서 설정
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   //StatefulWidget 을 상속하면서, required this.title도 넘겨받음
//   // stateful을 가지니까 값이 변할수 있는 멤버들이 있다.
//   const MyHomePage(
//       {super.key,
//       required this.title}); // 근데 왜 const?. -> 얘의 위젯은 안바뀌니까 const임. stateful위젯자체는 const .
//   // stateful위젯의 그 하위 에 호출되는것들이 변할수있는거임

//
//   // 일반적인 상황 : 위젯을 호출하는 측에서 전달해주는 값들을 final 로 선언
//   // 특이한 상황 : final 이 아닌 멤버가 있는 경우도 있음 ( e.g Container)
//   final String title; // title이라는 멤버 상수에 받은 값을 여기에 저장함
//
//   // 위젯 트리 구성할 때 호출되는 콜백 메소드
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // State<MyHomePage> 라는 상태라는 녀석을 상속받음
//   // 얘가 실질적으로 바뀌는 부분임. 그위에 녀석들은 const임
//   int _counter = 0;
//
//   // 상태 객체 생성 시 1회만 호출 //
//   // 여기서, mounted == false 이다.
//   // => 이 단계에서는 위젯 트리에 붙지 않은 상태.
//   // => initState : 초기화용으로 지원되는 콜백 메소드
//   //                  (상태 객체 생성 시 1회만 호출)
//
//   // mounted : 위젯 트리에 붙어있는가?
//   //
//   // mounted 가 false 일 경우 setState 호출 불가능 상태
//   // mounted가 true : setState 호출 가능 상태
//   // mounted가 false : setState 호출 불가능 상태
//   // => 트리에 붙어있을 때만 화면 갱신 가능 => 트리가 구성되었다는 것은 화면에 보여지는 상태임
//   @override
//   void initState() {
//     // 상태 객체 초기화 작업
//     if (mounted) {
//       // initState상테에서 mounted는 필연적으로 false 이다.
//       // mounted가 true : setState 호출 가능 상태
//       // mounted가 false : setState 호출 불가능 상태
//     }
//     super.initState();
//   } // 상태 변수
//
//   void _incrementCounter() {
//     // setState : 화면 갱신용 비동기 메소드. 언제 호출될 지 모르니까 비동기
//     //                        (반영 시기는 다음 프레임에 반영)
//     // setState() 메소드 안에서 실행되니까 값이 바뀔 수있는거임. 더티상태임. setState()메소드 가 호출되면 counter가 증가함 -> 거쳐서 거쳐서 화면을 다시 그려야 하겠구나 뭐
//     // => 잘못된 시기에 setState 호출 시 예외 발생
//     // => 화면에 보여질 때만 setState를 호출
//
//     // 작성법 1
//     if (mounted) {
//       // 여기서 mounted를 사용하면 화면이 보여지고 있는지를 알아낼 수 있다.
//       setState(() {
//         // setState() 메소드는 화면이 보일 때만 사용해야 함. 안보일때
//         _counter++;
//       });
//     }
//   } //여기서 값이 뭐가 바뀌는지 볼려면 setState()메소드를 검색해 보면된다. // setState() 함수는 비동기 함수임(async,await)
//
// //  작성법2
//     // if(!mounted){
//     //   return;
//     // }
//     // setState((_counterPlus1());
//   // }
//   // void _counterPlus1() {
//
//
//   // 결론은 setState() 메소드는 화면을 갱신하는 메소드라고 보면 될 거같다.
//   @override
//   Widget build(BuildContext context) {
//     // 이게 호출는떄는 setstate()가 호출되면 다시 build()가 실행됨(변한게있으면 다시 그림)
//
//     return Scaffold(  // 골격. 앱에서 골격이라는 말은 사실 없다. 이걸 실행하면 앱바(타이틀바)가 생김
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Hello world 123 :',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter, //
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

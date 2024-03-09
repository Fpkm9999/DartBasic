import 'package:flutter/material.dart';

void main() {
  runApp(CustomApp());
}

// stl : statelessWidget : 기본 코드 스니펫 생성기
// stf : StatefulWidget : 기본 코드 스니펫 생성기

class CustomApp extends StatelessWidget {
  // stle 치고
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromRGBO(0, 0, 0, 0.0),
      title: 'Title, Hello, World1',
      home: Scaffold(
        body: Text(',Body, Hello, World1'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

// return WidgetsApp(
//   color: Color.fromRGBO(0, 0, 0, 0.0),
//   initialRoute: '/',
//   routes: <String, WidgetBuilder>{  // WidgetBuilder == Widget Function(BuilderContext)
//     '/': (buildContext) => const HomePage(),
//   },
//   onGenerateRoute: (settings) {
//     return PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation)
//     {
//       return const HomePage();
//     },
//   },
// );
//   // }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Text('Hello, World');
//   }
// }

import 'package:flutter/material.dart';

void main() {
  // 모든 프로그램의 시작
  runApp(const MyApp());  // MyApp()의 인스턴스를 시작
}
    
// stateless 위젯의 특징 : 대부분의 생성자가 const를 가짐 -> 생성되고 나면 상수가됨. + 멤버는 모두 상수멤버임
class MyApp extends StatelessWidget {
  // StatelessWidget 을 상속받은 클래스 : 이 클래스에서는 바뀌는 값이 없는 클래스 , final, const는 가질 수 잇다. int member1= 20 그런 수는 있을 수 없다
  const MyApp({super.key}); // 여기도 const가 붙는 이유가 됨

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { // MaterialApp을 리턴하는게 다임.
    // build가 실행되면 위젯틀이 생성됨(화면을 어떻게 그려라는 그런 동작들)
    return MaterialApp(
      // MaterialApp 가 리턴되는거봐선 머테리얼앱을 쓰는구나
      title: 'Flutter Demo',
      // title, theme,colorscheme,usematerial3가 머테리얼앱의 속성임 <-- ㅈㄴ 많아서 외우진 마셈. 자주 쓰이는건 알아두면 좋음 거의 쓰는것만 씀
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page:stateless'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // stateful을 가지니까 값이 변할수 있는 멤버들이 있다.
  const MyHomePage(
      {super.key,
      required this.title}); // 근데 왜 const?. -> 얘의 위젯은 안바뀌니까 const임. stateful위젯자체는 const .
  // stateful위젯의 그 하위 에 호출되는것들이 변할수있는거임

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 얘가 실질적으로 바뀌는 부분임. 그위에 녀석들은 const임
  int _counter = 0;

  @override
  void initState() { // 상태 객체 초기화 작업
    if(mounted){
      // mounted가 true : setState 호출 가능 상태
      // mounted가 false : setState 호출 불가능 상태
    }
    super.initState();
  } // 상태 변수

  void _incrementCounter() {
    setState(() {
      // setState() 메소드 안에서 실행되니까 값이 바뀔 수있는거임. 더티상태임. setState()메소드 가 호출되면 counter가 증가함 -> 거쳐서 거쳐서 화면을 다시 그려야 하겠구나 뭐
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

  } //여기서 값이 뭐가 바뀌는지 볼려면 setState()메소드를 검색해 보면된다. // setState() 함수는 비동기 함수임(async,await)

  // 결론은 setState() 메소드는 화면을 갱신하는 메소드라고 보면 될 거같다.
  @override
  Widget build(BuildContext context) {
    // 이게 호출는떄는 setstate()가 호출되면 다시 build()가 실행됨(변한게있으면 다시 그림)
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
      return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello world 123 :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, //
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

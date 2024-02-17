import 'package:flutter/widgets.dart';

/// - 인터페이스 vs 믹스인
///   공통 : 메소드 구현 제약(구현 요구), 다중 구현, 추상 메소드
///   인터페이스 : 추상 프로퍼티 없음, 구현 가능한 시점 제약 없음(on 키워드 없음)
///               implements 키워드 사용, 메소드에 있는 몸체는 모두 무시
///   믹스인 : 추상 프로퍼티 있음, 구현 가능한 시점 제약 있음(on 키워드 사용)
///           with 키워드 사용, 기본 메소드(몸체있는 메소드) 선언 가능
///
///   - 어차피 메소드 제약이면, 액세서도 메소드 아닙니까?
///   - 인터페이스에다가 abstract int get~(), abstract void set~() 하면 되지 않나요?
///   DART에서는 get, set 키워드가 있음 => getter, setter
///   DART에서는 mixin 기능으로 만들어주자!
class Canvas {
  void draw(Paint paint) { /* 무언가를 그린다. */ }
}
class Paint { /* 색상 등 설정 값만 지님 */ }
mixin PaintMixin { // 붓 역할
  Paint get paint; // 페인트 객체를 가질 수 있도록 강제
  int foregroundColor = 0;// 내부적으로 가지는 프로퍼티도 가능 => 액세서 겹침 => 동일한 필드
  int _backgroundColor = 0;// private 멤버는 자동 프로퍼티 없음 => CanvasMixin과 다른 변수로 취급
}
mixin CanvasMixin on PaintMixin { // 도화지 역할
  Canvas get canvas; // 도화지 객체를 가질 수 있도록 강제
  // 믹스인에서 이런 식으로 변수를 초기화 했다 => 액세서까지 자동 구현 => 프로퍼티
  // 프로퍼티가 됬다? => 액세서에 대해 오버라이딩 가능
  int foregroundColor = 0;//PaintMixin에도 color가 있음 => 액세서 겹침 => 동일한 필드
  int _backgroundColor = 0;// private 멤버는 자동 프로퍼티 없음 => PaintMixin과 다른 변수로 취급
}
// 페인트(Paint 믹스인) 구현한 클래스만 여기에 선언해놓은 메소드를 사용 가능
mixin ColorPaintMixin on PaintMixin, CanvasMixin {
  // paint를 선언한적이 없지만,
  // ColorPaintMixin을 사용할 때는 PaintMixin 도 같이 구현했을 것이므로
  // paint 객체를 가져와서 사용 가능함
  void draw() { // 기본 몸체를 이미 갖고 있음 => 오버라이딩 안하더라도 호출 가능
    Canvas canvas = this.canvas;
    Paint paint = this.paint;
    canvas.draw(paint);
  }

  // 추상 메소드
  void drawByExternal(Canvas canvas, Paint paint);
}
// with 키워드로 믹스인들 사용 시 믹스인의 순서 중요!
// 서로 제약을 걸어놓은 사항이 있는데, 그 순서대로 선언해주어야 함
class MyScreen with PaintMixin, CanvasMixin, ColorPaintMixin {
  // 프로퍼티 오버라이딩
  @override
  int foregroundColor = 20;

  // CanvasMixin에 있던 제약 : 추상 프로퍼티 제약에 대해 구현
  Canvas _canvas = Canvas();
  @override
  Canvas get canvas {
    // super 는 PaintMixin, CanvasMixin, ColorPaintMixin 중 1개
    // DART에서 어느 믹스인인지 명확하게 지칭하는 기능은 없음
    // => 동일 메소드명 : 특정 믹스인의 메소드만 따로 호출하게끔 하는 것은 없음
    //    => 네이밍을 잘 지어줘야한다.
    // => 동일 필드명 : 필드에서는 이 규칙 무시해도 관계 없음
    //    => 왜? 동일한 이름의 프로퍼티는 1개로 취급하겠다.
    super.foregroundColor;
    return _canvas;
  } //_canvas;

  // PaintMixin에 있던 제약 : 추상 프로퍼티 제약에 대해 구현
  Paint _paint = Paint();
  @override
  Paint get paint => _paint;

  @override
  void drawByExternal(Canvas canvas, Paint paint) {
    // 추상 메소드로부터 받은 제약사항에 대해 구현
  }
}
void main() {
  MyScreen myScreen = MyScreen();
  Canvas canvas = myScreen.canvas;
  Paint paint = myScreen.paint;
  myScreen.draw();
  myScreen.drawByExternal(canvas, paint);
}

class MyStateful extends StatefulWidget {
  const MyStateful({super.key});

  @override
  State<MyStateful> createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> with MyFunction<MyStateful> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyStateful2 extends StatefulWidget {
  const MyStateful2({super.key});

  @override
  State<MyStateful2> createState() => _MyStateful2State();
}

class _MyStateful2State extends State<MyStateful2> with MyFunction<MyStateful2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// 제약 : 믹스익 구현여부 제약, 클래스 구현여부 제약, 인터페이스 구현여부 제약
// 믹스인을 사용하는 주된 이유 : 기능을 한 쪽으로 모아줄 수 있음, 재사용도 가능
mixin MyFunction<W extends StatefulWidget> on State<W> {
  void updateMyValue() {
    // State 추상 클래스에 구현되어있는 메소드를 호출할 수 있음
    // 이 믹스인이 클래스 구현여부 제약을 받았기 때문 => State 클래스 구현 제약
    // 인터페이스 또는 추상 클래스에서는 이런 기능이 없음
    setState((){});
  }
}


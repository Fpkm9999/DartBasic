import 'package:flutter/widgets.dart';

/// ===========================================================
/// fileName       : day14_oop_mixin
/// date           : 2024-02-17
/// description    :
/// - 인터페이스 vs 믹스인
///   공통점 : 메소드 구현에 제약을 준다.(구현하도록 요구함), 다중 구형이 가능하다 . 추상 메소드가 있다.
///   차이점 :
///      인터페이스 : 추상 프로퍼티가 없다, 구현 가능한 시점 제약이 없다. (on 키워드 없음)
///                  `implements` 키워드를 사용, 메소드에 있는 몸체는 모두 무시됨 ( 메소드 시그니처 정보만 남고 나머진 다 날라간 상태ㄱ ㅏ 됨)
///
///      믹스인 : 추상 프로퍼티가 있다, 구현 가능한 시점 제약이 있다. ( on 키워드 사용)
///                `with` 키워드 사용, 기본 메소드(몸체가 있는 메소드) 선언이 가능 하다.
///
///      다트에서는 믹스인이 인터페이스보다 조금 더 강력하고 더 많은 내용이 있어 더 활용하기 좋음
///
///      Q. 어짜피 메소드 제약이면, 액세서도 메소드 아닙니까?
///        인터페이스에다가 abstract int get~(), abstract void set~() 하면 되지 않나요?
///      A DART에서는 `get`, `set` 키워드가 이미 있음 그래서 getter, setter 를 또 만든다는게 의미가 없음.
///        그래서 DART 에서는 mixin 이라는 기능으로 만들어 주자고 해서 추상 프로퍼티를 가질 수 있게됨.
/// ===========================================================
///
class Canvas {
  void draw(Paint paint){
    /* 무언가를 그린다 */
  }
}
class Paint {
  // void draw(Canvas canvas) {
  //   /* 무언가를 그린다 */
  // }
}

mixin PaintMixin { // 붓을 가져야한다
  Paint get paint;  // 페인트 객체를 가질 수 있도록 강제 할 수 있다.
  // int color = 0;
  int foregroundColor = 0; // 내부적으로 가지는 프로퍼티도 가능
  int _backgroundColor = 0; // private 은자동 프로퍼티가 없다. => 다른 변수로 취급을 함 . 다른 액세서로 취급함 ==> 다른 변수로 인식함.
}
mixin CanvasMixin { // 페이트 객체를 가질 수 있도록 강제
  Canvas get canvas;
  // int color = 0;  // 내부적으로 가지는 프로퍼티도 가능 // PaintMixin 에도 color 가 있음 => 액세서가 겹침 => 동일한 필드라고 인식함.
  int foregroundColor = 0; // 내부적으로 가지는 프로퍼티도 가능
  int _backgroundColor = 0; // private 멤버는 자동 프로터티 없음 => PaintMixin과 다른 필드로 본다.
}

// 페인트(Paint 믹스인)를 구현한 클래스만 여기에 선언해놓은 메소드를 사용 가능
// 그리고 mixin을 구현하는 클래스이름 앞이나 뒤에 Mixin 를 붙임
mixin ColorPaintMixin on PaintMixin,CanvasMixin {  // 컬러에 대한 mixin을 선언
  // paint 를 여기다 선언한 적이 없지만,
  // ColorPaintMixin 를 사용할 떄는 PaintMixin 도 같이 구현했을 것 이므로
  // paint 객체를 가져와서 사용이 가능하다.
  void draw(){  // 기본 몸체를 이미 갖고 있음 => 오버라이딩 안하더라도 호출 이 가능함 // 기능을 여기다 구현할 수 있는게 mixin의 핵심임.
    Canvas canvas = this.canvas;
    Paint paint = this.paint;  // 다른 Mixin에서 선언한 메소드를 가져오도록 할 수 있다.
    // paint.draw();
    // CanvasMixin canvas = this.Canvas;
    canvas.draw(paint);
  }
  // 추상 메소드도 사용이 가능함. mixin에서는
  void drawByExternal(Canvas canvas, Paint paint);
}

// `With` 키워드로 믹스인들 사용 시 미그싱ㄴ의 순서 중요!
// 서로 제약을 걸어 놓은 사항이 있는데, 그 순서대로 선언 해주어야 함
class MyScreen with PaintMixin, CanvasMixin, ColorPaintMixin {
  // 믹스인에서 이런 식으로 변수를 초기화 했다. => 액세서 까지 자동 구현 => 프로퍼티
  // 프로퍼티에 대해서 오버라이딩 = > 이 말은 즉 액세서에 대한 오버라이딩이 가능해짐.
  // dart 에서는 객체를 구분하는 바업

  // CanvasMixin에 있던 제약 : 추상 프로터티 제약에 대해 구현함
  Canvas _canvas = Canvas();
  @override
  Canvas get canvas {   //=> _canvas; // super.canvas;
  // super 는 PaintM, CanvasM, ColorPM 중 1개
  // DART 에서는 어느 믹스인인지 명확하게 지칭하는 기능은 없음
  // => 특정 믹스인의 메소드만 따로 호출하게끔 하는 것은 없음
  // 결론 => 네이밍을 잘 지어줘야 한다.
  // 같은 이름이라면 먼저 선언된 녀석의 믹스인이 실행이 된다.
  // PaintMixin에 있던 제약 : 추상 프로터티 제약에 대해 구현함
  // => 동일 필드명 : 필드에서는 이 규칙 무시해도 관계 없음
  // => 왜 ? 동일한 이름의 프로퍼티는 1개로 취급하겠다.
  super.foregroundColor;
  return _canvas;
  }
  Paint _paint = Paint();
  @override
  Paint get paint => _paint;

  @override
  void drawByExternal(Canvas canvas, Paint paint) {
  }

}
void main(){
  MyScreen myScreen = MyScreen();
  Canvas canvas = Canvas();
  Paint paint = Paint();
  myScreen.canvas;
  myScreen.paint;
  myScreen.draw();
  myScreen.drawByExternal(canvas, paint);
}

// stful
class _MyStateful extends StatefulWidget {
  const _MyStateful({super.key});

  @override
  State<_MyStateful> createState() => _State();
}

class _State extends State<_MyStateful> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// 제약을 준다 : 믹스인  구현여부   제약, 클래스  구현여부  제약, 인터페이스 구현여부 제약
// W 라는 클래스르 정의하지 않았지만 StatefulWidget 라는 클래스를 상속 받았다는 점은 알 수 잇다.
// StatefulWidget 의 메서드는 화면을 다시갱신하는 기능이 있다. <-- 이 기능을 가져다 쓸려면 예를 상속 받아야 한다.
// 믹스인을 사용하는 주된 이유 : 기능을 한 쪽으로 모아줄 수 있음, 재사용도 가능하다.
mixin MyFunction<W extends StatefulWidget> on State<W> {  // State 는 추상클래스임
  void updateMyValue() {                        // W는 구현한 시점에서 엄.
    // State 추상 클래스에 구현되어 있는 메소드를 호출 할 ㅅ ㅜ있음
    // 이 믹스인이 클래스 구현여부 제약을 ㅂ다았기 떄문 => State 클래스 구현 제약
    setState(() { // 이런게 인터페이스 또는 추사을래스에서는 안되는 기능임.

    });
  }
}
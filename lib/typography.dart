import 'package:flutter/widgets.dart';

final TEXT_MEDIUM = TextStyle(
  color: Color.fromRGBO(0x00, 0x00, 0x00, 1.0),
  decoration: TextDecoration.none,
  fontSize: 15,
  height: 15/15,
);

abstract class TextDecorator {
  const TextDecorator._({ required double fontSize }): this._fontSize = fontSize;

  factory TextDecorator.medium() = TextMedium._;

  final double _fontSize;

  TextStyle get style {
    return TextStyle(
      color: Color.fromRGBO(0x00, 0x00, 0x00, 1.0),
      decoration: TextDecoration.none,
      fontSize: _fontSize,
      height: _fontSize/_fontSize,
    );
  }
}

class TextMedium extends TextDecorator {
  const TextMedium._(): super._(fontSize: 15);
}
import 'package:dart_basic/typography.dart';
import 'package:flutter/widgets.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0xF6, 0x12, 0x8C, 1.0),
      child: Text(
        '1번',
        style: TextDecorator.medium().style,
      ),
    );
  }
}

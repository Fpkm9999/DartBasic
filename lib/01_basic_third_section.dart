import 'package:dart_basic/typography.dart';
import 'package:flutter/widgets.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0x56, 0x00, 0xFF, 1.0),
      child: Text(
        '1번',
        style: TextDecorator.medium().style,
      ),
    );
  }
}

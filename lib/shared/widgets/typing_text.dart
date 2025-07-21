import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;

  const TypingText({
    super.key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 1000),
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late String _visibleText;
  int _index = 0;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _visibleText = '';
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    if (_index < widget.text.length) {
      setState(() {
        _visibleText += widget.text[_index];
        _index++;
      });
    } else {
      _ticker.stop();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _visibleText,
      style: widget.style ?? Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.center,
    );
  }
}

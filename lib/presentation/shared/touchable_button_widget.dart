import 'package:flutter/material.dart';

class TouchableButtonWidget extends StatefulWidget {
  const TouchableButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
  });
  final VoidCallback onPressed;
  final Widget child;

  @override
  _TouchableButtonWidgetState createState() => _TouchableButtonWidgetState();
}

class _TouchableButtonWidgetState extends State<TouchableButtonWidget> {
  bool _isPressed = false;

  void _handlePress() {
    setState(() {
      _isPressed = !_isPressed;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onPressed();

      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: _handlePress,
      child: AnimatedOpacity(
        opacity: _isPressed ? 0.7 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }
}

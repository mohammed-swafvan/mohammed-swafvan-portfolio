import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnMouseHoverWidget extends StatefulWidget {
  const OnMouseHoverWidget({super.key, required this.child});
  final Widget child;

  @override
  State<OnMouseHoverWidget> createState() => _OnMouseHoverWidgetState();
}

class _OnMouseHoverWidgetState extends State<OnMouseHoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    Matrix4 hoveredTransform = Matrix4.identity()..scale(1.03);
    Matrix4 transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEnter(true),
      onExit: (event) => onEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEnter(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslucentButton extends StatefulWidget {
  final Function? onTap;
  final double begin;
  final double end;
  final Widget child;
  final Curve curve;

  TranslucentButton(
      {required this.onTap,
      this.begin = 1.0,
      this.end = 0.6,
      required this.child,
      this.curve = Curves.easeInOut});

  @override
  _TranslucentButtonState createState() => _TranslucentButtonState();
}

class _TranslucentButtonState extends State<TranslucentButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationOpacity;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
        reverseDuration: Duration(milliseconds: 400));
    _animationOpacity = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animationOpacity.value,
          child: GestureDetector(
            child: widget.child,
            onTapUp: (_) {
              widget.onTap!();
              _controller.reverse();
            },
            onTapDown: (_) {
              _controller.forward();
            },
            onTapCancel: () {
              _controller.reverse();
            },
          ),
        );
      },
    );
  }
}

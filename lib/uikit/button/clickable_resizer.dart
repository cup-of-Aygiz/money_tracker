import 'package:flutter/material.dart';

/// Виджет-обертка над GestureDetector для применения эффекта уменьшения
/// при зажатии ребенка
class ClickableResizer extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;
  final HitTestBehavior behavior;

  const ClickableResizer({
    required this.child,
    required this.onTap,
    this.behavior = HitTestBehavior.translucent,
    super.key,
  });

  @override
  State<ClickableResizer> createState() => _ClickableResizerState();
}

class _ClickableResizerState extends State<ClickableResizer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final _key = GlobalKey();

  bool _isDown = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 1.0, end: 0.98).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        behavior: widget.behavior,
        child: widget.onTap != null
            ? Transform.scale(
                scale: _isDown ? _animation.value : 1.0,
                child: KeyedSubtree(
                  key: _key,
                  child: widget.child,
                ),
              )
            : KeyedSubtree(key: _key, child: widget.child),
      );

  void _onTapDown(TapDownDetails details) {
    _isDown = true;
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _isDown = false;
    _controller.reverse();
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _onTapCancel() {
    _isDown = false;
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

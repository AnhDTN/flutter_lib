import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnyProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({Key? key, this.delay = 1, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnyProps>()
      ..add(AnyProps.opacity, Tween(begin: 0.0, end: 1.0),
          const Duration(milliseconds: 500))
      ..add(AnyProps.translateY, Tween(begin: -130.0, end: 0.0),
          const Duration(milliseconds: 500));
    return PlayAnimation<MultiTweenValues<AnyProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AnyProps.opacity),
        child: Transform.translate(
            offset: Offset(0, animation.get(AnyProps.translateY)),
            child: child),
      ),
    );
  }
}

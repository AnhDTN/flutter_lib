import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lib/helpers/helpers.dart';
import 'package:flutter_lib/helpers/svg_icons.dart';

class FloatMenuView extends StatefulWidget {
  const FloatMenuView({Key? key}) : super(key: key);

  @override
  _FloatMenuViewState createState() => _FloatMenuViewState();
}

class _FloatMenuViewState extends State<FloatMenuView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _menuItem({BuildContext? context, required String title, String? imagePath}) {
    return Container(
      height: 40,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Colors.red, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcons(
            icon: imagePath,
            size: 16,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              title,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      child: const Icon(Icons.add),
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: _menuItem(
              context: context,
              title: "Đăng ký khóa học",
              imagePath: Helpers.iconPath("facebook")),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          onPressed: () {},
        ),
        SpeedDialChild(
          child: _menuItem(
              context: context,
              title: "Đăng ký tài khoản",
              imagePath: Helpers.iconPath("facebook")),
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          onPressed: () {},
        ),
        SpeedDialChild(
          child: _menuItem(
              context: context,
              title: "Tập Demo",
              imagePath: Helpers.iconPath("facebook")),
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          onPressed: () {},
        ),
        SpeedDialChild(
          child: _menuItem(
              context: context,
              title: "Dự Outing",
              imagePath: Helpers.iconPath("facebook")),
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          onPressed: () {},
        ),
        SpeedDialChild(
          child: _menuItem(
              context: context,
              title: "Thông báo",
              imagePath: Helpers.iconPath("facebook")),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          onPressed: () {},
        ),
      ],
      closedForegroundColor: Colors.black,
      openForegroundColor: Colors.white,
      closedBackgroundColor: Colors.white,
      openBackgroundColor: Colors.black,
    );
  }
}

class SpeedDial extends StatefulWidget {
  const SpeedDial({
    this.child,
    this.speedDialChildren,
    this.labelsStyle,
    this.controller,
    this.closedForegroundColor,
    this.openForegroundColor,
    this.closedBackgroundColor,
    this.openBackgroundColor,
  });

  final Widget? child;

  final List<SpeedDialChild>? speedDialChildren;

  final TextStyle? labelsStyle;

  final AnimationController? controller;

  final Color? closedForegroundColor;

  final Color? openForegroundColor;

  final Color? closedBackgroundColor;

  final Color? openBackgroundColor;

  @override
  State<StatefulWidget> createState() {
    return _SpeedDialState();
  }
}

class _SpeedDialState extends State<SpeedDial>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _foregroundColorAnimation;
  final List<Animation<double>> _speedDialChildAnimations =
      <Animation<double>>[];

  @override
  void initState() {
    _animationController = widget.controller ??
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 450));
    _animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _backgroundColorAnimation = ColorTween(
      begin: widget.closedBackgroundColor,
      end: widget.openBackgroundColor,
    ).animate(_animationController);

    _foregroundColorAnimation = ColorTween(
      begin: widget.closedForegroundColor,
      end: widget.openForegroundColor,
    ).animate(_animationController);

    final double fractionOfOneSpeedDialChild =
        1.0 / widget.speedDialChildren!.length;
    for (int speedDialChildIndex = 0;
        speedDialChildIndex < widget.speedDialChildren!.length;
        ++speedDialChildIndex) {
      final List<TweenSequenceItem<double>> tweenSequenceItems =
          <TweenSequenceItem<double>>[];

      final double firstWeight =
          fractionOfOneSpeedDialChild * speedDialChildIndex;
      if (firstWeight > 0.0) {
        tweenSequenceItems.add(TweenSequenceItem<double>(
          tween: ConstantTween<double>(0.0),
          weight: firstWeight,
        ));
      }

      tweenSequenceItems.add(TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: fractionOfOneSpeedDialChild,
      ));

      final double lastWeight = fractionOfOneSpeedDialChild *
          (widget.speedDialChildren!.length - 1 - speedDialChildIndex);
      if (lastWeight > 0.0) {
        tweenSequenceItems.add(TweenSequenceItem<double>(
            tween: ConstantTween<double>(1.0), weight: lastWeight));
      }

      _speedDialChildAnimations.insert(
          0,
          TweenSequence<double>(tweenSequenceItems)
              .animate(_animationController));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int speedDialChildAnimationIndex = 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (!_animationController.isDismissed)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.speedDialChildren
                      ?.map<Widget>((SpeedDialChild speedDialChild) {
                    final Widget speedDialChildWidget = Opacity(
                      opacity: _speedDialChildAnimations[
                              speedDialChildAnimationIndex]
                          .value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ScaleTransition(
                            scale: _speedDialChildAnimations[
                                speedDialChildAnimationIndex],
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    if (speedDialChild
                                        .closeSpeedDialOnPressed) {
                                      _animationController.reverse();
                                    }
                                    speedDialChild.onPressed?.call();
                                  },
                                  child: speedDialChild.child),
                            ),
                          ),
                        ],
                      ),
                    );
                    speedDialChildAnimationIndex++;
                    return speedDialChildWidget;
                  })?.toList() ??
                  <Widget>[],
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FloatingActionButton(
            child: widget.child,
            foregroundColor: _foregroundColorAnimation.value,
            backgroundColor: _backgroundColorAnimation.value,
            onPressed: () {
              if (_animationController.isDismissed) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            },
          ),
        )
      ],
    );
  }
}

class SpeedDialChild {
  const SpeedDialChild({
    this.child,
    this.foregroundColor,
    this.backgroundColor,
    this.onPressed,
    this.closeSpeedDialOnPressed = true,
  });

  final Widget? child;

  final Color? foregroundColor;

  final Color? backgroundColor;

  final Function? onPressed;

  final bool closeSpeedDialOnPressed;
}

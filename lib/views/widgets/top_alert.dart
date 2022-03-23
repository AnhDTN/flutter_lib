import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';

class TopAlert extends StatefulWidget {
  const TopAlert({
    Key? key,
    required this.icon,
    required this.child,
    this.borderColor = ColorRes.primary,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);
  final Widget icon;
  final Widget child;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  State<StatefulWidget> createState() => _TopAlertState();
}

class _TopAlertState extends State<TopAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> position;

  void _listenAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(seconds: 1), () async {
        await _controller.reverse();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    position = Tween<Offset>(begin: const Offset(0.0, -4.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.forward();
    _controller.addStatusListener(_listenAnimation);
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_listenAnimation);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SlideTransition(
                position: position,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: widget.padding,
                    decoration: ShapeDecoration(
                        color: widget.backgroundColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: widget.borderColor),
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.icon,
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(child: widget.child)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopIconAlert extends StatefulWidget {
  const TopIconAlert(
      {Key? key,
      required this.child,
      required this.iconName,
      this.borderColor = ColorRes.primary,
      this.backgroundColor = Colors.white,
      this.onTap,
      this.borderRadius = 8,
      this.padding = const EdgeInsets.all(16),
      required this.onCompleted})
      : super(key: key);
  final Widget child;
  final String iconName;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final VoidCallback onCompleted;

  @override
  _TopIconAlertState createState() => _TopIconAlertState();
}

class _TopIconAlertState extends State<TopIconAlert> {
  @override
  Widget build(BuildContext context) {
    return TopAlert(
      icon: Image.asset(
        widget.iconName,
        width: 24,
        height: 24,
      ),
      child: widget.child,
      borderColor: widget.borderColor,
      borderRadius: widget.borderRadius,
      backgroundColor: widget.backgroundColor,
      padding: widget.padding,
      onTap: widget.onTap,
    );
  }
}

class TopImageAlert extends StatefulWidget {
  const TopImageAlert(
      {Key? key,
      required this.child,
      required this.iconName,
      this.borderColor = ColorRes.primary,
      this.backgroundColor = Colors.white,
      this.onTap,
      this.borderRadius = 8,
      this.padding = const EdgeInsets.all(16),
      required this.onCompleted})
      : super(key: key);
  final Widget child;
  final String iconName;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final VoidCallback onCompleted;

  @override
  _TopImageAlertState createState() => _TopImageAlertState();
}

class _TopImageAlertState extends State<TopImageAlert> {
  @override
  Widget build(BuildContext context) {
    return TopAlert(
      icon: Image.asset(
        widget.iconName,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      child: widget.child,
      borderColor: widget.borderColor,
      borderRadius: widget.borderRadius,
      backgroundColor: widget.backgroundColor,
      padding: widget.padding,
      onTap: widget.onTap,
    );
  }
}

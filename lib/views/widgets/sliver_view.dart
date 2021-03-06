import 'package:flutter/material.dart';

class SliverView extends StatelessWidget {
  SliverView(
      {Key? key,
      required this.animationController,
      required this.colorTween,
      this.appBar,
      this.header,
      required this.body})
      : super(key: key);
  final ScrollController nestedScrollController = ScrollController();
  final AnimationController animationController;
  final Animation colorTween;
  final Widget? appBar;
  final Widget? header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: nestedScrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          AnimatedBuilder(
            animation: colorTween,
            builder: (context, child) => SliverAppBar(
              expandedHeight: 220,
              collapsedHeight: 56,
              toolbarHeight: 56,
              elevation: 0,
              pinned: true,
              floating: true,
              backgroundColor: colorTween.value,
              foregroundColor: Colors.white,
              forceElevated: true,
              title: appBar,
              flexibleSpace: FlexibleSpaceBar(
                background: header,
              ),
            ),
          ),
        ];
      },
      body: body,
    );
  }
}

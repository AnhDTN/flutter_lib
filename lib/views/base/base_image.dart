import 'package:flutter/widgets.dart';

class BaseImageNetwork extends StatefulWidget {
  final double radius;
  final String image;
  final String placeHolder;
  final String imageError;
  final double width;
  final double height;
  final Color? color;

  const BaseImageNetwork(
      {Key? key,
      required this.radius,
      required this.image,
      required this.placeHolder,
      required this.imageError,
      required this.width,
      required this.height,
      this.color})
      : super(key: key);

  @override
  _BaseImageNetworkState createState() => _BaseImageNetworkState();
}

class _BaseImageNetworkState extends State<BaseImageNetwork> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Image.network(
        widget.image,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
        color: widget.color,
        frameBuilder: (context, child, int, bool) => Image.asset(
          widget.placeHolder,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
          color: widget.color,
        ),
        loadingBuilder: (context, child, event) => event == null
            ? child
            : Image.asset(
                widget.placeHolder,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
                color: widget.color,
              ),
        errorBuilder: (context, object, stackTrace) => Image.asset(
          widget.imageError,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
          color: widget.color,
        ),
      ),
    );
  }
}

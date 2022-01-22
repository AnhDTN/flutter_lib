import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/image_name.dart';

class ImageView extends StatefulWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const ImageView(
      {Key? key,required this.imageUrl, required this.width, required this.height})
      : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return widget.imageUrl != null
        ? Image.network(
            widget.imageUrl!,
            width: widget.width,
            height: widget.height,
            loadingBuilder: (context, child, event) => Image.asset(
              ImageName.placeHolder,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            ),
            errorBuilder: (context, child, event) => Image.asset(
              ImageName.placeHolder,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            ),
            fit: BoxFit.fill,
          )
        : Image.asset(
            ImageName.placeHolder,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.fill,
          );
  }
}

class CircleImageView extends StatefulWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const CircleImageView(
      {Key? key, this.imageUrl, required this.width, required this.height})
      : super(key: key);

  @override
  _CircleImageViewState createState() => _CircleImageViewState();
}

class _CircleImageViewState extends State<CircleImageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
          borderRadius: BorderRadius.all(const Radius.circular(1000)),
          child: Image.network(
            widget.imageUrl!,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.fill,
            errorBuilder: (context, obj, stackTrace) => Image.asset(
              ImageName.placeHolder,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            ),
            loadingBuilder: (context, child, event) => Image.asset(
              ImageName.placeHolder,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}

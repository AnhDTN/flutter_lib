class ImageName {
  static final ImageName _singleton = ImageName._internal();

  factory ImageName() {
    return _singleton;
  }

  static const logo = "assets/images/placeholder.png";

  ImageName._internal();
}

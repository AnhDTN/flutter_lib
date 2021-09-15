class ImageName {
  static final ImageName _singleton = new ImageName._internal();

  factory ImageName() {
    return _singleton;
  }

  static final logo = "assets/images/placeholder.png";

  ImageName._internal();
}

import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseStatefulWidgetState<Page extends BaseStatefulWidget> extends State<BaseStatefulWidget> {
}

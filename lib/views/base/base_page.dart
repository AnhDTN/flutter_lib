import 'package:flutter/material.dart';
import 'package:flutter_lib/views/base/alert.dart';
import 'package:flutter_lib/views/base/base_view.dart';
import 'package:flutter_lib/views/base/progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleProvider = StateProvider((ref) => 0);

//ignore: must_be_immutable
abstract class BasePage extends ConsumerWidget
    with ProgressWidget, Alert, BaseView {

  BasePage({Key? key}) : super(key: key);

}

abstract class BaseStatefulWidget extends ConsumerStatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BaseStatefulWidget>
    extends ConsumerState<Page>
    with ProgressWidget, Alert, BaseView {}

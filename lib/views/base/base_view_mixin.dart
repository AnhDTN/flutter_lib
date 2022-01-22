import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/colors.dart';
import 'package:flutter_lib/resources/image_name.dart';
import 'package:flutter_lib/views/widgets/dialog_notification.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_stateful_widget.dart';

mixin BaseViewStateful<Page extends BaseStatefulWidget>
    on BaseStatefulWidgetState<Page> {
  Color? backGroundColor;

  AppBar _appBar(BuildContext context);

  Widget _buildWidget(BuildContext context);

  Widget _emptyWidget(BuildContext context) {
    return Container(color: AppColors.white, child: const Text("Empty"),);
  }

  Widget _body(BuildContext context) {
    return Container(color: AppColors.white, child: const Text("Hasdata"),);
  }

  Widget _errorWidget(BuildContext context) {
    return Container(color: AppColors.white, child: const Text("Error"),);
  }

  Widget _loadingWidget(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    ImageCache().clear();
    ImageCache().clearLiveImages();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor ?? AppColors.white,
      appBar: _appBar(context),
      body: _buildWidget(context),
    );
  }

  Future showDialogMessage(String message,
      {String title = "Thông báo",
      String? image,
      void Function()? action}) async {
    showDialog(
        context: context,
        builder: (context) => DialogNotification(
            image: image ?? ImageName.placeHolder, title: title, message: message));
  }

  Future showSnackBar(String message, {SnackBarAction? action}) async {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      action: action,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class DemoPage extends BaseStatefulWidget {
  const DemoPage({Key? key})
      : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends BaseStatefulWidgetState<DemoPage>
    with BaseViewStateful<DemoPage> {

  late RefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  Widget _buildWidget(BuildContext context) {
    return _body(context);
  }

  @override
  Widget _body(BuildContext context) {
    return Container();
  }
  @override
  AppBar _appBar(BuildContext context) {
    return AppBar();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}

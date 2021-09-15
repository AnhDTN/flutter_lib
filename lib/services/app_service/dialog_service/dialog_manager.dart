import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/colors.dart';
import 'package:flutter_lib/resources/text_style.dart';
import 'package:flutter_lib/views/widgets/button_confirm_view.dart';
import 'package:get_it/get_it.dart';
import 'dialog_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key? key, required this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = GetIt.I.get<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerAlertListener(_showAlert);
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registerShowDialogLoadingListener(_showDialogLoading);
    _dialogService.registerHideDialogLoadingListener(_hideDialogLoading);

  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showAlert(AlertRequest request) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              contentPadding: EdgeInsets.all(16),
              titlePadding: EdgeInsets.only(top: 16, left: 16, right: 16),
              buttonPadding: EdgeInsets.all(16),
              actionsPadding: EdgeInsets.all(0),
              title: Text(
                request.title,
                style: TextStyles.headLine3(context),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    request.description,
                    style: TextStyles.body1(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: TextButton(
                            onPressed: () {
                              _dialogService.alertComplete(
                                  AlertResponse(confirmed: false));
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context)!.cancel,
                                style: TextStyles.buttonRed(context))),
                      ),
                      if (request.action != null)
                        TextButton(
                            onPressed: () {
                              request.action!();
                              _dialogService.alertComplete(
                                  AlertResponse(confirmed: true));
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context)!.confirm,
                                style: TextStyles.buttonRed(context))),
                    ],
                  )
                ],
              ),
            ));
  }

  void _showDialog(DialogRequest request, void Function()? action) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
                backgroundColor: AppColors.white,
                title: Text(
                  request.title,
                  style: TextStyles.headLine3(context),
                ),
                content: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    request.description,
                    style: TextStyles.body1(context),
                  ),
                ),
                actions: [
                  ButtonView(
                    text: AppLocalizations.of(context)!.cancel,
                    onTap: () {
                      _dialogService
                          .dialogComplete(DialogResponse(confirmed: true));
                      Navigator.of(context).pop();
                    },
                  ),
                  if (request.action != null)
                    TextButton(
                        onPressed: () {
                          request.action!();
                          _dialogService.alertComplete(
                              AlertResponse(confirmed: true));
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.confirm,
                            style: TextStyles.buttonRed(context))),
                ]));
  }

  void _showDialogLoading() async {
    await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 120,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text("Đang tải..."),
                        ),
                        SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator())
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }

  void _hideDialogLoading() {
    Navigator.of(context).pop();
  }

  void _showDialogAction() async {
    await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 120,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text("Đang tải..."),
                        ),
                        SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator())
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}

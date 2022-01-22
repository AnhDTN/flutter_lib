import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lib/resources/colors.dart';

class AlertMessageDialog extends StatelessWidget {
  final String? title;
  final String? image;
  final String? message;
  final String? action;
  final String? subAction;
  final void Function()? onTapAction;
  final void Function()? onTapSubAction;

  const AlertMessageDialog(
      {Key? key,
      @required this.image,
      @required this.message,
      this.title = "Thành công",
      this.action = "Đồng ý",
      this.subAction,
      this.onTapAction,
      this.onTapSubAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.all(0),
      buttonPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 12),
            child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close, size: 24,),
                )),
          ),
          image != null
              ? const Icon(Icons.done, size: 80, color: AppColors.green,)
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 10),
            child: Text(
              title ?? "",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              message ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              children: [
                ElevatedButton(
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.green)),
                    onPressed: onTapAction,
                    child: Text(
                      action ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.white),
                    )),
                subAction != null
                    ? ElevatedButton(
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.white),
                                elevation:
                                    MaterialStateProperty.all<double>(0)),
                        onPressed: onTapSubAction,
                        child: Text(
                          subAction!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: AppColors.green),
                        ))
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DialogMessage extends StatefulWidget {
  final String title;
  final String message;
  final void Function()? func;

  const DialogMessage(
      {Key? key, this.title = "Thông báo", this.message = "", this.func})
      : super(key: key);

  @override
  _DialogMessageState createState() => _DialogMessageState();
}

class _DialogMessageState extends State<DialogMessage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Column(
        children: <Widget>[
          Text(widget.title),
        ],
      ),
      content: Text(widget.message),
      actions: <Widget>[
        ElevatedButton(
            onPressed: widget.func ?? () {
                    Navigator.of(context).pop();
                  },
            child: const Text("Ok"))
      ],
    );
  }
}

class DialogLoading extends StatefulWidget {
  const DialogLoading({Key? key}) : super(key: key);

  @override
  _DialogLoadingState createState() => _DialogLoadingState();
}

class _DialogLoadingState extends State<DialogLoading> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 120,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text("Đang tải..."),
                ),
                SizedBox(
                    height: 40, width: 40, child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AlertDialogConfirm extends StatefulWidget {
  final void Function()? onConfirmFunction;
  final String? title;

  const AlertDialogConfirm({Key? key, this.onConfirmFunction, this.title})
      : super(key: key);

  @override
  _AlertDialogConfirmState createState() => _AlertDialogConfirmState();
}

class _AlertDialogConfirmState extends State<AlertDialogConfirm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        buttonPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        content: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Confirm ?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: widget.onConfirmFunction, child: const Text("Có")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Không"))
                ],
              )
            ],
          ),
        ));
  }
}

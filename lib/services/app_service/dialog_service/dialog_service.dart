import 'dart:async';

class DialogService {
  late Function(AlertRequest) _showAlertListener;
  late Completer<AlertResponse> _alertCompleter;
  late Function(DialogRequest, void Function()?) _showDialogListener;
  late Completer<DialogResponse> _dialogCompleter;
  late Function() _showDialogLoadingListener;
  late Function() _hideDialogLoadingListener;
  late Completer _dialogLoadingCompleter;

  void registerAlertListener(Function(AlertRequest) showAlertListener) {
    _showAlertListener = showAlertListener;
  }

  void registerDialogListener(
      Function(DialogRequest, void Function()?) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void registerShowDialogLoadingListener(Function() showDialogLoadingListener) {
    _showDialogLoadingListener = showDialogLoadingListener;
  }

  void registerHideDialogLoadingListener(Function() hideDialogLoadingListener) {
    _hideDialogLoadingListener = hideDialogLoadingListener;
  }

  Future<AlertResponse> showAlert(
      {String title = "Thông báo",
      required String description,
      String buttonTitle = 'Đồng ý',
      void Function()? action}) {
    _alertCompleter = Completer<AlertResponse>();
    _showAlertListener(AlertRequest(
        title: title,
        description: description,
        buttonTitle: buttonTitle,
        action: action));
    return _alertCompleter.future;
  }

  void alertComplete(AlertResponse response) {
    _alertCompleter.complete(response);
  }

  Future<DialogResponse> showDialog(
      {required String title,
      required String description,
      String buttonTitle = 'Đồng ý',
      void Function()? action}) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(
        DialogRequest(
          title: title,
          description: description,
          buttonTitle: buttonTitle,
        ),
        action);
    return _dialogCompleter.future;
  }

  void dialogComplete(DialogResponse response) {
    _dialogCompleter.complete(response);
  }

  Future? showDialogLoading() async {
    _dialogLoadingCompleter = Completer();
    _showDialogLoadingListener();
    return _dialogLoadingCompleter.future;
  }

  void dialogLoadingComplete() {
    _hideDialogLoadingListener();
    _dialogLoadingCompleter.complete();
  }
}

class AlertRequest {
  final String title;
  final String description;
  final String? buttonTitle;
  final void Function()? action;

  AlertRequest(
      {this.title = "Thông báo",
      required this.description,
      this.buttonTitle,
      this.action});
}

class AlertResponse {
  final String? fieldOne;
  final String? fieldTwo;
  final bool? confirmed;

  AlertResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}

class DialogRequest {
  final String title;
  final String description;
  final String? buttonTitle;
  final void Function()? action;

  DialogRequest(
      {this.title = "Thông báo",
      required this.description,
      this.buttonTitle,
      this.action});
}

class DialogResponse {
  final String? fieldOne;
  final String? fieldTwo;
  final bool? confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}

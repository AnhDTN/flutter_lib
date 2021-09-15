import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/text_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'button_confirm_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OtpView extends StatefulWidget {
  final String? title;
  final String? message;
  final String? errorMessage;
  final String? timeExpire;
  final void Function() resendOtp;
  final void Function() submit;
  final TextEditingController? otpController;
  final int? length;
  final void Function(String value)? onChange;
  final bool hasError;
  final void Function(String value)? onComplete;
  final int time;

  const OtpView(
      {Key? key,
      this.title,
      this.message,
      this.errorMessage,
      this.timeExpire,
      required this.resendOtp,
      required this.submit,
      this.otpController,
      this.length,
      this.onChange,
      this.hasError = false,
      this.onComplete,
      this.time = 60})
      : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> _errorController;
  Timer? _timer;
  var timeExpire = 0;

  @override
  void initState() {
    _errorController = StreamController<ErrorAnimationType>();
    timeExpire = widget.time;
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    _errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24, left: 16, right: 16),
      child: Column(
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              widget.message!,
              textAlign: TextAlign.center,
            ),
          ),
          widget.hasError
              ? Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Text(
                    AppLocalizations.of(context)!.failsPleaseInputAgain,
                    textAlign: TextAlign.center,
                    style: TextStyles.body1Red(context),
                  ))
              : Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Text(
                    "Vui lòng điền mã xác thực trong ... ${timeExpire}s",
                    textAlign: TextAlign.center,
                    style: TextStyles.body1(context),
                  )),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Form(
              key: _formKey,
              child: PinCodeTextField(
                controller: widget.otpController,
                onChanged: widget.onChange!,
                appContext: context,
                length: widget.length!,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    borderWidth: 1,
                    fieldHeight: 80,
                    fieldWidth: MediaQuery.of(context).size.width / 7,
                    activeColor: widget.hasError ? Colors.red : Colors.blue,
                    selectedColor: Colors.black87,
                    selectedFillColor: Colors.white,
                    inactiveColor:  widget.hasError ? Colors.red : Colors.black12 ,
                    activeFillColor: Colors.white,
                    disabledColor: Colors.black87,
                    inactiveFillColor: Colors.white),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                animationType: AnimationType.fade,
                enableActiveFill: true,
                errorAnimationController: _errorController,
                keyboardType: TextInputType.number,
                onCompleted: widget.onComplete,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.resendOtp();
              timeExpire = 60;
              _startTimer();
            },
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.red))),
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  "Gửi lại mã xác thực cho tôi",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            child: ButtonView(
                text: "Xác thực",
                onTap: () {
                  widget.submit();
                }),
          )
        ],
      ),
    );
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeExpire > 0) {
        setState(() {
          timeExpire -= 1;
        });
      } else {
        _timer!.cancel();
      }
    });
  }
}

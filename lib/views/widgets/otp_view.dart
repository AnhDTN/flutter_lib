import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';
import 'package:flutter_lib/resources/text_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpView extends StatefulWidget {
  final String? title;
  final String? message;
  final String? errorMessage;
  final String? timeExpire;
  final void Function() resendOtp;
  final void Function() submit;
  final TextEditingController otpController;
  final int? length;
  final void Function(String value)? onChange;
  final void Function(String value)? onComplete;
  final int time;
  final bool enable;

  const OtpView(
      {Key? key,
      this.title,
      this.message,
      this.errorMessage,
      this.timeExpire,
      required this.resendOtp,
      required this.submit,
      required this.otpController,
      this.length,
      this.onChange,
      this.onComplete,
      this.time = 60,
      this.enable = false})
      : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> _errorController;
  Timer? _timer;
  var _timeExpire = 0;

  @override
  void initState() {
    _errorController = StreamController<ErrorAnimationType>();
    _timeExpire = widget.time;
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
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.title != null)
              Text(
                widget.title!,
                textAlign: TextAlign.center,
                style: TextStyles.headLine2(context),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                widget.message!,
                textAlign: TextAlign.center,
                style: TextStyles.body1(context)
                    ?.copyWith(fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Form(
                key: _formKey,
                child: PinCodeTextField(
                  autoFocus: true,
                  controller: widget.otpController,
                  onChanged: widget.onChange!,
                  appContext: context,
                  length: widget.length!,
                  enabled: widget.enable,
                  textStyle: TextStyles.headLine3(context),
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      borderWidth: 1,
                      fieldHeight: 80,
                      fieldWidth: MediaQuery.of(context).size.width / 8,
                      activeColor: widget.errorMessage != null &&
                              widget.errorMessage!.isNotEmpty
                          ? Colors.red
                          : Colors.white.withOpacity(0.7),
                      selectedColor: ColorRes.gray,
                      selectedFillColor: Colors.white.withOpacity(0.2),
                      inactiveColor: widget.errorMessage != null &&
                              widget.errorMessage!.isNotEmpty
                          ? Colors.red
                          : Colors.black12,
                      activeFillColor: Colors.white.withOpacity(0.06),
                      disabledColor: ColorRes.gray,
                      inactiveFillColor: Colors.white.withOpacity(0.2)),
                  cursorColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: AnimationType.fade,
                  enableActiveFill: true,
                  errorAnimationController: _errorController,
                  keyboardType: TextInputType.number,
                  onCompleted: widget.onComplete,
                ),
              ),
            ),
            _timeExpire > 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Mã sẽ hết hiệu lực trong:",
                          style: TextStyles.body1(context)
                              ?.copyWith(color: ColorRes.gray),
                          children: [
                            TextSpan(
                              text: " ${_timeExpire}s",
                              style: TextStyles.body1(context),
                            )
                          ]),
                    ))
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Column(
                children: [
                  widget.errorMessage != null && widget.errorMessage!.isNotEmpty
                      ? Text(
                          widget.errorMessage ??
                              AppLocalizations.of(context)!
                                  .failsPleaseInputAgain,
                          textAlign: TextAlign.center,
                          style: TextStyles.body1Bold(context)
                              ?.copyWith(color: Colors.white),
                        )
                      : Text(
                          "Bạn chưa nhận được mã xác thực?",
                          style: TextStyles.body1Bold(context)
                              ?.copyWith(color: Colors.white),
                        ),
                  GestureDetector(
                    onTap: () {
                      widget.resendOtp();
                      _timeExpire = 60;
                      _startTimer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "Gửi lại mã",
                        style: TextStyles.body1Red(context)
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeExpire > 0) {
        setState(() {
          _timeExpire -= 1;
        });
      } else {
        _timer!.cancel();
      }
    });
  }
}

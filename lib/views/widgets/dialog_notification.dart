import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/colors.dart';

class DialogNotification extends StatelessWidget {
  final String title;
  final String image;
  final String? message;
  final void Function()? onTapAction;
  const DialogNotification({Key? key, required this.image, required this.message,this.title = "Thông báo", this.onTapAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 16),
            child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, size: 20,),
                )),
          ),
          Image.asset(
            image,
            width: 62,
            height: 62,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 14),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
                message!,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.gray2),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child:  SizedBox(
              height: 46,
              child: OutlinedButton(
                      onPressed: () {
                        if(onTapAction != null) {
                          onTapAction!();
                        }
                        if(Navigator.canPop(context)) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        "Xác nhận",
                        ),
                      ),
            )
          )
        ],
      ),
    );
  }
}

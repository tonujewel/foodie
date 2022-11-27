import 'package:flutter/material.dart';

class AppHelper {
// warning
  static warningDialog({required BuildContext context, String? text}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => SizedBox(
        height: 50,
        width: 50,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/warning.gif",
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 30),
              text == null ? const SizedBox() : Text(text)
            ],
          ),
        ),
      ),
    );
  }

// warning
  static loadingDialog({required BuildContext context, String? text}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SizedBox(
        height: 50,
        width: 50,
        child: AlertDialog(
          content: Image.asset(
            "assets/images/loader.gif",
          ),
        ),
      ),
    );
  }
}

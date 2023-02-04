import 'package:flutter/material.dart';

class CommonHelper {
  static void showMyDialog({
    required BuildContext context,
    required List<Widget> actions,
    required Widget title,
    Widget? content,
    bool? barrierDismissible,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible:
          barrierDismissible != null ? barrierDismissible : false,
      builder: (context) {
        return AlertDialog(
          title: title,
          actions: actions,
          content: content,
        );
      },
    );
  }
}

void printCustom({String? title, content}) {
  if (title != null && title != '') {
    print('${title} ${content}');
  } else {
    print('${content}');
  }
}

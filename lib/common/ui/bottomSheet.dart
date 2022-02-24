import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

bottomSheetPopUp(
    {@required Widget? child,
    BuildContext? ctx,
    Color? color,
    bool enableDrag = true,
    bool isDismissible = true}) {
  return showCupertinoModalBottomSheet(
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      context: ctx as BuildContext,
      expand: false,
      isDismissible: isDismissible,
      topRadius: Radius.circular(30),
      builder: (context) {
        return Container(
            child: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: MediaQuery.of(context).viewInsets,
                    child: child)));
      });
}

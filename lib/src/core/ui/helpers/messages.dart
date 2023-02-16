import 'package:flutter/Material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(message: message),
    );
  }

  void showinfo(String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.info(message: message),
    );
  }
  void showSuccess(String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.success (message: message),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

base mixin LoaderAndMessages<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  var _isOpen = false;

  void showLoader() {
    if (!_isOpen) {
      _isOpen = true;

      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white,
          size: 60,
        ),
      );
    }
  }

  void hideLoader() {
    if (_isOpen) {
      _isOpen = false;

      return Navigator.of(context).pop<void>();
    }
  }

  void _showSnackBar(String message, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );

  void showErrorSnackBar(String message) => _showSnackBar(message, Colors.red);

  void showSuccessSnackBar(String message) =>
      _showSnackBar(message, Colors.green);

  void showInfoSnackBar(String message) => _showSnackBar(message, Colors.blue);
}

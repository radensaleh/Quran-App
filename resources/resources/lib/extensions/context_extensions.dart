import 'package:flash/flash.dart';
import 'package:flutter/widgets.dart';
import 'package:resources/widgets/custom_flash_widget.dart';

extension ContextExtensions on BuildContext {
  void showCustomFlashMessage({
    String title = 'Coming Soon!',
    String message = 'We will notify you once this feature is ready 🙌',
    bool positionBottom = false,
    bool darkTheme = false,
    required String status,
  }) {
    showFlash(
      context: this,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomFlashWidget(
            status: status,
            controller: controller,
            title: title,
            message: message,
            darkTheme: darkTheme,
            positionBottom: positionBottom,
          ),
        );
      },
    );
  }
}

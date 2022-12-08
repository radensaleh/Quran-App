import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

Color? statusColor(status) => status == 'success'
    ? Colors.green[600]
    : status == 'failed'
        ? Colors.red[600]
        : Colors.blue[600];

class CustomFlashWidget extends StatelessWidget {
  final String status;
  final FlashController controller;
  final String title;
  final String message;
  final bool darkTheme;
  final bool positionBottom;

  const CustomFlashWidget({
    super.key,
    required this.status,
    required this.controller,
    required this.title,
    required this.message,
    required this.darkTheme,
    required this.positionBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Flash(
      controller: controller,
      behavior: FlashBehavior.floating,
      position: positionBottom ? FlashPosition.bottom : FlashPosition.top,
      borderRadius: BorderRadius.circular(8.0),
      borderColor:
          darkTheme ? kPurplePrimary : statusColor(status.toLowerCase()),
      backgroundGradient: darkTheme
          ? const LinearGradient(
              colors: [
                kDarkPurple,
                kDarkTheme,
                kDarkTheme,
              ],
            )
          : const LinearGradient(
              colors: [
                Colors.white,
                kGrey92,
              ],
            ),
      forwardAnimationCurve: Curves.easeInCirc,
      reverseAnimationCurve: Curves.easeOutBack,
      child: DefaultTextStyle(
        style: const TextStyle(color: kPurplePrimary),
        child: FlashBar(
          title: Text(
            title,
            style: kHeading5.copyWith(
              color: darkTheme ? kGrey92 : statusColor(status.toLowerCase()),
              fontSize: 16,
            ),
          ),
          content: Text(
            message,
            style: kHeading5.copyWith(
              color: darkTheme ? kGrey92 : statusColor(status.toLowerCase()),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          indicatorColor:
              darkTheme ? kPurplePrimary : statusColor(status.toLowerCase()),
          icon: Icon(
            status.toLowerCase() == 'success'
                ? Icons.check_circle
                : status == 'failed'
                    ? Icons.warning_rounded
                    : Icons.info,
            color: darkTheme ? Colors.white : statusColor(status.toLowerCase()),
          ),
          primaryAction: TextButton(
            onPressed: () => controller.dismiss(),
            child: Text(
              'TUTUP',
              style: kHeading5.copyWith(
                color: darkTheme ? kGrey92 : statusColor(status.toLowerCase()),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

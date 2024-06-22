import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class Utils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
 

  static Future<void> showDialogWithTextField(
    BuildContext context, {
    String title = 'Enter Value',
    String initialValue = '',
    String hintText = '',
    String buttonText = 'OK',
    Function(String)? onSubmitted,
  }) async {
    TextEditingController textEditingController =
        TextEditingController(text: initialValue);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: hintText),
            onSubmitted: onSubmitted != null
                ? (value) {
                    onSubmitted(value);
                    Navigator.of(context).pop();
                  }
                : null,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                onSubmitted!(textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showLoadingDialog(BuildContext context,
      {String message = 'Loading...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Text(message),
            ],
          ),
        );
      },
    );
  }

  static Future<bool?> showConfirmationDialog(BuildContext context,
      {String title = 'Confirmation',
      String content = 'Are you sure you want to proceed?',
      String confirmButtonText = 'Confirm'}) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmButtonText),
            ),
          ],
        );
      },
    );
  }

  static Future<DateTime> showDatePicker(BuildContext context,
      {required DateTime initialDate}) async {
    return await showDatePicker(
      context,
      initialDate: initialDate,
    );
  }

  static Future<TimeOfDay> showTimePicker(BuildContext context,
      {required TimeOfDay initialTime}) async {
    return await showTimePicker(
      context,
      initialTime: initialTime,
    );
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dateTime);
  }

  static Future<void> showAlertDialog(
      BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getPixelRatio(
    BuildContext context,
  ) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static double getStatusBarHeight(
    BuildContext context,
  ) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight(
    BuildContext context,
  ) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible(
    BuildContext context,
  ) async {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }
}

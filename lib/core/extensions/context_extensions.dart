import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;

  bool isKeyboardOpen() {
    final screenSize = MediaQuery.of(this).size;
    final screenHeight = screenSize.height - MediaQuery.of(this).viewInsets.bottom;
    return screenSize.height != screenHeight;
  }
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get smallPaddingValue => height * 0.02216;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsetsGeometry get normalPadding => const EdgeInsets.all(16);
  EdgeInsetsGeometry get lowPadding => const EdgeInsets.all(5);
  EdgeInsetsGeometry get horizontalNormalPadding => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsetsGeometry get horizontalLowPadding => const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsetsGeometry get verticalLowPadding => const EdgeInsets.symmetric(vertical: 10);
  EdgeInsetsGeometry get rightHorizontalLowPadding => const EdgeInsets.only(right: 10);
  EdgeInsetsGeometry get horizontalHighPadding => const EdgeInsets.symmetric(horizontal: 24);
  double screenAwareSize(double val) => (val * 1.143) * (MediaQuery.of(this).size.width / 375);
}

extension ShowModalBottomSheetExtension on BuildContext {
  Future<T?> showBottomSheet<T>(
      {required Widget child, bool useRootNavigator = true, bool? isDismissible, bool? enableDrag}) async {
    return await showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      useRootNavigator: useRootNavigator,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: (BuildContext context) => Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 32, bottom: mediaQuery.viewInsets.bottom + 30),
        child: child,
      ),
    );
  }
}

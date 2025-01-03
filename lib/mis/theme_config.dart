// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'dart:ui';
// import 'package:flutter/material.dart';
//
// Color hexToColor(String hex) {
//   assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
//       'hex color must be #rrggbb or #rrggbbaa');
//
//   return Color(
//     int.parse(hex.substring(1), radix: 16) +
//         (hex.length == 7 ? 0xff000000 : 0x00000000),
//   );
// }
//
// class ColorConstants {
//   static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
//   static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
//   static Color secondaryAppColor = hexToColor('#5E92F3');
//   static Color secondaryDarkAppColor = Colors.white;
// }
//
// class ThemeConfig {
//   static ThemeData createTheme({
//     Brightness brightness,
//     Color background,
//     Color primaryText,
//     Color secondaryText,
//     Color accentColor,
//     Color divider,
//     Color buttonBackground,
//     Color buttonText,
//     Color cardBackground,
//     Color disabled,
//     Color error,
//   }) {
//     final baseTextTheme = brightness == Brightness.dark
//         ? Typography.blackMountainView
//         : Typography.whiteMountainView;
//
//     return ThemeData(
//       brightness: brightness,
//       buttonColor: buttonBackground,
//       canvasColor: background,
//       cardColor: background,
//       dividerColor: divider,
//       dividerTheme: DividerThemeData(
//         color: divider,
//         space: 1,
//         thickness: 1,
//       ),
//       cardTheme: CardTheme(
//         color: cardBackground,
//         margin: EdgeInsets.zero,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//       ),
//       backgroundColor: background,
//       primaryColor: accentColor,
//       accentColor: accentColor,
//       textSelectionColor: accentColor,
//       textSelectionHandleColor: accentColor,
//       cursorColor: accentColor,
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: Colors.amber,
//       ),
//       appBarTheme: AppBarTheme(
//         brightness: brightness,
//         color: cardBackground,
//         textTheme: TextTheme(
//           bodyText1: baseTextTheme.bodyText1.copyWith(
//             color: Colors.white,
//             fontSize: 24,
//           ),
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//       ),
//       iconTheme: IconThemeData(
//         color: accentColor,
//         size: 16.0,
//       ),
//       errorColor: error,
//       buttonTheme: ButtonThemeData(
//         textTheme: ButtonTextTheme.primary,
//         colorScheme: ColorScheme(
//           brightness: brightness,
//           primary: accentColor,
//           primaryVariant: accentColor,
//           secondary: accentColor,
//           secondaryVariant: accentColor,
//           surface: background,
//           background: background,
//           error: error,
//           onPrimary: buttonText,
//           onSecondary: buttonText,
//           onSurface: buttonText,
//           onBackground: buttonText,
//           onError: buttonText,
//         ),
//         padding: const EdgeInsets.all(16.0),
//       ),
//       cupertinoOverrideTheme: CupertinoThemeData(
//         brightness: brightness,
//         primaryColor: accentColor,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         errorStyle: TextStyle(color: error),
//         labelStyle: TextStyle(
//           fontFamily: '',
//           fontWeight: FontWeight.w600,
//           fontSize: 16.0,
//           color: primaryText,
//         ),
//         hintStyle: TextStyle(
//           color: secondaryText,
//           fontSize: 13.0,
//           fontWeight: FontWeight.w300,
//         ),
//       ),
//       fontFamily: '',
//       textTheme: TextTheme(
//         headline1: baseTextTheme.headline1.copyWith(
//           color: primaryText,
//           fontSize: 34.0,
//           fontWeight: FontWeight.bold,
//         ),
//         headline2: baseTextTheme.headline2.copyWith(
//           color: primaryText,
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),
//         headline3: baseTextTheme.headline3.copyWith(
//           color: secondaryText,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//         ),
//         headline4: baseTextTheme.headline4.copyWith(
//           color: primaryText,
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//         ),
//         headline5: baseTextTheme.headline5.copyWith(
//           color: primaryText,
//           fontSize: 16,
//           fontWeight: FontWeight.w700,
//         ),
//         headline6: baseTextTheme.headline6.copyWith(
//           color: primaryText,
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         bodyText1: baseTextTheme.bodyText1.copyWith(
//           color: secondaryText,
//           fontSize: 15,
//         ),
//         bodyText2: baseTextTheme.bodyText2.copyWith(
//           color: primaryText,
//           fontSize: 12,
//           fontWeight: FontWeight.w400,
//         ),
//         button: baseTextTheme.button.copyWith(
//           color: primaryText,
//           fontSize: 12.0,
//           fontWeight: FontWeight.w700,
//         ),
//         caption: baseTextTheme.caption.copyWith(
//           color: primaryText,
//           fontSize: 11.0,
//           fontWeight: FontWeight.w300,
//         ),
//         overline: baseTextTheme.overline.copyWith(
//           color: secondaryText,
//           fontSize: 11.0,
//           fontWeight: FontWeight.w500,
//         ),
//         subtitle1: baseTextTheme.subtitle1.copyWith(
//           color: primaryText,
//           fontSize: 16.0,
//           fontWeight: FontWeight.w700,
//         ),
//         subtitle2: baseTextTheme.subtitle2.copyWith(
//           color: secondaryText,
//           fontSize: 11.0,
//           fontWeight: FontWeight.w500,
//         ),
//       ), checkboxTheme: CheckboxThemeData(
//  fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//  if (states.contains(MaterialState.disabled)) { return null; }
//  if (states.contains(MaterialState.selected)) { return accentColor; }
//  return null;
//  }),
//  ), radioTheme: RadioThemeData(
//  fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//  if (states.contains(MaterialState.disabled)) { return null; }
//  if (states.contains(MaterialState.selected)) { return accentColor; }
//  return null;
//  }),
//  ), switchTheme: SwitchThemeData(
//  thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//  if (states.contains(MaterialState.disabled)) { return null; }
//  if (states.contains(MaterialState.selected)) { return accentColor; }
//  return null;
//  }),
//  trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//  if (states.contains(MaterialState.disabled)) { return null; }
//  if (states.contains(MaterialState.selected)) { return accentColor; }
//  return null;
//  }),
//  ),
//     );
//   }
//
//   static ThemeData get lightTheme => createTheme(
//         brightness: Brightness.light,
//         background: ColorConstants.lightScaffoldBackgroundColor,
//         cardBackground: Colors.amber,
//         primaryText: ColorConstants.secondaryAppColor,
//         secondaryText: ColorConstants.secondaryAppColor,
//         accentColor: ColorConstants.secondaryAppColor,
//         divider: ColorConstants.secondaryAppColor,
//         buttonBackground: ColorConstants.secondaryAppColor,
//         buttonText: ColorConstants.secondaryAppColor,
//         disabled: ColorConstants.secondaryAppColor,
//         error: Colors.red,
//       );
//
//   static ThemeData get darkTheme => createTheme(
//         brightness: Brightness.dark,
//         background: ColorConstants.darkScaffoldBackgroundColor,
//         cardBackground: Colors.grey,
//         primaryText: ColorConstants.secondaryBlackAppColor,
//         secondaryText: ColorConstants.secondaryBlackAppColor,
//         accentColor: ColorConstants.secondaryBlackAppColor,
//         divider: ColorConstants.secondaryBlackAppColor,
//         buttonBackground: ColorConstants.secondaryBlackAppColor,
//         buttonText: ColorConstants.secondaryBlackAppColor,
//         disabled: ColorConstants.secondaryBlackAppColor,
//         error: Colors.red,
//       );
// }

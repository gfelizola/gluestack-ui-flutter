import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/provider/theme_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:provider/provider.dart';

bool isBaseScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth < small;
}

bool isSmallScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= small;
}

bool isMediumScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= medium;
}

bool isLargeScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= large;
}

const base = 0;
const small = 360;
const medium = 600;
const large = 960;

GSStyle? resolveStyles(
  BuildContext context, {
  GSStyle? variantStyle,
  GSStyle? size,
  GSStyle? inlineStyle,
  Map<String, GSStyle?>? descendantStyles,
  List<String> descendantStyleKeys = const [],
}) {
  final theme = Provider.of<ThemeProvider>(context).currentTheme;
  GSStyle? temp = variantStyle != null
      ? variantStyle.merge(inlineStyle,
          descendantStyleKeys: descendantStyleKeys)
      : inlineStyle;

  temp = GSStyle(descendantStyles: descendantStyles)
      .merge(temp, descendantStyleKeys: descendantStyleKeys);

  GSStyle? currentGSStyle = size != null
      ? size.merge(temp, descendantStyleKeys: descendantStyleKeys)
      : temp;

  if (inlineStyle == null) {
    if (theme == GSThemeMode.dark) {
      return currentGSStyle.merge(variantStyle?.dark,
          descendantStyleKeys: descendantStyleKeys);
    }
  }
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && theme == GSThemeMode.dark) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSStyle? nestedStyle = resolveStyles(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);

        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSStyle? nestedStyle = resolveStyles(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStyles(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSStyle? nestedStyle = resolveStyles(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStyles(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }

      if (key == 'web' && kIsWeb) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
    }
  });

  return currentGSStyle;
}
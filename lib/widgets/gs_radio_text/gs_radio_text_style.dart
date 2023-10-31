import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_label.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';

final radioLabelStyle = GSStyle.fromMap(data: radioLabelData);

class GSRadioTextStyle {
  static Map<GSSizes, double?> labelSize = {
    GSSizes.xs: $GSFontSize.$xs,
    GSSizes.sm: $GSFontSize.$sm,
    GSSizes.md: $GSFontSize.$md,
    GSSizes.lg: $GSFontSize.$lg,
    GSSizes.xl: $GSFontSize.$xl,
  };
}
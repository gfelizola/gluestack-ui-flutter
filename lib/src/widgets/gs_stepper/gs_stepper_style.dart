import 'package:gluestack_ui/src/style/gs_style.dart';

import '../../style/gs_style_config.dart';

const GSStyleConfig gsStepperConfig = GSStyleConfig(
  componentName: 'Stepper',
  descendantStyle: ['_titleText', '_subtitleText', '_contentText', '_icon'],
);

final GSStyle gsStepperStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().stepper,
    descendantStyle: gsStepperConfig.descendantStyle);

// GSStyle baseStyle = GSStyle(
//   bg: gsStepperStyle.bg,
//   dark: GSStyle(bg: gsStepperStyle.bg),
// );

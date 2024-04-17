import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gstoastDescriptionConfig = GSStyleConfig(
  componentName: 'ToastDescription',
  ancestorStyle: ['_description'],
);
GSConfigStyle toastDescriptionStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().toastDescriptionText);

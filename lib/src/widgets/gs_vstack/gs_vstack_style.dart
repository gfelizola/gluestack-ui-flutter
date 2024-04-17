import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsVStackConfig = GSStyleConfig(componentName: 'VStack');

final vstackStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().vstack);

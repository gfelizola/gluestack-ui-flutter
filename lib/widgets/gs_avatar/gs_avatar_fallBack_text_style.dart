import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_fallback_text.dart';

GSStyle avatarFallBackStyle = GSStyle.fromMap(data: avatarFallBackTextData);
GSStyleConfig gsAvatarFallbackTextConfig =
    GSStyleConfig(componentName: 'AvatarFallbackText', ancestorStyle: ['_text']);
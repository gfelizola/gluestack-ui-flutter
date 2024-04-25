import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyle avatarBadgeStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().avatarBadge);

const GSStyleConfig gsAvatarBadgeStyle =
    GSStyleConfig(componentName: 'AvatarBadge', ancestorStyle: ['_badge']);

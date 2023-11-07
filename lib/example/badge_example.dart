import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_text.dart';

import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image.dart';

class BadgeExample extends StatelessWidget {
  const BadgeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSBadge(
              size: GSSizes.$lg,
              action: GSActions.muted,
              variant: GSVariants.outline,

              // borderRadius: 4,
              text: GSBadgeText('Halleluyah'),
            ),
            GSBadge(
              size: GSSizes.$sm,
              action: GSActions.info,
              variant: GSVariants.solid,
              iconData: Icons.info_outline,
              text: GSBadgeText(
                'information',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

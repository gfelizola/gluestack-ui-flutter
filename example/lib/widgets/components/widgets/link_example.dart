import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
          GSLink(
              style: GSStyle(),
              url: 'https://gluestack.io/',
              text: const GSLinkText(text: 'Go to Gluestack'),
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            theme.brightness == Brightness.dark ? $GSColors.trueGray800 : null,
        title: const GSText(
          text: "Link",
          size: GSSizes.$xl,
        ),
      ),
      body: Center(
        child: GSBox(
          style: GSStyle(
            dark: GSStyle(bg: $GSColors.black),
          ),
          child: BaseLayout(
            code: code,
            component: GSLink(
              style: GSStyle(),
              url: 'https://gluestack.io/',
              text: const GSLinkText(text: 'Go to Gluestack'),
            ),
          ),
        ),
      ),
    );
  }
}

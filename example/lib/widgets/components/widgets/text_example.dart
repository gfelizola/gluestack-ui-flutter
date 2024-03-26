import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
          GSText(
              text: 'This is an example of a simple text.',
              style: GSStyle(
                textStyle: const TextStyle(letterSpacing: \$GSLetterSpacing.\$lg),
              ),
           )
  ''';
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            theme.brightness == Brightness.dark ? $GSColors.trueGray800 : null,
        title: const GSText(
          text: "Text ",
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
            component: GSText(
              text: 'This is an example of a simple text.',
              // bold: true,
              // underline: true,
              style: GSStyle(
                textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

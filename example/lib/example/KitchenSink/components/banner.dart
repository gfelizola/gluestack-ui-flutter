import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class KSBanner extends StatelessWidget {
  const KSBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        color: $GSColors.backgroundLight900,
        height: $GSSpace.$16,
        dark: GSStyle(color:  $GSColors.red500), //Error: Does not work
        // dark: GSStyle(color: $GSColors.backgroundDark800), //TODO: replace when the above works!
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GSHStack(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GSText(
              text: 'Show total prices up front',
              size: GSSizes.$sm,
              style: GSStyle(
                dark: GSStyle(
                  textStyle:  TextStyle(color: $GSColors.textLight0),
                ),
                textStyle:  TextStyle(color: $GSColors.textLight0),
              ),
            ),
            GSBox(style: GSStyle(height: 10)),
            GSLink(
                url: 'https://ui.gluestack.io/',
                style: GSStyle(
                  textStyle:  TextStyle(color: $GSColors.red600),
                ), //Error: should not descendant style work here?
                text: GSLinkText(
                  text: "Learn More",
                  style: GSStyle(
                      textStyle:  TextStyle(
                        color: $GSColors.textLight0,
                        decoration: TextDecoration.underline,
                        decorationColor: $GSColors.textLight0,
                      ),
                      dark: GSStyle(
                        textStyle:
                             TextStyle(color: $GSColors.textDark200),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_checkbox/gs_checkbox_indicator_style.dart';

class GSCheckBoxIndicator extends StatelessWidget {
  final Widget child;
  final GSStyle? style;
  const GSCheckBoxIndicator({super.key, required this.child, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkBoxIndicatorConfig.descendantStyle.first];

    //use styleResolver to resolve Color state in future
    Color? resolvebgColor(
      GSConfigStyle? styler, {
      bool isHovered = false,
      bool isChecked = false,
      bool isDisabled = false,
      bool isInvalid = false,
      bool isActive = false,
    }) {
      if (isActive && isChecked) {
        return styler?.onActive?.checked?.bg?.getColor(context);
      } else if (isHovered && isChecked && isDisabled && isInvalid) {
        return styler?.onHover?.checked?.onDisabled?.onInvalid?.bg
            ?.getColor(context);
      } else if (isHovered && isChecked && isDisabled) {
        return styler?.onHover?.checked?.onDisabled?.bg?.getColor(context);
      } else if (isHovered && isDisabled && isInvalid) {
        return styler?.onHover?.onDisabled?.onInvalid?.bg?.getColor(context);
      } else if (isHovered && isDisabled) {
        return styler?.onHover?.onDisabled?.bg?.getColor(context);
      } else if (isHovered && isChecked) {
        return styler?.onHover?.checked?.bg?.getColor(context);
      } else if (isHovered) {
        return styler?.onHover?.bg?.getColor(context);
      } else if (isChecked) {
        return styler?.checked?.bg?.getColor(context);
      } else if (isInvalid) {
        return styler?.onInvalid?.bg?.getColor(context);
      } else if (isDisabled) {
        return styler?.onDisabled?.bg?.getColor(context);
      }

      return styler?.bg?.getColor(context);
    }

    //use styleResolver to resolve border state in future
    Color? resolveborderColor(GSConfigStyle? styler,
        {bool isHovered = false,
        isChecked = false,
        isDisabled = false,
        isInvalid = false,
        isActive = false}) {
      if (isInvalid) {
        return styler?.onInvalid?.borderColor?.getColor(context);
      } else if (isActive && isChecked) {
        return styler?.onActive?.checked?.borderColor?.getColor(context);
      } else if (isHovered && isChecked && isDisabled && isInvalid) {
        return styler?.onHover?.checked?.onDisabled?.onInvalid?.borderColor
            ?.getColor(context);
      } else if (isHovered && isChecked && isDisabled) {
        return styler?.onHover?.checked?.onDisabled?.borderColor
            ?.getColor(context);
      } else if (isHovered && isDisabled && isInvalid) {
        return styler?.onHover?.onDisabled?.onInvalid?.borderColor
            ?.getColor(context);
      } else if (isHovered && isDisabled) {
        return styler?.onHover?.onDisabled?.borderColor?.getColor(context);
      } else if (isHovered && isChecked) {
        return styler?.onHover?.checked?.borderColor?.getColor(context);
      } else if (isHovered) {
        return styler?.onHover?.borderColor?.getColor(context);
      } else if (isDisabled) {
        return styler?.onDisabled?.borderColor?.getColor(context);
      } else if (isChecked) {
        return styler?.checked?.borderColor?.getColor(context);
      }

      return styler?.borderColor?.getColor(context);
    }

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [checkBoxIndicatorStyle],
      inlineStyle: style,
      isFirst: true,
    );

    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.isChecked ?? false;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isActive = GSFocusableActionDetectorProvider.isActive(context);
    final isDisabled = value?.isDisabled ?? true;
    final isInvalid = value?.isInvalid ?? false;

    final bg = resolvebgColor(styler,
        isChecked: isChecked,
        isHovered: isHovered,
        isDisabled: isDisabled,
        isInvalid: isInvalid,
        isActive: isActive);
    final borderColor = resolveborderColor(styler,
            isChecked: isChecked,
            isHovered: isHovered,
            isDisabled: isDisabled,
            isInvalid: isInvalid,
            isActive: isActive) ??
        const Color(0xFF000000);

    return Container(
      margin: styler.margin,
      decoration: BoxDecoration(
        border:
            GSFocusableActionDetectorProvider.of(context)?.focusStatus ?? false
                ? Border.all(
                    width: ancestorCheckBoxStyle?.borderWidth ?? 1.0,
                    color: styler.onFocus?.color?.getColor(context) ??
                        $GSColors.primary400)
                : Border.all(
                    width: ancestorCheckBoxStyle?.borderWidth ?? 1.0,
                    color: const Color.fromARGB(0, 0, 0, 0)),
        borderRadius: BorderRadius.circular(styler.borderRadius ?? 0.0),
      ),
      child: Opacity(
        opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.0 : 1,
        child: Container(
          width: ancestorCheckBoxStyle?.height,
          height: ancestorCheckBoxStyle?.width,
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(
                width: ancestorCheckBoxStyle?.borderWidth ?? 1.0,
                color: borderColor),
            borderRadius: BorderRadius.circular(styler.borderRadius ?? 0.0),
          ),
          child: isChecked ? Center(child: child) : null,
        ),
      ),
    );
  }
}

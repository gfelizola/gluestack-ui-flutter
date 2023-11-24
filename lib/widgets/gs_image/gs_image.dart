import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_image/gs_image_style.dart';

enum GSImageType {
  network,
  file,
  asset,
}

class GSImage extends StatelessWidget {
  final String path;
  final GSImageType imageType;
  final GSStyle? style;
  final GSSizes? size;
  final GSBorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final int? cacheHeight;
  final int? cacheWidth;
  final Rect? centerSlice;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final BoxFit? fit;
  final bool excludeFromSemantics;
  final FilterQuality filterQuality;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  final bool gaplessPlayback;
  final Map<String, String>? headers;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final Animation<double>? opacity;
  final ImageRepeat repeat;
  final double scale;
  final String? semanticLabel;
  const GSImage({
    super.key,
    required this.path,
    required this.imageType,
    this.style,
    this.borderRadius = GSBorderRadius.$none,
    this.cacheHeight,
    this.cacheWidth,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    this.fit,
    this.size,
    this.frameBuilder,
    this.headers,
    this.loadingBuilder,
    this.opacity,
    this.semanticLabel,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.filterQuality = FilterQuality.low,
    this.alignment = Alignment.center,
    this.excludeFromSemantics = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = size ?? imageStyle.props!.size;

    final GSStyle styler = resolveStyles(
      context,
      size: GSImageStyle.size[imageSize],
      inlineStyle: style,
    )!;

    switch (imageType) {
      case GSImageType.network:
        return ClipRRect(
          borderRadius: borderRadius != GSBorderRadius.$none
              ? BorderRadius.circular($GSRadii.radiiMap[borderRadius]!)
              : BorderRadius.zero,
          child: Image.network(
            height: styler.height,
            width: styler.width,
            alignment: alignment,
            cacheHeight: cacheHeight,
            cacheWidth: cacheWidth,
            centerSlice: centerSlice,
            color: color,
            colorBlendMode: colorBlendMode,
            errorBuilder: errorBuilder,
            fit: fit,
            excludeFromSemantics: excludeFromSemantics,
            filterQuality: filterQuality,
            frameBuilder: frameBuilder,
            gaplessPlayback: gaplessPlayback,
            headers: headers,
            isAntiAlias: isAntiAlias,
            loadingBuilder: loadingBuilder,
            matchTextDirection: matchTextDirection,
            opacity: opacity,
            repeat: repeat,
            scale: scale,
            semanticLabel: semanticLabel,
            path,
          ),
        );
      case GSImageType.file:
        return ClipRRect(
          borderRadius: borderRadius != GSBorderRadius.$none
              ? BorderRadius.circular($GSRadii.radiiMap[borderRadius]!)
              : BorderRadius.zero,
          child: Image.file(
            height: styler.height,
            width: styler.width,
            alignment: alignment,
            cacheHeight: cacheHeight,
            cacheWidth: cacheWidth,
            centerSlice: centerSlice,
            color: color,
            colorBlendMode: colorBlendMode,
            errorBuilder: errorBuilder,
            fit: fit,
            excludeFromSemantics: excludeFromSemantics,
            filterQuality: filterQuality,
            frameBuilder: frameBuilder,
            gaplessPlayback: gaplessPlayback,
            isAntiAlias: isAntiAlias,
            matchTextDirection: matchTextDirection,
            opacity: opacity,
            repeat: repeat,
            scale: scale,
            semanticLabel: semanticLabel,
            File(path),
          ),
        );
      case GSImageType.asset:
        return ClipRRect(
          borderRadius: borderRadius != GSBorderRadius.$none
              ? BorderRadius.circular($GSRadii.radiiMap[borderRadius]!)
              : BorderRadius.zero,
          child: Image.asset(
            height: styler.height,
            width: styler.width,
            alignment: alignment,
            cacheHeight: cacheHeight,
            cacheWidth: cacheWidth,
            centerSlice: centerSlice,
            color: color,
            colorBlendMode: colorBlendMode,
            errorBuilder: errorBuilder,
            fit: fit,
            excludeFromSemantics: excludeFromSemantics,
            filterQuality: filterQuality,
            frameBuilder: frameBuilder,
            gaplessPlayback: gaplessPlayback,
            isAntiAlias: isAntiAlias,
            matchTextDirection: matchTextDirection,
            opacity: opacity,
            repeat: repeat,
            scale: scale,
            semanticLabel: semanticLabel,
            path,
          ),
        );
    }
  }
}

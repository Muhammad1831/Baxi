/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/destination.svg
  String get destination => 'assets/icons/destination.svg';

  /// File path: assets/icons/origin.svg
  String get origin => 'assets/icons/origin.svg';

  /// List of all assets
  List<String> get values => [destination, origin];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/baxi-bar.png
  AssetGenImage get baxiBar =>
      const AssetGenImage('assets/images/baxi-bar.png');

  /// File path: assets/images/baxi-box.png
  AssetGenImage get baxiBox =>
      const AssetGenImage('assets/images/baxi-box.png');

  /// File path: assets/images/baxi-car.png
  AssetGenImage get baxiCar =>
      const AssetGenImage('assets/images/baxi-car.png');

  /// File path: assets/images/baxi-women.png
  AssetGenImage get baxiWomen =>
      const AssetGenImage('assets/images/baxi-women.png');

  /// File path: assets/images/baxi.png
  AssetGenImage get baxi => const AssetGenImage('assets/images/baxi.png');

  /// File path: assets/images/car.png
  AssetGenImage get car => const AssetGenImage('assets/images/car.png');

  /// File path: assets/images/iran-flag.webp
  AssetGenImage get iranFlag =>
      const AssetGenImage('assets/images/iran-flag.webp');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/search-for-baxi.png
  AssetGenImage get searchForBaxi =>
      const AssetGenImage('assets/images/search-for-baxi.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatar,
        baxiBar,
        baxiBox,
        baxiCar,
        baxiWomen,
        baxi,
        car,
        iranFlag,
        logo,
        searchForBaxi
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

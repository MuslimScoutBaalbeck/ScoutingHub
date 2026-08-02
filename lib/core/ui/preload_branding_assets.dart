import 'package:flutter_svg/flutter_svg.dart';

abstract final class BrandingAssets {
  static const muslimScoutLogoSvg =
      'assets/branding/muslim_scout_logo.svg';
}

Future<void> preloadBrandingAssets() async {
  const loader = SvgAssetLoader(BrandingAssets.muslimScoutLogoSvg);

  await svg.cache.putIfAbsent(
    loader.cacheKey(null),
    () => loader.loadBytes(null),
  );
}

import 'dart:io';

import 'package:image/image.dart' as img;

const _assetPaths = <String>[
  'assets/branding/splash/muslim_scout_splash.png',
  'assets/branding/splash/muslim_scout_android12.png',
  'assets/branding/launcher/muslim_scout_icon.png',
  'assets/branding/launcher/muslim_scout_foreground.png',
  'assets/branding/launcher/muslim_scout_monochrome.png',
];

void main() {
  var processedFiles = 0;

  for (final path in _assetPaths) {
    final file = File(path);

    if (!file.existsSync()) {
      stderr.writeln('Skipped missing asset: $path');
      continue;
    }

    final source = img.decodePng(file.readAsBytesSync());

    if (source == null) {
      stderr.writeln('Unable to decode PNG: $path');
      continue;
    }

    for (final pixel in source) {
      final red = pixel.r.toInt();
      final green = pixel.g.toInt();
      final blue = pixel.b.toInt();

      final isNearWhite = red >= 245 && green >= 245 && blue >= 245;

      if (isNearWhite) {
        pixel
          ..r = 255
          ..g = 255
          ..b = 255
          ..a = 0;
      }
    }

    file.writeAsBytesSync(img.encodePng(source));
    stdout.writeln('Made transparent: $path');
    processedFiles++;
  }

  if (processedFiles == 0) {
    stderr.writeln(
      'No branding files were processed. Run '
      '`dart run tool/generate_branding_assets.dart` first.',
    );
    exitCode = 1;
    return;
  }

  stdout.writeln('Processed $processedFiles transparent branding assets.');
}

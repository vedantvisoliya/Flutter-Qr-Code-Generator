// lib/utils/web_download.dart
import 'package:flutter/foundation.dart';

/// This method will be replaced on web by web-specific logic.
Future<void> downloadFile(Uint8List data, String filename) async {
  if (kIsWeb) {
    throw UnsupportedError('Use web_download_web.dart for web.');
  } else {
    // Mobile or desktop: handle differently if needed
    throw UnsupportedError('Download not supported on this platform.');
  }
}